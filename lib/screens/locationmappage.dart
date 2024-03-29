import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gtk_flutter/model/placehistory.dart';
//import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';
//import 'package:file_picker/file_picker.dart';
import '../state/applicationstate.dart';
import 'dart:developer' as developer;

class LocationMapPage extends StatefulWidget {
  // final LatLng latlng;
  final PlaceHistory placeHistory;

  const LocationMapPage({Key? key, required this.placeHistory})
      : super(key: key);

  @override
  _LocationMapPageState createState() => _LocationMapPageState();
}

class _LocationMapPageState extends State<LocationMapPage> {
  final _controller = ScreenshotController();
  late MapboxMapController _mapController;

  Future<Uint8List> loadMarkerImage() async {
    var byteData = await rootBundle.load("assets/Quokka-PNG-Pic.png");
    return byteData.buffer.asUint8List();
  }

  void _onMapCreated(MapboxMapController controller) async {
    var markerImage = await loadMarkerImage();
    controller.addImage('QuokkaMarker', markerImage);

    await controller.addSymbol(SymbolOptions(
      iconSize: 0.4,
      iconImage: "QuokkaMarker",
      // geometry: LatLng(-33.760181, 151.284136),
      geometry:
          //LatLng(_currentPlace!.latitude!, _currentPlace!.longitude!),
          LatLng(widget.placeHistory.latitude!, widget.placeHistory.longitude!),

//          LatLng(_currentPlace!.latitude!, _currentPlace!.longitude!),
      iconOffset: const Offset(0, 0),
      textField:
          'You were here \n ${DateFormat('hh:mm a dd MMM yy').format(widget.placeHistory.arrivaldate!)}',
      textOffset: Offset(0, 2.5),
      // textColor: '#ffffff',
      textColor: '#000000',
      //textHaloBlur: 1,
      //textHaloColor: '#ffffff',
      //textHaloWidth: 0.8,
      textSize: 18,
    ));

    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Previous location'),
        ),
        body: Consumer<ApplicationState>(
            builder: (context, appState, _) =>

                //widget.currentPlace != null
                // ?
                //body: myLocation != null
                Center(
                  child: Screenshot(
                    controller: _controller,
                    child: Stack(children: [
                      MapboxMap(
                        accessToken:
                            'pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw',
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target:
                              //myLocation,
                              LatLng(
                            widget.placeHistory.latitude!,
                            widget.placeHistory.longitude!,
                            //                     widget.currentPlace!.longitude!,
                          ),
                          zoom: 14.0,
                        ),
                        myLocationEnabled: true,
                        myLocationTrackingMode: MyLocationTrackingMode.Tracking,
                        myLocationRenderMode: MyLocationRenderMode.GPS,
                        minMaxZoomPreference: MinMaxZoomPreference(10.0, 18.0),
                        styleString: 'mapbox://styles/mapbox/streets-v11',
                        scrollGesturesEnabled: true,
                        zoomGesturesEnabled: true,
                        doubleClickZoomEnabled: true,
                        rotateGesturesEnabled: true,
                        tiltGesturesEnabled: true,
                        dragEnabled: true,
                      ),
                      Positioned(
                        bottom: 16.0,
                        right: 16.0,
                        //child: Screenshot(
                        //  controller: _controller,
                        child: FloatingActionButton(
                            child: Text(
                                style: TextStyle(fontSize: 10),
                                'Share \n Location'),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        title: Text('ScreenShot'),
                                        content: Text('Do you want share?'),
                                        actions: [
                                          TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: Text('CANCEL'),
                                          ),
                                          TextButton(
                                            child: Text('Share'),
                                            onPressed: () {
                                              developer.log(
                                                  "Share button pressed",
                                                  name:
                                                      'tripify.scheenshot.directory');
                                              printscreen();
                                              shareScreenshot();
                                              // TODO: add marker
                                              developer.log("Return",
                                                  name:
                                                      'tripify.scheenshot.directory');

                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ));
                            }),
                        //)
                      )
                    ]),
                  ),
                )));
  }

  // final _controller = ScreenshotController();

  void printscreen() async {
    developer.log("Print Screen", name: 'tripify.scheenshot.directory');
  }

  Future<void> shareScreenshot() async {
    developer.log("In shareScreenshot", name: 'tripify.scheenshot.directory');

    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }

    developer.log(directory.toString(), name: 'tripify.scheenshot.directory');

    final String localPath =
        '${directory!.path}/${DateTime.now().toIso8601String()}.png';
    developer.log(localPath, name: 'tripify.scheenshot.directory');

    await _controller.captureAndSave(localPath);

    await Future.delayed(Duration(seconds: 1));

    await FlutterShare.shareFile(
        title: 'Tripify', filePath: localPath, fileType: 'image/png');
  }
}
