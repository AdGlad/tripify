import 'dart:convert';

import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:developer' as developer;
import 'package:gtk_flutter/model/placehistory.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/checkIn/userMapContainer.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';

import '../../state/applicationstate.dart';
//import '../ActiveCountryPage.dart';
import 'checkcountry.dart';
import '../country/ActiveCountryPage.dart';

Future saveLocation(
  BuildContext context,
  PlaceHistory? currentPlace,
  UserProfile? userProfile,
  //  UserTotals? userTotals,
  //  MapboxMapController? locationcontroller
) async {
  developer.log(' SaveLocation ');

  LocationData? newPlace = await Location().getLocation();

  String _userId = FirebaseAuth.instance.currentUser!.uid;
  CurrentUser currentUser = CurrentUser(
    id: FirebaseAuth.instance.currentUser!.uid,
    userId: FirebaseAuth.instance.currentUser!.uid,
    //    email: FirebaseAuth.instance.currentUser!.email,
    //    displayname: FirebaseAuth.instance.currentUser!.displayName
  );

  FirestoreService firestoreService = FirestoreService();

  Future<String> _messageCurrentUser =
      firestoreService.setCurrentUser(currentUser);
  CurrentCountryCollectionReference countyRef =
      currentuserRef.doc(currentUser.userId).country;
  //"Tokyo","35.6839","139.7744"
  // "New York","40.6943","-73.9249"
  //"Mexico City","19.4333","-99.1333"
// Beijing","39.9040","116.4075"
// Jakarta","-6.2146","106.8451"

  double? _latitude = newPlace.latitude;
  double? _longitude = newPlace.longitude;

  //double
  //_latitude = 35.6839;
  //double
  //_longitude = 139.7744;

  //  _latitude = 19.4333; // Mexico
  // _longitude = -99.1333; // Mexico

  // double
  //_latitude = -6.2146;
  // double
  //_longitude = 106.8451;

  // _latitude = 39.9040; //Beijing
  // _longitude = 116.4075; //Beijing
  //   _latitude = 40.6943; //New York"
  // _longitude = -73.9249;//New York"

  //       _latitude = 51.50853; //London
  // _longitude = -0.12574;//London

  //         _latitude = 55.95206; //Edinburgh
  // _longitude = -3.19648;//Edinburgh

  //double _latitude = -6.2146;
  //double _longitude = 106.8451;

  // if (loc.latitude != null && loc.longitude != null) {

  await fetchNewPlace(_latitude, _longitude).then((value) async {
    await _incrementStreak(userProfile!, value);

    // int currentVisitNumber;
    int newVisitNumber;

    developer.log(
        'Getting location for ${_latitude.toString()} , ${_longitude.toString()}');

    newVisitNumber = currentPlace?.visitnumber ?? 0;
    //newVisitNumber = 0;
    if (currentPlace != null) {
      developer.log('newVisitNumber is ${newVisitNumber}');

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

    if ((currentPlace?.countryCode == null) ||
        (currentPlace?.countryCode != value.countryCode!)) {
      developer.log('New Country identified');

      newVisitNumber++;

      controllerConfetti.play();
      playsound();
    }

    double distanceInMeters = Geolocator.distanceBetween(
        currentPlace?.latitude ?? value.latitude!,
        currentPlace?.longitude ?? value.longitude!,
        value.latitude!,
        value.longitude!);
    developer.log('Discance in meters ${distanceInMeters.toString()}');
    developer.log('CurrentCountry');

    CurrentCountry newcountry = CurrentCountry(
        countryCode: value.countryCode!,
        countryName: value.countryName!,
        userId: _userId);
    developer.log('setCountry');

 //   String _messageCountry =
 //       await firestoreService.setCountry(countyRef, newcountry);
    developer.log('Region');

    Region region = Region(
        regionCode: value.regionCode!,
        region: value.region!,
        countryCode: value.countryCode!,
        userId: _userId);
    developer.log('regionRef');

    RegionCollectionReference regionRef =
        countyRef.doc(newcountry.countryCode).region;
    developer.log('setRegion');

    String _messageRegion = await firestoreService.setRegion(regionRef, region);
    developer.log('PlaceHistory');

    PlaceHistory newPlace = PlaceHistory(
      userId: value.userId,
      name: value.countryName,
      location: value.countryName,
      latitude: value.latitude,
      distance: distanceInMeters,
      longitude: value.longitude,
      streetAddress: value.streetAddress,
      city: value.city,
      countryName: value.countryName,
      countryCode: value.countryCode,
      postal: value.postal,
      region: value.region,
      regionCode: value.regionCode,
      elevation: value.elevation,
      timezone: value.timezone,
      timestamp: value.timestamp, // DateTime.now().millisecondsSinceEpoch,
      arrivaldate: value.arrivaldate, // DateTime.now()
      visitnumber: newVisitNumber,
    );
        developer.log('PlaceHistoryCollectionReference');

    PlaceHistoryCollectionReference placehistoryRef =
        regionRef.doc(region.regionCode).placehistory;
                developer.log('addPlaceHistory');

    await firestoreService.addPlaceHistory(placehistoryRef, newPlace);
    developer.log('New Country ${newPlace.countryCode}');
    developer.log(
        'New latitude. longitude ${newPlace.latitude} ${newPlace.longitude}');
  });
  _showShareDialog(context);
  //  await _updateStats(userTotals!);
}

Future<void> _incrementStreak(UserProfile user, PlaceHistory place) async {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final docRef = FirebaseFirestore.instance
      .collection('users')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final docSnapshot = await docRef.get();

  if (docSnapshot.exists) {
    final lastRecordedDate = docSnapshot.data()!['lastRecordedDate'].toDate();
    if (lastRecordedDate.isBefore(today)) {
      // final newStreak = _currentStreak + 1;
      final newStreak = user.currentstreak! + 1;

      await docRef.update({
        'lastRecordedDate': today,
        'currentStreak': newStreak,
        'latestlongitude': place.longitude,
        'latestlatitude': place.latitude,
        'lateststreetAddress': place.streetAddress,
        'latestcountryName': place.countryName,
        'latestcountryCode': place.countryCode,
        'latestpostal': place.postal,
        'latestregion': place.region,
        'latestregionCode': place.regionCode
      });

      // setState(() {
      //   _currentStreak = newStreak;
      // });
    }
  } else {
    await docRef.set({
      'lastRecordedDate': today,
      'currentStreak': 1,
    });
    //   setState(() {
    //     _currentStreak = 1;
    //   });
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

  developer.log(res.body, name: 'my.app.category');
  jsonString = jsonDecode(res.body);

  developer.log(jsonString.toString(), name: 'my.app.jsonString');

  var features = jsonString['features'];
  for (var feature in features) {
    _placeHistory.streetAddress = feature['place_name'];

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

        _placeHistory.city = item['text'];
      }
    }
  }
  return _placeHistory;
}

void _showShareDialog(
  BuildContext context,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Container(
          child: Consumer<ApplicationState>(
              builder: (context, appState, _) => AlertDialog(
                    title: Text(
                        style: TextStyle(fontSize: 12),
                        'Share your new location with friends?'),
                    content: Text(
                        style: TextStyle(fontSize: 12),

                        //  'Region: ${appState.currentPlace?.region} \n Country: ${CountryFlag(appState.currentPlace!.location!)}   ${CountryFlag(appState.currentPlace!.countryCode!)}'),

                        //    'Do you want to share your streak of $_currentStreak days?'),
                        'Share location with friends?'),
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
                          for (var item in appState.tripHistory) {
                            flags = flags + CountryFlag(item.countryCode!);
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
