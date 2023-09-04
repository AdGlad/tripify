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
//DateTime _arrivaldate = DateTime.now();

TextEditingController descriptionController = TextEditingController();

Future saveMobileLocation(
  BuildContext context,
  List<IsoCountry2> isoCountryList,
  PlaceHistory? currentPlace,
  UserProfile? userProfile,
  List<Poi> poiList,
  //  UserTotals? userTotals,
  //  MapboxMapController? locationcontroller
) async {
  bool _mobileLocation = true;
  developer.log(' SaveMobileLocation ');

  LocationData? newPlace = await Location().getLocation();

  developer.log('photoLocation is false');
  _latitude = newPlace.latitude;
  _longitude = newPlace.longitude;

  await saveLocation(context, isoCountryList, currentPlace, userProfile,
      poiList, _latitude, _longitude,DateTime.now(), _mobileLocation
      //  UserTotals? userTotals,
      //  MapboxMapController? locationcontroller
      );
}

Future savePhotoLocation(
  BuildContext context,
  List<IsoCountry2> isoCountryList,
  PlaceHistory? currentPlace,
  UserProfile? userProfile,
  List<Poi> poiList,
  //  UserTotals? userTotals,
  //  MapboxMapController? locationcontroller
) async {
  Map<String, Object>? _exifData;
  bool _mobileLocation = false;
  DateTime _arrivaldate = DateTime.now();;
  developer.log(' savePhotoLocation ');
  await selectAndSaveImages(ImageSource.gallery);
  Exif exifData = await Exif.fromPath(selectedImages![0].path);
  developer.log(' ************* exifData ************* ');

  if (exifData != null) {
    ExifLatLong? latLong = await exifData.getLatLong();
    _arrivaldate = (await exifData.getOriginalDate())!;
    _exifData = await exifData.getAttributes();
    String _exifcheck = await exifData.toString();

    developer.log('photoLocation _exifcheck $_exifcheck');
    _latitude = latLong!.latitude;
    _longitude = latLong.longitude;
    developer.log(' LatLong found lat: $_latitude long: $_longitude ');
  } else {
    developer.log(' LatLong not found ');
  }

  await saveLocation(context, isoCountryList, currentPlace, userProfile,
      poiList, _latitude, _longitude, _arrivaldate, _mobileLocation
      //  UserTotals? userTotals,
      //  MapboxMapController? locationcontroller
      );
}

Future saveLocation(
  BuildContext context,
  List<IsoCountry2> isoCountryList,
  PlaceHistory? currentPlace,
  UserProfile? userProfile,
  List<Poi> poiList,
  double? latitude,
  double? longitude,
  DateTime arrivaldate,
  bool mobileLocation,
  //  UserTotals? userTotals,
  //  MapboxMapController? locationcontroller
) async {
  PlaceHistory newPlaceHistory;
  Future newplace;
  bool _latestLocation = false;

  // selectedImages = [];
  // imagePaths = [];
  int _newCountryCount = 0;
  String? _newCountryCode = '';

  developer.log(' SaveLocation ');
  developer.log('Form saved');
  developer
      .log(' ************* currentPlace ${currentPlace?.id} ************* ');

  //LocationData? newPlace = await Location().getLocation();

  //developer.log('photoLocation is false');
  //_latitude = newPlace.latitude;
  //_longitude = newPlace.longitude;
  _latitude = latitude;
  _longitude = longitude;

  String _userId = FirebaseAuth.instance.currentUser!.uid;
  CurrentUser currentUser = CurrentUser(
    id: FirebaseAuth.instance.currentUser!.uid,
    userId: FirebaseAuth.instance.currentUser!.uid,
  );

  FirestoreService firestoreService = FirestoreService();
  CurrentCountryCollectionReference countyRef =
      currentuserRef.doc(currentUser.userId).country;

  newPlaceHistory = await fetchNewPlace(_latitude, _longitude, arrivaldate);

  //  .then((value) async {
  // int currentVisitNumber;
  int newVisitNumber;

  bool? saveform = await popupForm(context, newPlaceHistory, mobileLocation);

  if (saveform == true) {
    developer.log(
        'Getting location for ${_latitude.toString()} , ${_longitude.toString()}');

    newVisitNumber = currentPlace?.visitnumber ?? 0;
    //newVisitNumber = 0;

    if (newPlaceHistory.latitude != null && newPlaceHistory.longitude != null) {
      developer.log('newVisitNumber is $newVisitNumber');

      await mapController
          ?.animateCamera(
            CameraUpdate.newCameraPosition(
              CameraPosition(
                bearing: 0.0,
                target: LatLng(
                  newPlaceHistory.latitude!,
                  newPlaceHistory.longitude!,
                ),
                tilt: 30.0,
                zoom: 17.0,
              ),
            ),
          )
          .then((result) =>
              print("mapController.animateCamera() returned $result"));
    }

    int  distanceInMeters = Geolocator.distanceBetween(
            currentPlace?.latitude ?? newPlaceHistory.latitude!,
            currentPlace?.longitude ?? newPlaceHistory.longitude!,
            newPlaceHistory.latitude!,
            newPlaceHistory.longitude!)
        .toInt();

    developer.log('Discance in meters ${distanceInMeters.toString()}');
    developer.log('CurrentCountry');

    CurrentCountry newcountry = CurrentCountry(
        countryCode: newPlaceHistory.countryCode!,
        countryName: newPlaceHistory.countryName!,
        userId: _userId);
    developer.log('setCountry');

//  logic to just check for new country (Not new trip)

    if ((userProfile!.countrycodelist!.isEmpty) ||
        (userProfile.countrycodelist!.contains(newPlaceHistory.countryCode) !=
            true)) {
       _newCountryCount = 1;
      _newCountryCode = newPlaceHistory.countryCode;
      developer.log(
          'New Country identified. CurrentPlace ${currentPlace?.countryCode} NewPlace ${newPlaceHistory.countryCode} ');


      controllerConfetti.play();
      playsound();
    } else {
          _newCountryCount = 0;
          _newCountryCode = '';
    }
    // }
    developer.log('isoCountry2List before');

    String? _isoregionCode =
        IsoCountry2GetCode(isoCountryList, newPlaceHistory.regionCode!);

    developer.log('isoCountry2List before');
    if (_isoregionCode == null) {
      developer.log('_isoregionCode is null');
    }
    Region region = Region(
        regionCode: _isoregionCode,
        region: newPlaceHistory.region!,
        countryCode: newPlaceHistory.countryCode!,
        userId: _userId,
        apiregionCode: newPlaceHistory.regionCode!);

    RegionCollectionReference regionRef =
        countyRef.doc(newcountry.countryCode).region;

    //showPopupForm(context);

    developer.log('showPopupForm after2');

    newPlaceHistory.name = newPlaceHistory.countryName;
    newPlaceHistory.location = newPlaceHistory.countryName;
    newPlaceHistory.distance = distanceInMeters.toDouble();
    newPlaceHistory.apiregionCode = newPlaceHistory.regionCode!;
    newPlaceHistory.regionCode = _isoregionCode;
    newPlaceHistory.visitnumber = newVisitNumber;

    developer.log('PlaceHistoryCollectionReference');

    PlaceHistoryCollectionReference placehistoryRef =
        regionRef.doc(region.regionCode).placehistory;
    developer.log('addPlaceHistory');
    final batch = FirebaseFirestore.instance.batch();
    //final WriteBatch batch = firestore.batch();

    await setCountry(batch, countyRef, newcountry);
    await setRegion(batch, newPlaceHistory.countryCode, regionRef, region);

    DocumentReference placehistoryDocRef =
        await addPlaceHistory(batch, placehistoryRef, newPlaceHistory);

    developer.log(
        'addPlaceHistory batch done DocumentReference placehistoryDocRef ');
    developer.log('saveImagesToFirestore before ');

    void _saveImagesToFirestore =
        await saveImagesToFirestore(batch, placehistoryDocRef);
    developer.log('saveImagesToFirestore done ');

    void _check_poi = await check_poi(
        context, batch, newPlaceHistory, placehistoryDocRef, poiList);

    developer.log('newPlaceHistory.arrivaldate ${newPlaceHistory.arrivaldate} ');
    developer.log('currentPlace!.arrivaldate ${currentPlace!.arrivaldate} ');
    if (newPlaceHistory.arrivaldate!.isAfter(currentPlace!.arrivaldate!))
    {
      _latestLocation = true;

    }
    else
    {
     _latestLocation = false;

    }
   
    developer.log('_latestLocation = ${_latestLocation.toString()} ');


    await _incrementStreak(
        batch,
        _newCountryCount,
        _newCountryCode,
        distanceInMeters,
        newPlaceHistory,
        _latestLocation);
 
    developer.log('_incrementStreak done ');

    // if (result == true) {
    print('Form saved');
    //developer.log(' waited for showPopupForm to complete Form');

    try {
      // Commit the batch
      await batch.commit();
      print('Batch write successful');
    } catch (e) {
      print('Error AG performing batch write: $e');
    }
  } else {
    print('Form canceled');
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
  // }
  // } else {
  //   developer.log('Form canceled');
  // return;
  // }
  //await _updateStats(userTotals!);
}

Future<void> _incrementStreak(
    WriteBatch batch,
    num? newCountryCount,
    String? newCountryCode,
    int? distanceInMeters,
    PlaceHistory place,
    bool latestLocation) async {
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

    if (latestLocation == true) {
          developer.log('full latestLocation = ${latestLocation.toString()} ');

    batch.update(
      userdocRef,
      {
        'lastRecordedDate': DateTime.now(),
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
        'distancetotal': FieldValue.increment(distanceInMeters as num),
        'regioncount': FieldValue.increment(1),
        'placescount': FieldValue.increment(1),
        //   'countryvisitlist': FieldValue.arrayUnion(
        //        [place.countryCode! + '-' + newVisitNumber.toString()]),
      },
    );
    } else {
    developer.log('less latestLocation = ${latestLocation.toString()} ');

          batch.update(
      userdocRef,
      {
        'currentstreak': FieldValue.increment(newStreak),
        'countrycount': FieldValue.increment(newCountryCount as num),
      //  'distancetotal': FieldValue.increment(distanceInMeters as num),
        'regioncount': FieldValue.increment(1),
        'placescount': FieldValue.increment(1),
        //   'countryvisitlist': FieldValue.arrayUnion(
        //        [place.countryCode! + '-' + newVisitNumber.toString()]),
      },
    );
    }

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

Future<PlaceHistory> fetchNewPlace(
    double? latitude, double? longitude, DateTime arrivaldate) async {
  PlaceHistory? _placeHistory = PlaceHistory(
      userId: FirebaseAuth.instance.currentUser!.uid,
      city: '',
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
      timestamp: arrivaldate.millisecondsSinceEpoch,
      arrivaldate: arrivaldate);

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
                        style: TextStyle(fontSize: 12),
                        appState.currentPlace!.poiGroupIds![0]),
                    content: Column(
                      children: [
                        Text(
                            // appState.currentPlace!.poiName!,
                            style: TextStyle(fontSize: 12),

                            //  placeHistory.streetAddress!),
                            //  style: TextStyle(fontSize: 12),

                            //  'Region: ${appState.currentPlace?.region} \n Country: ${CountryFlag(appState.currentPlace!.location!)}   ${CountryFlag(appState.currentPlace!.countryCode!)}'),

                            //    'Do you want to share your streak of $_currentStreak days?'),
                            'Woo Hoo! Share with friends?'),
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
                                // 'Tripify: Hi, I am visiting ${appState.currentPlace?.region} in ${appState.currentPlace?.name} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
                                'Tripify: Hi, I am visiting ${appState.currentPlace?.poiName} in ${appState.currentPlace?.name} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
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
    BuildContext context, PlaceHistory newPlaceHistory, bool mobileLocation
    //   WriteBatch batch,
//DocumentReference<Object?> placeHistoryId
    ) async {
  return showDialog<bool>(
    context: context,
    builder: (BuildContext context) {
      descriptionController.text = 'Visting ${newPlaceHistory.poi}';
      return AlertDialog(
          title: Text(CountryFlag(newPlaceHistory.countryCode!) + ' ${newPlaceHistory.countryName} ' +
              ' ${newPlaceHistory.city}'),
          content:
              // Text('Do you want to save the form?'),
              //   SingleChildScrollView(
              //    child:
              Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  // Text(
                  //   'Address: ',
                  //   textAlign: TextAlign.left,
                  //   style: TextStyle(
                  //     color: const Color.fromARGB(255, 176, 75, 75),
                  //     fontSize: 10.0,
                  //     fontWeight: FontWeight.w900,
                  //   ),
                  //   softWrap: true,
                  //   maxLines: 2,
                  // ),
                  Expanded(
                    child: Text('${newPlaceHistory.streetAddress}',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        )),
                  ),
                ],
              ),
              TextFormField(
                autofocus: true,
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Diary Entry',
                  labelStyle: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
               mobileLocation ? Container(
                  alignment: Alignment.centerLeft,
                  //   padding: EdgeInsets.all(5.0),
                  //  margin: EdgeInsets.all(5.0) ,
                  child: Text(' Select Photo',
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w700,
                      ))) : Text(''),
              mobileLocation ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      elevation: 5,
                    ),
                    onPressed: () async {
                      await selectAndSaveImages(ImageSource.gallery);
                    },
                    child: Text('Gallery'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      elevation: 5,
                    ),
                    onPressed: () async {
                      await selectAndSaveImages(ImageSource.camera);
                    },
                    child: Text('Camera'),
                  ),
                ],
              ) : Text(''),
            ],
          ),
          // ),
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

Future<void> selectAndSaveImages(ImageSource _imagesource) async {
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

Future<void>? check_poi(
    BuildContext context,
    WriteBatch batch,
    PlaceHistory newPlace,
    DocumentReference<Object?> placeHistoryId,
    List<Poi> poiList) async {
  developer.log('In check_poi');
  final userdocRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final docSnapshot = await userdocRef.get();
  //For loop for each appState.poiList
  for (Poi poi in poiList) {
    developer.log('In poiList for loop for ${poi.name}');

    double distanceInMeters = Geolocator.distanceBetween(
        newPlace.latitude ?? 0.0,
        newPlace.longitude ?? 0.0,
        poi.latitude!,
        poi.longitude!);

    // Compare distance between two lat long points
    if (distanceInMeters <= (poi.poiRadius ?? 1000.toDouble())) {
      // Match
      developer.log(
          'Match ${poi.name} Distance=$distanceInMeters Radius=${poi.poiRadius ?? 1000}');

      controllerConfettiGold.play();
      playsound();

      batch.update(placeHistoryId, {
        'poiId': poi.id,
        'poiName': poi.name,
        'poiGroupIds': FieldValue.arrayUnion([poi.groupId!]),
      });

      final snackBar = SnackBar(
          duration: Duration(seconds: 10),
          backgroundColor: Color.fromARGB(255, 4, 153, 233),
          content: Text(
              style: TextStyle(fontSize: 20),
              'Woo Hoo. Bucket List Location!  ${poi.groupId ?? 'poiGroupId'}. Share with friends?'),
          action: SnackBarAction(
            label: 'SHARE',
            onPressed: () {
              FlutterShare.share(
                //  title: 'My Streak',
                title: 'My Location',
                text:
                    'Tripify: Hi, I am visiting ${poi.name} in ${newPlace.city} ${CountryFlag(newPlace.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
                chooserTitle: 'Share on social media',
              );
              Navigator.of(context).pop();
            },
          )
          //],
          );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);

      // _showShareTopLocation(
      //      context, newPlace, poi.name, poi.category, poi.groupId);

      if (docSnapshot.exists) {
        developer.log('docSnapshot exists}');
        Map<String, dynamic> poiMap = {
          "id": poi.id,
          "poiId": poi.poiId,
          "name": poi.name,
          "category": poi.category,
          "maki": poi.maki,
          "groupId": poi.groupId
        };

        batch.update(
          userdocRef,
          {
            "poi": FieldValue.arrayUnion([poiMap]),
          },
        );
      }
    } else {
      // No Match
      developer.log(
          'No Match ${poi.name} Distance=$distanceInMeters Radius=${poi.poiRadius ?? 1000}');
    }
  }
}
