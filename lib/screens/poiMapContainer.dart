import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtk_flutter/model/topPoi.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

MapboxMapController? mapController;

Container poiMapContainer(BuildContext context, Poi poi
//,  LocationData? newPlace
    ) {
  void _onMapCreated(MapboxMapController controller) async {
    String sourceId = 'country-boundaries';
    String layerId = 'country-boundaries';
    dynamic _filter = 
    [
      "any",
      ["==", "iso_3166_1_alpha_3", "AUS"],
    ]; 
    //    dynamic _filter = 
    // [
    //   "any",
    //   ["==", "name", "Empire State Building"],
    // ];

    // controller.setFilter('poi-lable', [ "any", ["==", "name", "Empire State Building"]]);   
     controller.removeLayer('poi-labels');

    controller.addSource(
        sourceId,
        VectorSourceProperties(
          url: "mapbox://mapbox.country-boundaries-v1",
        //  url: "mapbox://mapbox.mapbox-streets_v8",
        ));

    // controller.addLayer(
    //     sourceId,
    //     layerId,
    //     FillLayerProperties(
    //       fillColor: '#F96167', //Coral #F96167
    //       fillOpacity: 0.2,
    //     ),
    //     sourceLayer: "country_boundaries",
    //    // sourceLayer: "poi_label",
    //     // filter: _filter
    //    filter: _filter);

    Future<Uint8List> loadMarkerImage() async {
      var byteData = await rootBundle.load("assets/Quokka-PNG-Pic.png");
      return byteData.buffer.asUint8List();
    }

    var markerImage = await loadMarkerImage();
    double _longitude = poi.geometry!['coordinates'][0] ?? 0.0;
    double _latitude = poi.geometry!['coordinates'][1] ?? 0.0;

    controller.addImage('QuokkaMarker', markerImage);


    await controller.addSymbol(SymbolOptions(
      iconSize: 0.2,
      iconImage: "QuokkaMarker",
      geometry:
          LatLng(poi.geometry!['coordinates'][1] ?? 0.0, poi.geometry!['coordinates'][0] ?? 0.0),
      iconOffset: const Offset(0, 0),
      textField: poi.poiId,
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

  void _onStyleLoaded() {

  }

  return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: Color.fromARGB(255, 49, 52, 59),
        elevation: 8.0,
        margin: EdgeInsets.all(2.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Container(
            height: 240,
            color: Colors.yellow,
            child:
                //newPlace != null
                //   ?
                MapboxMap(
              accessToken:
                  'pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw',
              onMapCreated: _onMapCreated,
              onStyleLoadedCallback: _onStyleLoaded,
              initialCameraPosition: CameraPosition(
                target: LatLng(

                  poi.geometry!['coordinates'][1], // latitude!,
                  poi.geometry!['coordinates'][0] // longitude!,
                ),
                zoom: 13.0,
              ),
              myLocationEnabled: true,
              myLocationTrackingMode: MyLocationTrackingMode.Tracking,
              myLocationRenderMode: MyLocationRenderMode.GPS,
              //minMaxZoomPreference:
              //    MinMaxZoomPreference(10.0, 18.0),
              styleString: 'mapbox://styles/mapbox/streets-v11',
              //styleString: 'mapbox://styles/mapbox/dark-v11',
              //styleString: 'mapbox://styles/mapbox/light-v11',
              //styleString: 'mapbox://styles/mapbox/satellite-v11',
              scrollGesturesEnabled: true,
              zoomGesturesEnabled: true,
              doubleClickZoomEnabled: true,
              rotateGesturesEnabled: true,
              tiltGesturesEnabled: true,
              dragEnabled: true,
            ),
            // : Center(
            //     child: CircularProgressIndicator(),
            //  ),
          ),
        ),
      )); // Container
}
