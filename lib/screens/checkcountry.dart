import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gtk_flutter/model/placehistory.dart';
import 'package:gtk_flutter/src/confetti.dart';
import 'dart:developer' as developer;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:gtk_flutter/src/globals.dart' as globals;
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:geolocator/geolocator.dart';
import '../src/ad_helper.dart';
import '../state/applicationstate.dart';
import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class CheckCountry extends StatefulWidget {
  const CheckCountry({super.key});

  @override
  State<CheckCountry> createState() => _CheckCountryState();
}

class _CheckCountryState extends State<CheckCountry> {
  @override
  void initState() {
    super.initState();

    setState(() {
      initController();
    });

    getLocation();

    _loadStreakFromFirestore();

    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  void initController() {
    _controllerConfetti =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    // dispose the controller
    _controllerConfetti.dispose();
    super.dispose();
  }

  PlaceHistory? currentPlace;
  late ConfettiController _controllerConfetti;

  MapboxMapController? mapController;
  LocationData? newPlace;
  Location _location = Location();
  LatLng? _newLatLng;
  int _currentStreak = 0;

  Future<void> _loadStreakFromFirestore() async {
    final docSnapshot = await FirebaseFirestore.instance
        .collection('streaks')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    if (docSnapshot.exists) {
      setState(() {
        _currentStreak = docSnapshot.data()!['currentStreak'];
      });
    }
  }

  Future<void> _incrementStreak() async {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final docRef = FirebaseFirestore.instance
        .collection('streaks')
        .doc(FirebaseAuth.instance.currentUser!.uid);
    final docSnapshot = await docRef.get();

    if (docSnapshot.exists) {
      final lastRecordedDate = docSnapshot.data()!['lastRecordedDate'].toDate();
      if (lastRecordedDate.isBefore(today)) {
        final newStreak = _currentStreak + 1;
        await docRef.update({
          'lastRecordedDate': today,
          'currentStreak': newStreak,
        });
        setState(() {
          _currentStreak = newStreak;
        });
      }
    } else {
      await docRef.set({
        'lastRecordedDate': today,
        'currentStreak': 1,
      });
      setState(() {
        _currentStreak = 1;
      });
    }
  }

  String CountryFlag(String countryCode) {
    String flag = countryCode.toUpperCase().replaceAllMapped(RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(match.group(0)!.codeUnitAt(0) + 127397));
    return flag;
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

  void playsound() async {
    AudioPlayer player = AudioPlayer();
    String audioasset = "newcountry.wav";
    await player.setSource(AssetSource(audioasset));
    await player.setVolume(1.0);
    await player.resume();
  }

  void getLocation() async {
    try {
      var locationData = await _location.getLocation();
      setState(() {
        newPlace = locationData;
        developer.log(newPlace!.latitude.toString(), name: 'my.app.urlstring');
      });
    } catch (e) {
      print('Could not get the location: $e');
    }
  }

  void SaveLocation(
    PlaceHistory? currentPlace,
    //  MapboxMapController? locationcontroller
  ) async {
    LocationData? newPlace = await Location().getLocation();

    String _userId = FirebaseAuth.instance.currentUser!.uid;
    CurrentUser currentUser = CurrentUser(
        id: FirebaseAuth.instance.currentUser!.uid,
        userId: FirebaseAuth.instance.currentUser!.uid,
        email: FirebaseAuth.instance.currentUser!.email,
        displayname: FirebaseAuth.instance.currentUser!.email);

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

    double _latitude = newPlace.latitude!;
    double _longitude = newPlace.longitude!;

    //double
    //_latitude = 35.6839;
    //double
    //_longitude = 139.7744;
    // double _latitude = 40.6943;
    // double _longitude = -73.9249;

    // double
    //_latitude = -6.2146;
    // double
    //_longitude = 106.8451;

    // double
    //_latitude = 19.4333;
    // double
    //_longitude = -99.1333;
    // double _latitude = 39.9040;
    // double _longitude = 116.4075;

    //double _latitude = -6.2146;
    //double _longitude = 106.8451;

    // if (loc.latitude != null && loc.longitude != null) {

    await _incrementStreak();
    await fetchNewPlace(_latitude, _longitude).then((value) {
      // int currentVisitNumber;
      int newVisitNumber;

      developer.log(
          'Getting location for ${_latitude.toString()} , ${_longitude.toString()}');

      newVisitNumber = currentPlace?.visitnumber ?? 0;

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

      if ((currentPlace == null) ||
          (currentPlace.countryCode != value.countryCode!)) {
        developer.log('New Country identified');

        newVisitNumber++;

        _controllerConfetti.play();
        playsound();
      }

      double distanceInMeters = Geolocator.distanceBetween(
          currentPlace!.latitude!,
          currentPlace!.longitude!,
          value.latitude!,
          value.longitude!);
      developer.log('Discance in meters ${distanceInMeters.toString()}');
      CurrentCountry newcountry = CurrentCountry(
          countryCode: value.countryCode!,
          countryName: value.countryName!,
          userId: _userId);
      // Future<String> _messageCountry =
      //     firestoreService.setCountry(countyRef, newcountry);
      Region region = Region(
          regionCode: value.regionCode!,
          region: value.region!,
          countryCode: value.countryCode!,
          userId: _userId);
      RegionCollectionReference regionRef =
          countyRef.doc(newcountry.countryCode).region;
      // Future<String> _messageRegion =
      //     firestoreService.setRegion(regionRef, region);
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
      PlaceHistoryCollectionReference placehistoryRef =
          regionRef.doc(region.regionCode).placehistory;
      Future<String> _messagePlaceHistory =
          firestoreService.addPlaceHistory(placehistoryRef, newPlace);
      developer.log('New Country ${newPlace.countryCode}');
      developer.log(
          'New latitude. longitude ${newPlace.latitude} ${newPlace.longitude}');
    });
    _showShareDialog();
  }

  Future<PlaceHistory> fetchNewPlace(double latitude, double longitude) async {
    PlaceHistory _placeHistory = PlaceHistory(
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
    String access_token =
        "pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw";

    String urlString = "https://api.mapbox.com/geocoding/v5/mapbox.places/" +
        longitude.toString() +
        "," +
        latitude.toString() +
        ".json?limit=1&access_token=" +
        access_token;
    var res = await http.get(
      Uri.parse(urlString),
    );
    developer.log(urlString, name: 'my.app.urlstring');

    developer.log(res.body, name: 'my.app.category');
    jsonString = jsonDecode(res.body);

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
          _placeHistory.city = item['text'];
        }
      }
    }
    return _placeHistory;
  }

  BannerAd? _bannerAd;
  void _showShareDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(
            child: Consumer<ApplicationState>(
                builder: (context, appState, _) => AlertDialog(
                      title: Text(
                          style: TextStyle(fontSize: 20), 'Share your streak?'),
                      content: Text(
                          style: TextStyle(fontSize: 20),
                          'Do you want to share your streak of $_currentStreak days?'),
                      actions: <Widget>[
                        TextButton(
                          child: Text('CANCEL'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        TextButton(
                          child: Text('SHARE'),
                          onPressed: () {
                            String flags = '';
                            for (var item in appState.tripHistory) {
                              flags = flags + CountryFlag(item.countryCode!);
                            }
                            FlutterShare.share(
                              title: 'My Streak',
                              text:
                                  'Tripify: I have a $_currentStreak day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
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

  Future<void> shareFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: result.files[0] as String,
    );
  }

  final _controller = ScreenshotController();

  Future<void> shareScreenshot() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    final String localPath =
        '${directory!.path}/${DateTime.now().toIso8601String()}.png';

    await _controller.captureAndSave(localPath);

    await Future.delayed(Duration(seconds: 1));

    await FlutterShare.shareFile(
        title: 'Tripify', filePath: localPath, fileType: 'image/png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ApplicationState>(
        builder: (context, appState, _) => Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Container(
                      child: (_bannerAd != null)
                          ? Align(
                              alignment: Alignment.topCenter,
                              child: Container(
                                width: _bannerAd!.size.width.toDouble(),
                                height: _bannerAd!.size.height.toDouble(),
                                child: AdWidget(ad: _bannerAd!),
                              ),
                            )
                          : Text('No Ad'),
                    ),
                    Container(
                      height: 50,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: appState.tripHistory
                            .length, // appState.userCountrylist.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.all(2),
                              color: Colors.white,
                              //child: Text('Item $index'),
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Text(
                                  CountryFlag(
                                      appState.tripHistory[index].countryCode!),
                                  style: TextStyle(fontSize: 30),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      // )
                    ),
                    Container(
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
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.all(5.0),
                      color: Colors.greenAccent,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: (appState.currentPlace != null)
                                ? Text(CountryFlag(
                                    appState.currentPlace!.countryCode!))
                                : Text(''),
                          ),
                          (appState.currentPlace != null)
                              ? Text(appState.currentPlace!.countryName!)
                              : Text(''),
                          Text(': '),
                          (appState.currentPlace != null)
                              ? Text(appState.currentPlace!.region!)
                              : Text(''),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 20,
                      margin: const EdgeInsets.all(5.0),
                      color: Colors.blueAccent,
                      child: Center(
                        // child: Row(
                        //   children: [
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            elevation: 5,
                          ),
                          onPressed: () => SaveLocation(appState.currentPlace),
                          child: Text('Check Location'),
                        ),
                      ),
                    ),
                    Text(
                      'Current streak: $_currentStreak',
                      style: TextStyle(fontSize: 15),
                    ),
                    Spacer(),
                    Align(
                      alignment: Alignment.topCenter,
                      child: ConfettiWidget(
                        confettiController: _controllerConfetti,
                        blastDirectionality: BlastDirectionality.explosive,
                        createParticlePath: drawStar,
                        blastDirection: -pi / 2,
                        maxBlastForce: 30,
                        minBlastForce: 10,
                        emissionFrequency: 0.03,
                        numberOfParticles: 50,
                        gravity: 0.1,
                      ),
                    ),
                  ], // here
                ),
              ), //Listview
            ],
          ), //stack
        ),
      ),
    );
  }
}
