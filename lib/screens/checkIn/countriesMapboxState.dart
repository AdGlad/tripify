// Copyright 2018 The Chromium Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'dart:async';
//import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

import '../../state/applicationstate.dart';
import 'dart:developer' as developer;

//import 'main.dart';
//import 'page.dart';

// class PlaceSourcePage extends ExamplePage {
//   PlaceSourcePage() : super(const Icon(Icons.place), 'Place source');

//   @override
//   Widget build(BuildContext context) {
//     return const CountriesMapbox();
//   }
// }

class CountriesMapbox extends StatefulWidget {
  const CountriesMapbox();

  @override
  State<StatefulWidget> createState() => CountriesMapboxState();
}
// class MapLayerProperties implements LayerProperties {
//     final dynamic circleRadius;

//}

class CountriesMapboxState extends State<CountriesMapbox> {
  CountriesMapboxState();

  static const SOURCE_ID = 'sydney_source';
  static const LAYER_ID = 'sydney_layer';

  bool sourceAdded = false;
  bool layerAdded = false;
  late MapboxMapController controller;
//    source: "countries-no-simplification",

  void _onMapCreated(
      List<String>? countrycodelist, MapboxMapController controller) {
    this.controller = controller;
    String sourceId = 'country-boundaries';
    String layerId = 'country-boundaries';

    String countryFilterString = '';

    controller.addSource(
        sourceId,
        VectorSourceProperties(
          url: "mapbox://mapbox.country-boundaries-v1",
        ));

    if (countrycodelist == null || countrycodelist.isEmpty) {
      developer.log('Country code list is either null or empty.');
    } else {
      print("Country code list is not empty.");
    }

// for (String countryCode in countrycodelist!) {
//   countryFilterString += '$countryFilterString-$countryCode-';
// }

//     developer.log('countryFilterString $countryFilterString');

// Source id: mapbox.country-boundaries-v1
// https://docs.mapbox.com/data/tilesets/reference/mapbox-countries-v1/
// Mapbox Countries v1 tileset.
// Mapbox Countries v1 is a free, Mapbox-provided vector tileset
// This tileset contains one layer, country_boundaries
// This layer contains the boundary polygons representing all countries and territories with a unique ISO 3166-1 code.


    // for (String countryCode in countrycodelist!) {
    //   countryFilterString += '["==", "iso_3166_1_alpha_3", "$countryCode"],';
    // }
dynamic _filter ;
List<dynamic> filterExpressions = [];
       _filter = [];
      //  [
      //    "any",
      //    ["==", "iso_3166_1_alpha_3", "NON"],
      //  ];

    //  if (countrycodelist == null || countrycodelist.isEmpty) {
    //    _filter = [
    //      "any",
    //      ["==", "iso_3166_1_alpha_3", "NON"],
    //    ];
    //  } else {


      for (String countryCode in countrycodelist!) {
         //   developer.log('countryCode1: $countryCode');

       // filterExpressions.add(['"=="', '"iso_3166_1_alpha_3"', '"${countryCode}"']);
       // filterExpressions.add(['"=="', '"iso_3166_1"', '"${countryCode.toUpperCase()}"']);
        filterExpressions.add(["==", "iso_3166_1", "${countryCode.toUpperCase()}"]);



      //   countryFilterString += '["==", "iso_3166_1_alpha_3", "$countryCode"],';



      //  _filter = 
      //  ["any",
      //       ["==", "iso_3166_1_alpha_3", 'VAT'],
      //       ["==", "iso_3166_1_alpha_3", 'AUS'],
      //       ["==", "iso_3166_1_alpha_3", 'SYC'],
      //       ["==", "iso_3166_1_alpha_3", 'USA'],
      //       ["==", "iso_3166_1_alpha_3", 'FRA']
      //    ];
     }
    developer.log('filterExpressions: $filterExpressions');

           // dynamic  _filter1 = ["any", ...filterExpressions];
//dynamic  _filter1 =[];

     dynamic _filter1 = filterExpressions.isEmpty
    ?  [
         "any",
         ["==", "iso_3166_1_alpha_3", "NON"],
       ]
    :  ["any", ...filterExpressions];

    developer.log('Final Filter Expression: $_filter1');


// _filter1 = ["any", 
// ["==", "iso_3166_1", "au"], 
// ["==", "iso_3166_1", "mx"], 
// ["==", "iso_3166_1", "cn"], 
// ["==", "iso_3166_1", "it"], 
// ["==", "iso_3166_1", "FR"], 
// ["==", "iso_3166_1", "es"], 
// ["==", "iso_3166_1", "GB"], 
// ];

    developer.log('Dummy Filter Expression: $_filter1');

    controller.addLayer(
        sourceId,
        layerId,
        FillLayerProperties(
          fillColor: '#F96167', //Coral #F96167
          fillOpacity: 0.8,
        ),
        sourceLayer: "country_boundaries",
       // filter: _filter 
        filter: _filter1
        );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ApplicationState>(
        builder: (context, appState, _) => Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                SizedBox(
                  height: 300.0,
                  child: MapboxMap(
                    //     : null,
                    styleString: 'mapbox://styles/mapbox/streets-v11',
                    //  styleString: 'mapbox://styles/mapbox/dark-v11',
                    accessToken:
                        'pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw',
                    onMapCreated: (MapboxMapController controller) {
                      controller.setTelemetryEnabled(
                          false); // Optional: disable telemetry

                      _onMapCreated(
                          appState.userProfile?.countrycodelist, controller);
                    },
//       onMapCreated: _onMapCreated,
                    initialCameraPosition: const CameraPosition(
                      // target: LatLng(5, 46),
                      //  target: LatLng(-4.6796, 55.4920),
                      target: LatLng(35, 20),
                      zoom: 0.1,
                      //zoom: 8.50,
                    ),
                  ),
                ),
              ],
            )); // Column
  }
}
