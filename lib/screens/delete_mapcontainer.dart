import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
//import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'dart:developer' as developer;
import 'package:provider/provider.dart';
import 'package:gtk_flutter/state/applicationstate.dart';
import 'package:gtk_flutter/src/globals.dart' as globals;
import 'package:http/http.dart' as http;

class HomeMap extends StatefulWidget {
  const HomeMap({super.key});

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  //final Location _location = Location();
  //LatLng _currentPlace = LatLng();
  MapboxMapController? controller;
  LocationData? _currentPlace;
  Location _location = Location();
  LatLng? _newLatLng;

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  Future<void> addImageFromAsset(String name, String assetName) async {
    final ByteData bytes = await rootBundle.load(assetName);
    final Uint8List list = bytes.buffer.asUint8List();
    return controller!.addImage(name, list);
  }

  // Future<void> addImageFromUrl(String name, Uri uri) async {
  //   var response = await http.get(uri);
  //   return controller!.addImage(name, response.bodyBytes);
  // }

  void _onStyleLoaded() {
    //addImageFromAsset("assetImage", "assets/symbols/custom-icon.png");
    // addImageFromUrl(
    //     "networkImage", Uri.parse("https://via.placeholder.com/50"));
  }

  Future<Uint8List> loadMarkerImage() async {
    var byteData = await rootBundle.load("assets/Quokka-PNG-Pic.png");
    return byteData.buffer.asUint8List();
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
  }
  // void _onMapCreated(MapboxMapController controller) {
  //   this.controller = controller;
  //   controller = controller;

  //   // controller.addSymbol(SymbolOptions(
  //   //   geometry: LatLng(
  //   //       //-33.775382, 151.273449 //Manly Vail
  //   //       -33.760181,
  //   //       151.284136 //Manly Vail
  //   //       //     //40.6943, -73.9249
  //   //       // _currentPlace!.latitude!,
  //   //       // _currentPlace!.longitude!,
  //   //       ),
  //   //   iconImage: 'QuokkaMarker',
  //   //   textField: 'You were here',
  //   //   textOffset: Offset(0, 0.8),
  //   //   //iconSize: 20,
  //   // ));

  //   // controller.addImage(
  //   //     'quokka', AssetImage('assets/Quokka-PNG-Pic.png', package: 'my_icons'));
  // }

  void _getLocation() async {
    try {
      var locationData = await _location.getLocation();
      setState(() {
        _currentPlace = locationData;
        //globals.new_latitude = _currentPlace!.latitude;
        //globals.new_longitude = _currentPlace!.longitude;
        // controller.addSymbol(SymbolOptions(
        //   geometry: LatLng(
        //     //-33.775382, 151.273449 //Manly Vail
        //     //-33.760181,
        //     //     //151.284136 //Manly Vail
        //     //     //40.6943, -73.9249
        //     _currentPlace!.latitude!,
        //     _currentPlace!.longitude!,
        //   ),
        //   //   iconImage: 'assets/Quokka-PNG-Pic.png',
        //   //   iconSize: 20,
        // ));
        //currentPlace = _currentPlace;
        developer.log(_currentPlace!.latitude.toString(),
            name: 'my.app.urlstring');
      });
    } catch (e) {
      print('Could not get the location: $e');
    }
  }

//LatLng myLocation = (51.5090214, -0.1982948);
  //static final myLocation = LatLng(51.5090214, -0.1982948);
  //static final myLocation = LatLng(, -0.1982948);

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, _) => Container(
              child: _currentPlace != null
                  ? MapboxMap(
                      accessToken:
                          'pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw',
                      onMapCreated: _onMapCreated,
                      onStyleLoadedCallback: _onStyleLoaded,
                      initialCameraPosition: CameraPosition(
                        target:
                            // appState.newLatLng()
                            //myLocation,
                            LatLng(
                          //-33.775382, 151.273449 //Manly Vail
                          // -33.760181,
                          // 151.284136 //Manly Vail
                          //40.6943, -73.9249
                          //_currentPlace!.latitude!,
                          //_currentPlace!.longitude!,
                          appState.currentPlace?.latitude ?? 0.0,
                          appState.currentPlace?.longitude ?? 0.0,
                        ),
                        zoom: 13.0,
                      ),
                      myLocationEnabled: true,
                      myLocationTrackingMode: MyLocationTrackingMode.Tracking,
                      myLocationRenderMode: MyLocationRenderMode.GPS,
                      minMaxZoomPreference: MinMaxZoomPreference(10.0, 18.0),
                      styleString: 'mapbox://styles/mapbox/streets-v11',
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
            ));
  }
}
