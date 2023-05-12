import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:gtk_flutter/src/globals.dart' as globals;

import '../../state/applicationstate.dart';
import '../ActiveCountryPage.dart';

MapboxMapController? mapController;


Container UserMapContainer(BuildContext context, UserProfile user, ApplicationState appState,   LocationData? newPlace)

   {
    return                  
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width - 20,
                          height: 240,
                          color: Colors.yellow,
                          child: newPlace != null
                              ? MapboxMap(
                                  accessToken:
                                      'pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw',
                                  onMapCreated: _onMapCreated,
                                  onStyleLoadedCallback: _onStyleLoaded,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(
                                      appState.currentPlace?.latitude ??
                                          newPlace!.latitude!,
                                      appState.currentPlace?.longitude ??
                                          newPlace!.longitude!,
                                    ),
                                    zoom: 13.0,
                                  ),
                                  myLocationEnabled: true,
                                  myLocationTrackingMode:
                                      MyLocationTrackingMode.Tracking,
                                  myLocationRenderMode: MyLocationRenderMode.GPS,
                                  minMaxZoomPreference:
                                      MinMaxZoomPreference(10.0, 18.0),
                                  styleString:
                                      'mapbox://styles/mapbox/streets-v11',
                                  //styleString: 'mapbox://styles/mapbox/dark-v11',
                                  //   styleString: 'mapbox://styles/mapbox/light-v11',
                                  //styleString: 'mapbox://styles/mapbox/satellite-v11',
                                  scrollGesturesEnabled: true,
                                  zoomGesturesEnabled: true,
                                  doubleClickZoomEnabled: true,
                                  rotateGesturesEnabled: true,
                                  tiltGesturesEnabled: true,
                                  dragEnabled: true,
                                )
                              : Center(
                                  child: CircularProgressIndicator(),
                                ),
                        ),
                      ),
                    );
   }

  void _onMapCreated(MapboxMapController controller) async {
    var markerImage = await loadMarkerImage();

    controller.addImage('QuokkaMarker', markerImage);

    await controller.addSymbol(SymbolOptions(
      iconSize: 0.2,
      iconImage: "QuokkaMarker",
      // geometry: LatLng(-33.760181, 151.284136),
      geometry:
          //LatLng(_currentPlace!.latitude!, _currentPlace!.longitude!),
          LatLng(globals.new_latitude!, globals.new_longitude!),

//          LatLng(_currentPlace!.latitude!, _currentPlace!.longitude!),
      iconOffset: const Offset(0, 0),
      textField: 'You were here',
      textOffset: Offset(0, 0.8),
      // textColor: '#ffffff',
      textColor: '#000000',
      textHaloBlur: 1,
      textHaloColor: '#ffffff',
      textHaloWidth: 0.8,
      textSize: 12.5,
    ));

    mapController = controller;
  }
 Future<Uint8List> loadMarkerImage() async {
    var byteData = await rootBundle.load("assets/Quokka-PNG-Pic.png");
    return byteData.buffer.asUint8List();
  }

  void _onStyleLoaded() {
    //addImageFromAsset("assetImage", "assets/symbols/custom-icon.png");
    // addImageFromUrl(
    //     "networkImage", Uri.parse("https://via.placeholder.com/50"));
  }