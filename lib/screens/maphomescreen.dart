//import 'dart:developer';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
//import 'package:gtk_flutter/model/placehistory.dart';
//import 'package:gtk_flutter/src/delete_location.dart' as triplocation;
import 'package:mapbox_gl/mapbox_gl.dart';
//import 'package:latlong2/latlong.dart';
import 'package:location/location.dart';
import 'dart:developer' as developer;
//import 'dart:convert';
//import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:gtk_flutter/state/applicationstate.dart';

class HomeMap extends StatefulWidget {
  HomeMap({super.key});

  LocationData? currentPlace;

  @override
  State<HomeMap> createState() => _HomeMapState();
}

class _HomeMapState extends State<HomeMap> {
  //final Location _location = Location();
  //LatLng currentPlace = LatLng();
  late MapboxMapController _mapController;
  Location _location = Location();

  @override
  void initState() {
    super.initState();
    _getLocation();
  }

  void _onMapCreated(MapboxMapController controller) {
    _mapController = controller;
  }

  void _getLocation() async {
    try {
      var locationData = await _location.getLocation();
      setState(() {
        widget.currentPlace = locationData;
        //currentPlace = _currentPlace;
        developer.log(widget.currentPlace!.latitude.toString(),
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
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: Consumer<ApplicationState>(
            builder: (context, appState, _) =>

                //widget.currentPlace != null
                // ?
                //body: myLocation != null
                MapboxMap(
                  accessToken:
                      'pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw',
                  onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                    target:
                        //myLocation,
                        LatLng(
                      appState.currentPlace?.latitude ?? 0.0,
                      appState.currentPlace?.longitude ?? 0.0,
//                      widget.currentPlace!.latitude!,
                      //                     widget.currentPlace!.longitude!,
                    ),
                    zoom: 14.0,
                  ),
                  myLocationEnabled: true,
                  myLocationTrackingMode: MyLocationTrackingMode.Tracking,
                  myLocationRenderMode: MyLocationRenderMode.GPS,
                  minMaxZoomPreference: MinMaxZoomPreference(10.0, 18.0),
                  styleString: 'mapbox://styles/mapbox/streets-v11',
                ))

        // : Center(
        //     child: CircularProgressIndicator(),
        //   ),
        );
  }
}
