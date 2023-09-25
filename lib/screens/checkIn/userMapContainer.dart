import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:path_provider/path_provider.dart';

import '../../src/firebaseImage.dart';
import '../UserInfo/UserInfoPage.dart';

MapboxMapController? mapController;

Container UserMapContainer(BuildContext context, UserProfile? user
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

  

  Future<Uint8List> fileToUint8List(File file) async {
  final List<int> bytes = await file.readAsBytes();
  return Uint8List.fromList(bytes);
}

    Future<Uint8List> loadMarkerImage() async {

    File? avatarfile = await getImageFile(user!.avatar! );
    Uint8List uint8List = await avatarfile!.readAsBytes();
   //var byteData = ByteData.sublistView(Uint8List.fromList(uint8List));
  //final File? iconimage = await getImageFile("images/0qlNcVgclFZNSASXXPbX44ae1vo2/image_picker_23DB7424-17CB-4F69-AD84-0006CC60DF81-22716-00000B523613886F.jpg");
   
  //final List<int> bytes = await iconimage!.readAsBytes();      
      var byteData = await rootBundle.load("assets/Quokka-PNG-Pic.png");
     //   return Uint8List.fromList(bytes);

      return byteData.buffer.asUint8List();
    //}
    }

    var markerImage = await loadMarkerImage();

    controller.addImage('QuokkaMarker', markerImage);

    await controller.addSymbol(SymbolOptions(
      iconSize: 0.2,
      iconImage: "QuokkaMarker",
      // geometry: LatLng(-33.760181, 151.284136),
      geometry:
          //LatLng(_currentPlace!.latitude!, _currentPlace!.longitude!),
          // LatLng(globals.new_latitude!, globals.new_longitude!),
          LatLng(user?.latestlatitude ?? 0.0, user?.latestlongitude ?? 0.0),

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

  void _onStyleLoaded() {
    //addImageFromAsset("assetImage", "assets/symbols/custom-icon.png");
    // addImageFromUrl(
    //     "networkImage", Uri.parse("https://via.placeholder.com/50"));
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
            // width: MediaQuery.of(context).size.width - 20,
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
                  user!.latestlatitude!,
                  user!.latestlongitude!,
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
Future<File?> getImageFile(String storagePath) async {
  final tempDir = await getTemporaryDirectory();
  final fileName = storagePath.split('/').last;
  final file = File('${tempDir.path}/$fileName');

  // If the file do not exists try to download
  if (!file.existsSync()) {
  //if (true) {
    try {
      file.create(recursive: true);
    
      final ref =  FirebaseStorage.instance.ref(storagePath);
      await ref.writeToFile(file);
    //  await FirebaseStorage.instance.ref(storagePath).writeToFile(file);
    } catch (e) {
      // If there is an error delete the created file
      await file.delete(recursive: true);
      return null;
    }
  }
  return file;
}