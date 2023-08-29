import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as developer;
import 'package:gtk_flutter/model/placehistory.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/checkIn/userMapContainer.dart';
import 'package:gtk_flutter/screens/checkIn/userSelectPhotos.dart';
import 'package:gtk_flutter/src/temp.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:native_exif/native_exif.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../map/src/isocountry2.dart';
import '../../model/poi-to-visit.dart';
import '../../state/applicationstate.dart';
//import '../ActiveCountryPage.dart';
import 'checkcountry.dart';
import '../country/ActiveCountryPage.dart';

List<XFile>? selectedImages = [];
List<String> imagePaths = [];
double? _latitude = 0.0;
double? _longitude = 0.0;
TextEditingController descriptionController = TextEditingController();

Future saveLocation(
  BuildContext context,
  List<IsoCountry2> isoCountryList,
  PlaceHistory? currentPlace,
  UserProfile? userProfile,
  List<Poi> poiList,
  //  UserTotals? userTotals,
  //  MapboxMapController? locationcontroller
) async {
  selectedImages = [];
  imagePaths = [];
  int _newCountryCount = 0;
  String? _newCountryCode = '';

  developer.log(' SaveLocation ');

  bool? userPhotoLocation = await photoLocationPopupForm(context);

  bool? saveform = await popupForm(context);

  if (saveform!) {
    developer.log('Form saved');
    developer
        .log(' ************* currentPlace ${currentPlace!.id} ************* ');

    //final PermissionStatus status = await Permission.location.request();

    LocationData? newPlace = await Location().getLocation();

    if (userPhotoLocation == true) {
      developer.log(' selectedImages  ${selectedImages![0].path}  ');

      developer.log('photoLocation is true');
      Exif exifData = await Exif.fromPath(selectedImages![0].path);
      developer.log(' ************* exifData ************* ');
      if (exifData != null) {
        ExifLatLong? latLong = await exifData.getLatLong();
        _latitude = latLong!.latitude;
        _longitude = latLong.longitude;
        developer.log(' LatLong found lat: $_latitude long: $_longitude ');
      } else {
        developer.log(' LatLong not found ');
      }
    } else {
      developer.log('photoLocation is false');
      _latitude = newPlace.latitude;
      _longitude = newPlace.longitude;
      // return;
    }

//    double? _latitude = newPlace.latitude;
//    double? _longitude = newPlace.longitude;

    String _userId = FirebaseAuth.instance.currentUser!.uid;
    CurrentUser currentUser = CurrentUser(
      id: FirebaseAuth.instance.currentUser!.uid,
      userId: FirebaseAuth.instance.currentUser!.uid,
      //    email: FirebaseAuth.instance.currentUser!.email,
      //    displayname: FirebaseAuth.instance.currentUser!.displayName
    );

    FirestoreService firestoreService = FirestoreService();

    // Future<String> _messageCurrentUser =
    //     firestoreService.setCurrentUser(currentUser);
    CurrentCountryCollectionReference countyRef =
        currentuserRef.doc(currentUser.userId).country;
    //"Tokyo","35.6839","139.7744"
    // "New York","40.6943","-73.9249"
    //"Mexico City","19.4333","-99.1333"
    // Beijing","39.9040","116.4075"
    // Jakarta","-6.2146","106.8451"

    // Rio de Janeiro
    //_latitude = -22.9068;
    //_longitude = -43.1729;

    // Deli
    //_latitude = 28.7041;
    //_longitude = 77.1025;
    // Somalia
    //_latitude = 5.1521;
    //_longitude = 46.1996;

    // New York
    //_latitude = 40.6943;
    //_longitude = -73.9249;

    // Seychelles
    //_latitude = -4.6796;
    //_longitude = 55.4920;

    // San Francisco
    //_latitude = 37.7749;
    //_longitude = -122.4194;
    //Rome
    //_latitude = 41.9028;
    //_longitude= 12.4964;

    // Darwin Australia
    //_longitude= 130.8456;
    // _latitude = -12.4634;

    //Yorkshire  _longitude= -1.1439;
    // _latitude = 53.8108;
    // _longitude= -1.1439;

    // Leeds longitude= -1.5491;
    // _latitude = 53.8008;

    //Madrid
    //_latitude = 40.416775;
    // _longitude= -3.703790;
    //double
    //_latitude = 35.6839;
    //double
    //_longitude = 139.7744;

    //_latitude = 19.4333; // Mexico
    //_longitude = -99.1333; // Mexico
    // _latitude = 48.856614; // French Fair
    // _longitude = 2.3522219;

    // Empire State Builder _latitude = 40.74844162658724 _longitude = -73.98565918207169
     _latitude = 40.74844162658724 ;
     _longitude = -73.98565918207169;
    // London Eye _latitude =51.50318735304264 _longitude = -0.11944598989508606

    // Trafalgar Square _latitude = 51.50798872115172 _longitude = -0.12802451848983765

    // The Little Mermaid in Copenhagen, Denmark _latitude = 55.69289152978713 _longitude = 12.599126876148214

    // _latitude = 48.85845474720703; // eiffel tower
    //_longitude = 2.294502761972394;
    // Empire State Building longitude= -73.9857; latitude = 40.7484
    //_latitude = 1.290270; // Singapore Airport
    //_longitude = 103.851959;
    //_latitude = -6.2146;
    // double
    //_longitude = 106.8451;

    // _latitude = 39.9040; //Beijing
    // _longitude = 116.4075; //Beijing
    // _latitude = 40.6943; //New York"
    // _longitude = -73.9249;//New York"

    //       _latitude = 51.50853; //London
    // _longitude = -0.12574;//London

    //         _latitude = 55.95206; //Edinburgh
    // _longitude = -3.19648;//Edinburgh

    //double _latitude = -6.2146;
    //double _longitude = 106.8451;

    // if (loc.latitude != null && loc.longitude != null) {

    await fetchNewPlace(_latitude, _longitude).then((value) async {
      // int currentVisitNumber;
      int newVisitNumber;

      developer.log(
          'Getting location for ${_latitude.toString()} , ${_longitude.toString()}');

      newVisitNumber = currentPlace.visitnumber ?? 0;
      //newVisitNumber = 0;

      if (value.latitude != null && value.longitude != null) {
        developer.log('newVisitNumber is $newVisitNumber');

        mapController
            ?.animateCamera(
              CameraUpdate.newCameraPosition(
                CameraPosition(
                  bearing: 270.0,
                  target: LatLng(
                    value.latitude!,
                    value.longitude!,
                  ),
                  tilt: 30.0,
                  zoom: 17.0,
                ),
              ),
            )
            .then((result) =>
                print("mapController.animateCamera() returned $result"));
      }

      int distanceInMeters = Geolocator.distanceBetween(
              currentPlace.latitude ?? value.latitude!,
              currentPlace.longitude ?? value.longitude!,
              value.latitude!,
              value.longitude!)
          .toInt();
      developer.log('Discance in meters ${distanceInMeters.toString()}');
      developer.log('CurrentCountry');

      CurrentCountry newcountry = CurrentCountry(
          countryCode: value.countryCode!,
          countryName: value.countryName!,
          userId: _userId);
      developer.log('setCountry');

      if ((currentPlace.countryCode == null) ||
          (currentPlace.countryCode != value.countryCode!)) {
        _newCountryCount = 1;
        _newCountryCode = value.countryCode;
        developer.log(
            'New Country identified. CurrentPlace ${currentPlace.countryCode} NewPlace ${value.countryCode} ');

        newVisitNumber++;

        controllerConfetti.play();
        playsound();
      } else {
        _newCountryCount = 0;
        _newCountryCode = '';
      }

      developer.log('Region');

      developer.log('isoCountry2List Provider');

      // List<IsoCountry2> isoCountry2List = Provider.of<ApplicationState>(context).IsoCountry2List;

      developer.log('isoCountry2List before');

      String? _isoregionCode =
          IsoCountry2GetCode(isoCountryList, value.regionCode!);

      developer.log('isoCountry2List before');
      // Check for null _isoregionCode
      if (_isoregionCode == null) {
        developer.log('_isoregionCode is null');
      }
      Region region = Region(
          regionCode: _isoregionCode,
          region: value.region!,
          countryCode: value.countryCode!,
          userId: _userId,
          apiregionCode: value.regionCode!);
      developer.log('regionRef');

      RegionCollectionReference regionRef =
          countyRef.doc(newcountry.countryCode).region;

      developer.log('PlaceHistory');
      developer.log('showPopupForm before');

      //showPopupForm(context);

      developer.log('showPopupForm after2');

      PlaceHistory newPlace = PlaceHistory(
        userId: value.userId,
        name: value.countryName,
        location: value.countryName,
        latitude: value.latitude,
        distance: distanceInMeters.toDouble(),
        longitude: value.longitude,
        poi: value.poi,
        streetAddress: value.streetAddress,
        city: value.city,
        countryName: value.countryName,
        countryCode: value.countryCode,
        postal: value.postal,
        region: value.region,
        apiregionCode: value.regionCode!,
        regionCode: _isoregionCode,
        elevation: value.elevation,
        timezone: value.timezone,
        locationRaw: value.locationRaw,
        timestamp: value.timestamp, // DateTime.now().millisecondsSinceEpoch,
        arrivaldate: value.arrivaldate, // DateTime.now()
        visitnumber: newVisitNumber,
        //imagePaths: value.imagePaths,
      );
      developer.log('PlaceHistoryCollectionReference');

      PlaceHistoryCollectionReference placehistoryRef =
          regionRef.doc(region.regionCode).placehistory;
      developer.log('addPlaceHistory');
      final batch = FirebaseFirestore.instance.batch();
      //final WriteBatch batch = firestore.batch();

      await setCountry(batch, countyRef, newcountry);
      await setRegion(batch, value.countryCode, regionRef, region);

      DocumentReference placehistoryDocRef =
          await addPlaceHistory(batch, placehistoryRef, newPlace);

      developer.log(
          'addPlaceHistory batch done DocumentReference placehistoryDocRef ');

      await _incrementStreak(batch, _newCountryCount, _newCountryCode,
          newVisitNumber, distanceInMeters, value);
      developer.log('_incrementStreak done ');

      // //Future<dynamic>
      //  var cancelyesno = await
      //     showPopupForm(context, newPlace, placehistoryDocRef.id);
      // developer.log('showPopupForm1 after results [$cancelyesno]');

      //bool? result = await showPopupForm(context, newPlace, placehistoryDocRef.id);

      //Future<bool?> result =   showPopupForm(context, newPlace, placehistoryDocRef.id);
      //bool? result =  await showPopupForm(context, batch ,newPlace,  placehistoryDocRef);
      // bool? result = await showPopupForm(context, batch, placehistoryDocRef);

      developer.log('saveImagesToFirestore before ');

      void _saveImagesToFirestore =
          await saveImagesToFirestore(batch, placehistoryDocRef);
      developer.log('saveImagesToFirestore done ');

      void _check_poi =
          await check_poi(batch, newPlace, placehistoryDocRef, poiList);

      // if (result == true) {
      //   print('Form saved');
      // } else {
      //   print('Form canceled');
      // }
      //developer.log(' waited for showPopupForm to complete Form');

      try {
        // Commit the batch
        await batch.commit();
        print('Batch write successful');
      } catch (e) {
        print('Error AG performing batch write: $e');
      }
      developer.log('commit batch done');
      developer.log('placehistory update after');
      descriptionController.clear();
      developer.log('save imagePaths 0 Length ${imagePaths.length} ');

      imagePaths.clear();
      imagePaths = [];
      selectedImages?.clear();

      developer.log('save imagePaths 1 Length ${imagePaths.length} ');

      // showPopupForm(context, newPlace, placehistoryDocRef.id);
    });
  } else {
    developer.log('Form canceled');
    return;
  }
  //await _updateStats(userTotals!);
}

Future<void> _incrementStreak(
    WriteBatch batch,
    int? newCountryCount,
    String? newCountryCode,
    int newVisitNumber,
    int? distanceInMeters,
    PlaceHistory place) async {
//Future<void> _incrementStreak(UserProfile user, PlaceHistory place) async {
  developer.log('_incrementStreak ${place.countryCode}');
  int newStreak = 0;
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final userdocRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);

  final docSnapshot = await userdocRef.get();
  developer.log('docSnapshot }');

  if (docSnapshot.exists) {
    developer.log('docSnapshot exists}');

    final lastRecordedDate = docSnapshot.data()!['lastRecordedDate'].toDate();

    if (lastRecordedDate.isBefore(today)) {
      newStreak = 1;
    }

    batch.update(
      userdocRef,
      {
        'lastRecordedDate': today,
        'currentstreak': FieldValue.increment(newStreak),
        'latestlongitude': place.longitude,
        'latestlatitude': place.latitude,
        'lateststreetAddress': place.streetAddress,
        'latestcountryName': place.countryName,
        'latestcountryCode': place.countryCode,
        'latestpostal': place.postal,
        'latestregion': place.region,
        'latestregionCode': place.regionCode,
        'countrycount': FieldValue.increment(newCountryCount as num),
        'visitcount': newVisitNumber,
        'distancetotal': FieldValue.increment(distanceInMeters as num),
        'regioncount': FieldValue.increment(1),
        'placescount': FieldValue.increment(1),
        'countryvisitlist': FieldValue.arrayUnion(
            [place.countryCode! + '-' + newVisitNumber.toString()]),
      },
    );

    if (newCountryCode != null && newCountryCode.isNotEmpty) {
      batch.update(
        userdocRef,
        {
          'countrycodelist': FieldValue.arrayUnion([newCountryCode]),
        },
      );
    }
  }
}

void playsound() async {
  AudioPlayer player = AudioPlayer();
  String audioasset = "newcountry.wav";
  await player.setSource(AssetSource(audioasset));
  await player.setVolume(1.0);
  await player.resume();
}

Future<PlaceHistory> fetchNewPlace(double? latitude, double? longitude) async {
  PlaceHistory? _placeHistory = PlaceHistory(
      userId: FirebaseAuth.instance.currentUser!.uid,
      city: 'city',
      countryCode: 'countryCode',
      postal: 'postal',
      longitude: longitude,
      latitude: latitude,
      location: 'location',
      region: 'region',
      countryName: 'countryName',
      name: 'name',
      streetAddress: 'streetAddress',
      regionCode: 'regionCode',
      elevation: 0,
      timezone: 'timezone',
      timestamp: DateTime.now().millisecondsSinceEpoch,
      arrivaldate: DateTime.now());

  var jsonString;
  String accessToken =
      "pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw";

  String urlString = "https://api.mapbox.com/geocoding/v5/mapbox.places/" +
      longitude.toString() +
      "," +
      latitude.toString() +
      ".json?limit=1&access_token=" +
      accessToken;
  var res = await http.get(
    Uri.parse(urlString),
  );
  developer.log(urlString, name: 'my.app.urlstring');
  _placeHistory.locationRaw = res.body;
  developer.log(res.body, name: 'my.app.category');
  jsonString = jsonDecode(res.body);

  developer.log(jsonString.toString(), name: 'my.app.jsonString');

  var features = jsonString['features'];

  for (var feature in features) {
    _placeHistory.streetAddress = feature['place_name'];

    _placeHistory.poi = feature['text'];

    //_placeHistory.poi ='new poi';

    developer.log('placeHistory.poi  ${_placeHistory.poi}');

    if (feature.isNotEmpty) {
      Map<String, dynamic> properties = feature['properties'];
      if (properties != null && properties.containsKey('category')) {
        String categoryValue = properties['category'];
        developer.log(
            'categoryValue ${categoryValue}'); // Output: art gallery, art galleries, galleries, painting, art, gallery, tourism
      } else {
        print('Category field is missing or empty');
      }
    } else {
      print('No features found');
    }
    var context = feature['context'];

    for (var item in context) {
      String id = item['id'];

      if (id.startsWith('country')) {
        _placeHistory.countryName = item['text'];
        _placeHistory.countryCode = item['short_code'];
      } else if (id.startsWith('postcode')) {
        _placeHistory.postal = item['text'];
      } else if (id.startsWith('region')) {
        _placeHistory.region = item['text'];
        _placeHistory.regionCode = item['short_code'];
        _placeHistory.name = item['short_code'];
      } else if (id.startsWith('place')) {
        if ((_placeHistory.regionCode == 'regionCode') &
            (item['short_code'] != null)) {
          _placeHistory.regionCode = item['short_code'];
        }

        if ((_placeHistory.region == 'region') & (item['text'] != null)) {
          _placeHistory.region = item['text'];
        }

        if ((_placeHistory.countryCode == 'countryCode') &
            (item['short_code'] != null)) {
          _placeHistory.countryCode = item['short_code'];
        }

        if ((_placeHistory.countryName == 'countryName') &
            (item['text'] != null)) {
          _placeHistory.countryName = item['text'];
        }

        _placeHistory.city = item['text'];
      }
    }
  }
  return _placeHistory;
}

void _showShareDialog(BuildContext context, PlaceHistory placeHistory) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
          child: Consumer<ApplicationState>(
              builder: (context, appState, _) => AlertDialog(
                    title: Text(
                        style: TextStyle(fontSize: 12), 'Location Details'),
                    content: Column(
                      children: [
                        Text(
                            style: TextStyle(fontSize: 12),
                            placeHistory.streetAddress!),
                        Text(
                            style: TextStyle(fontSize: 12),

                            //  'Region: ${appState.currentPlace?.region} \n Country: ${CountryFlag(appState.currentPlace!.location!)}   ${CountryFlag(appState.currentPlace!.countryCode!)}'),

                            //    'Do you want to share your streak of $_currentStreak days?'),
                            'Share location with friends?'),
                      ],
                    ),
                    //    'Share location with friends? ${appState.currentPlace?.location} ?'),
                    //   'Share location with friends? of ${appState.userProfile?.currentstreak} days?'),
                    actions: <Widget>[
                      TextButton(
                        child: Text('CANCEL', style: TextStyle(fontSize: 12)),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('SHARE', style: TextStyle(fontSize: 12)),
                        onPressed: () {
                          String flags = '';
                          // for (var item in appState.tripHistory) {
                          //   flags = flags + CountryFlag(item.countryCode!);
                          // }
                          for (var item
                              in appState.userProfile!.countryvisitlist!) {
                            flags = flags + CountryFlag(item);
                          }
                          FlutterShare.share(
                            //  title: 'My Streak',
                            title: 'My Location',
                            text:
                                //  'Tripify: I have a $_currentStreak day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                'Tripify: Hi, I am visiting ${appState.currentPlace?.region} in ${appState.currentPlace?.name} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
                            chooserTitle: 'Share on social media',
                          );
                          // TODO: Implement share functionality
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  )));
    },
  );
}

Future<void> setCountry(
    WriteBatch batch,
    CurrentCountryCollectionReference countryref,
    CurrentCountry currentcountry) async {
  String urlString =
      "https://restcountries.com/v3.1/alpha/" + currentcountry.countryCode;
  var res = await http.get(
    Uri.parse(urlString),
  );
  var jsonString;
  jsonString = jsonDecode(res.body);

  developer.log(res.body, name: 'my.app.category');

  String? capital =
      jsonString.isNotEmpty && jsonString[0].containsKey('capital')
          ? (jsonString[0]['capital'] as List<dynamic>).isNotEmpty
              ? jsonString[0]['capital'][0].toString()
              : null
          : null;

  //if (jsonString[0]!.containsKey('capital')) {
  //  String capital = jsonString[0]['capital'][0];
  //       }
  //       else
  //       capital = 'capital';

  // String capital = jsonString[0]['capital'][0];
  String subregion = jsonString[0]['subregion'];
  String region = jsonString[0]['region'];
  int population = jsonString[0]['population'];
  List<double> latlng = List<double>.from(jsonString[0]['latlng']);
  String timezones = jsonString[0]['timezones'].toString();
  String numericCode = jsonString[0]['ccn3'];
  Map<String, String> flags = Map<String, String>.from(jsonString[0]['flags']);
  Map currencies = jsonString[0]['currencies'];

  String flag = jsonString[0]['flag'];
  double longitude = jsonString[0]['latlng'][0];
  double latitude = jsonString[0]['latlng'][1];
  String currencycode = 'CO';
  String currencyname = currencies.values.first['name'];
  String currencysymbol = currencies.values.first['symbol'];

  for (var code in currencies.keys) {
    Map currency = currencies[code];
    currencycode = code;
    String name = currency['name'];
    String symbol = currency['symbol'];
    currentcountry.capital = capital;
    currentcountry.subregion = subregion;
    currentcountry.region = region;
    currentcountry.population = population;
    currentcountry.timezones = timezones;
    currentcountry.numericCode = numericCode;
    currentcountry.flag = flag;
    currentcountry.longitude = longitude;
    currentcountry.latitude = latitude;
    currentcountry.currencycode = currencycode;
    currentcountry.currencyname = currencyname;
    currentcountry.currencysymbol = currencysymbol;

    /// DocumentReference docRef =
    //    countryref.doc(currentcountry.countryCode) as DocumentReference;

//  final DocumentReference doccRef  =
    //    currentuserRef.doc(FirebaseAuth.instance.currentUser!.uid).country.doc(currentcountry.countryCode);

    DocumentReference docRef = FirebaseFirestore.instance
        .collection('currentuser')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('country')
        .doc(currentcountry.countryCode);

    batch.set(docRef, currentcountry.toJson());
    developer.log('batch set currentcountry');
  }
}

Future<void> setRegion(WriteBatch batch, String? countrycode,
    RegionCollectionReference regionref, Region currentregion) async {
//    DocumentReference docRef =
//        regionref.doc(currentregion.regionCode) as DocumentReference;

  DocumentReference docRef = FirebaseFirestore.instance
      .collection('currentuser')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('country')
      .doc(countrycode)
      .collection('region')
      .doc(currentregion.regionCode);

  batch.set(docRef, currentregion.toJson());
  developer.log('batch set region');
}

Future<DocumentReference> addPlaceHistory(WriteBatch batch,
    PlaceHistoryCollectionReference placehistoryref, PlaceHistory place) async {
  //      DocumentReference docRef =
  //  placehistoryref as DocumentReference;
  developer.log('addPlaceHistory');

  DocumentReference docRef = FirebaseFirestore.instance
      .collection('currentuser')
      .doc(FirebaseAuth.instance.currentUser!.uid)
      .collection('country')
      .doc(place.countryCode)
      .collection('region')
      .doc(place.regionCode)
      .collection('placehistory')
      .doc();

// Write new placehistory document

  batch.set(docRef, place.toJson());
  developer.log('addPlaceHistory docRef $docRef');

  return docRef;
}

/////// New Sequence  //////

Future<bool?> popupForm(
  BuildContext context,
  //   WriteBatch batch,
//DocumentReference<Object?> placeHistoryId
) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text('Trip Details'),
          content:
              // Text('Do you want to save the form?'),
              Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Thoughts',
                ),
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      await _selectAndSaveImages(ImageSource.gallery);
                    },
                    child: Text('Image From Gallery'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await _selectAndSaveImages(ImageSource.camera);
                    },
                    child: Text('Image From Camera'),
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
                descriptionController.clear();
                developer
                    .log('cancel imagePaths 1 Length ${imagePaths.length} ');
                imagePaths.clear();
                imagePaths = [];
                selectedImages?.clear();

                developer
                    .log('cancel imagePaths 2 Length ${imagePaths.length} ');
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(true);
                //     await _saveImagesToFirestore(batch, placeHistoryId);
                //     Navigator.of(context).pop(true);
                //     // descriptionController.clear();
                //     // imagePaths.clear();
              },
              child: Text('Save'),
            ),
          ]);
    },
  );
}

Future<bool?> photoLocationPopupForm(
  BuildContext context,
  //   WriteBatch batch,
//DocumentReference<Object?> placeHistoryId
) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text('Location Method'),
          content: Text('Check-in by photo location?'),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text('Photo'),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.of(context).pop(false);
              },
              child: Text('Mobile'),
            ),
          ]);
    },
  );
}

Future<void> _selectAndSaveImages(ImageSource _imagesource) async {
  developer.log('imagePaths 1 Length ${imagePaths.length} ');

  imagePaths.clear();
  imagePaths = [];
  selectedImages?.clear();

  developer.log('imagePaths 2 Length ${imagePaths.length} ');

  XFile? selectedImage = await ImagePicker().pickImage(source: _imagesource);
  if (selectedImage != null) {
    developer.log('selectedImage is not null ');

    selectedImages?.add(selectedImage);
  }
  // developer.log('imagePaths 3 Length ${selectedImages?[0]} ');
  // developer.log('imagePaths 4 Length $selectedImage ');
}

Future<Reference> saveImageToCloudStorage(XFile imageFile) async {
  String fileName = imageFile.name;
  File? _image = File(imageFile.path);

  Reference storageReference = FirebaseStorage.instance
      .ref()
      .child('images/${FirebaseAuth.instance.currentUser!.uid}/$fileName');
  UploadTask uploadTask = storageReference.putFile(_image);

  await uploadTask.whenComplete(() => print('Image uploaded'));

//final storageRef = FirebaseStorage.instance.ref();

  Directory appDirectory = await getApplicationDocumentsDirectory();
  //String fileName = imageFile.path.split('/').last;
  String savedImagePath = '${appDirectory.path}/$fileName';
  File(imageFile.path).copy(savedImagePath);
  return storageReference;
}

Future<void> saveImagesToFirestore(  
    WriteBatch batch, DocumentReference<Object?> placeHistoryId) async {
  developer.log('saveImagesToFirestore');

  if (selectedImages!.isNotEmpty) {
    developer.log(' selectedImages is not null ${selectedImages![0].path}   ');

    for (XFile imageFile in selectedImages!) {
      developer.log(' imageFile is not null ${imageFile.path}   ');

      // String imagePath = await _saveImageToDirectory(imageFile);
      Reference imagePath = await saveImageToCloudStorage(imageFile);

      imagePaths.add(imagePath.fullPath);
    }
  } else {
    developer.log('selectedImages is null');
  }
  CollectionReference placehistoryref =
      FirebaseFirestore.instance.collection('placehistory');
//final placehistoryRef = PlaceHistoryCollectionReference;
  developer.log('placehistory update before');

  batch.update(placeHistoryId, {
    'rating': '5 Stars',
    // 'poi': 'place of interest',
    'description': descriptionController.text,
    'imagePaths': imagePaths
  });
}

Future<void>? check_poi(WriteBatch batch, PlaceHistory newPlace,
    DocumentReference<Object?> placeHistoryId, List<Poi> poiList) {
    developer.log('In check_poi');

  //For loop for each appState.poiList
  for (Poi poi in poiList) {
    developer.log('No Match ${poi.name}');

        double distanceInMeters = Geolocator.distanceBetween(
            newPlace.latitude ?? 0.0,
            newPlace.longitude ?? 0.0,
            poi.latitude!,
            poi.longitude!);

    // Compare distance between two lat long points
    if (distanceInMeters <= 1000) {
      // Match
      developer.log('Match ${poi.name} Distance $distanceInMeters');
    } else {
      // No Match
      developer.log('No Match ${poi.name}  $distanceInMeters');
    }

    // if (newPlace.poi == poi.poi) {
    //   batch.update(placeHistoryId, {
    //     'poi': poi.poi,
    //     'rating': poi.rating,
    //     'description': poi.description,
    //   });
    // }
  }
  ;

  // if newPlace.poi == appState.poiList[i].poi
  //    batch.update(placeHistoryId, {
  //    'poi': appState.poiList[i].poi,
  //    'rating': appState.poiList[i].rating,
  //    'description': appState.poiList[i].description,
}
