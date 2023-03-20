import 'dart:async';
import 'dart:math' hide log;
import 'dart:developer';
import 'package:cloud_firestore_platform_interface/src/set_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtk_flutter/model/location.dart';
import 'package:gtk_flutter/screens/activecountries.dart';
import 'package:gtk_flutter/screens/ActiveCountryPage.dart';
import 'package:gtk_flutter/screens/mappage.dart';
import 'package:gtk_flutter/src/geoCode.dart';
import 'package:gtk_flutter/src/widgets.dart';
import 'package:location/location.dart';
import 'package:intl/intl.dart';
import 'package:confetti/confetti.dart';
import 'package:gtk_flutter/state/applicationstate.dart';

import '../model/placehistory.dart';
import '../screens/UserCountryPage.dart';
import '../screens/splashscreen.dart';
import 'confetti.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;
import 'package:share_plus/share_plus.dart';

//import 'package:mapbox_api/mapbox_api.dart';

//pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw

class Location extends StatefulWidget {
  Location(
      {required this.currentPlace,
      required this.locations,
      required this.usercountrylist,
      required this.countryrecords,
      required this.userregionlist,
      required this.regionrecords,
      // required this.addLocation,
      super.key});

  List<PlaceHistory> locations;
  List<PlaceHistory> currentPlace;
  List<CurrentCountry> usercountrylist;
  List<Region> userregionlist;
  Map<String, dynamic> countryrecords;
  Map<String, dynamic> regionrecords;
  String _currentPlace = "France";

  // String currentPlace;

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  late ConfettiController _controllerConfetti;
  bool isPlay = false;

  final _controller = TextEditingController();

  LocationHistory locationCurrent = LocationHistory();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initController();
    });
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

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Center(
          //SafeArea(
          // child: Stack(
          child: Column(
        children: <Widget>[
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
          widget.currentPlace.isNotEmpty
              ? Text(widget.currentPlace.first.countryName!)
              : Text("No Location"),
          // IconButton(
          //     onPressed: () => {
          //           Navigator.push(
          //               context,
          //               MaterialPageRoute(
          //                   builder: (context) => Mapbox(
          //                       //usercountrylist: widget.usercountrylist,
          //                       )))
          //           //builder: (context) => SupportedCountriesMap()))
          //           //builder: (context) => ActiveCountryPage()))
          //         },

          //     Mapbox

          //     //_getCountryAndRegionCode,

          //     //     onPressed: () => {SplashScreen()},
          //     iconSize: 80,
          //     icon: const Icon(Icons.mail)),
          //     SizedBox(height: 20),
          //     Text(_countryCode),
          //     SizedBox(height: 20),
          //     Text(_regionCode),
          IconButton(
              onPressed: () =>
                  {Share.share('check out my website https://tripify.com')},
              //     onPressed: () => {SplashScreen()},
              iconSize: 80,
              icon: const Icon(Icons.waves)),
          IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserCountryPage(
                                //usercountrylist: widget.usercountrylist,
                                )))
                    //builder: (context) => SupportedCountriesMap()))
                    //builder: (context) => ActiveCountryPage()))
                  },
              //     onPressed: () => {SplashScreen()},
              iconSize: 80,
              icon: const Icon(Icons.access_alarm)),
          IconButton(
            onPressed: () {
              // fetchCountry('ES').then(vc)  async {
              //         _countrytest = vc;
              //       };
              getLocation().then((value) async {
                LocationData? loc = value;
                String _userId = FirebaseAuth.instance.currentUser!.uid;
                CurrentUser currentUser = CurrentUser(
                    id: FirebaseAuth.instance.currentUser!.uid,
                    userId: FirebaseAuth.instance.currentUser!.uid,
                    email: FirebaseAuth.instance.currentUser!.email,
                    displayname: FirebaseAuth.instance.currentUser!.email);

                FirestoreService firestoreService = FirestoreService();

                // Future<CountryHttpDetails> _countrytest;

                Future<String> _messageCurrentUser =
                    firestoreService.setCurrentUser(currentUser);
                CurrentCountryCollectionReference countyRef =
                    currentuserRef.doc(currentUser.userId).country;
                if (loc.latitude != null && loc.longitude != null) {
                  // await getAddress(loc.latitude!, loc.longitude!).then((value) {
//                  await fetchPlaceHistory(loc.latitude!, loc.longitude!)
                  // double newyorklat = 40.730610;
                  // double newyorklon = -73.935242;
                  // double parislat = 48.8566;
                  // double parislon = 2.3522;
                  //CountryHttpDetails _countrytest;

                  // CountryHttpDetails _countrytest = CountryHttpDetails(
                  //     countryCode: 'ES',
                  //     capital: 'Madrid',
                  //     lat: 40.4168,
                  //     long: 3.7038);
                  // CountryHttpDetails _countrytest = CountryHttpDetails(
                  //     countryCode: 'AR',
                  //     capital: 'Buenos Aires',
                  //     lat: -34.58333333,
                  //     long: -58.666667);

                  // await fetchPlaceHistory(_countrytest.lat!, _countrytest.long!)
                  await fetchPlaceHistory(loc.latitude!, loc.longitude!)
                      .then((value) {
                    log('Getting location');
                    if (widget.currentPlace.length != 0) {
                      widget._currentPlace =
                          widget.currentPlace.first.countryName!;
                      log('Set current Location');
                      log(widget._currentPlace);
                    } else {
                      widget._currentPlace = 'FirstLocation';
                      log('First Location');
                    }
                    //log('Current location widget.currentPlace.first.countryName!);
                    // if (value.countryName == widget._currentPlace) {
                    //   log('Current location unchanged');
                    // } else {
                    log('Current location changed');
                    _controllerConfetti.play();
                    // }
                    //Future<PlaceHistory> _regionCode =
                    // fetchPlaceHistory(loc.latitude!, loc.longitude!);
                    CurrentCountry country = CurrentCountry(
                        countryCode: value.countryCode!,
                        countryName: value.countryName!,
                        userId: _userId);
                    // CurrentCountry country = CurrentCountry(
                    //     countryCode: 'FF',
                    //     countryName: 'Ffff',
                    //     userId: _userId);
                    Future<String> _messageCountry =
                        firestoreService.setCountry(countyRef, country);
                    Region region = Region(
                        regionCode: value.regionCode!,
                        region: value.region!,
                        countryCode: value.countryCode!,
                        userId: _userId);
                    // Region region = Region(
                    //     regionCode: 'AD',
                    //     region: 'Adam',
                    //     countryCode: 'ZZ',
                    //     userId: _userId);
                    RegionCollectionReference regionRef =
                        countyRef.doc(country.countryCode).region;
                    Future<String> _messageRegion =
                        firestoreService.setRegion(regionRef, region);
                    PlaceHistory placeCurrent = PlaceHistory(
                      userId: value.userId,
                      name: value.countryName,
                      location: value.countryName,
                      latitude: value.latitude,
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
                      //timezone: value.timezone,
                      //elevation: value.elevation!.toInt(),
                      timestamp: value
                          .timestamp, // DateTime.now().millisecondsSinceEpoch,
                      arrivaldate: value.arrivaldate, // DateTime.now()
                    );
                    PlaceHistoryCollectionReference placehistoryRef =
                        regionRef.doc(region.regionCode).placehistory;
                    Future<String> _messagePlaceHistory = firestoreService
                        .addPlaceHistory(placehistoryRef, placeCurrent);
                    //else {
                    //  log('Current location changed');
                    _controller.text = value.countryName!;
                  });
                }
              });
            },
            iconSize: 80,
            icon: const Icon(Icons.travel_explore),
          ),
          IconButton(
              onPressed: () => {
                    Navigator.push(
                        context,
//                        MaterialPageRoute(builder: (context) => Mappage()))
                        MaterialPageRoute(
                          builder: (context) => ActiveCountryPage(
                        //    usercountrylist: widget.usercountrylist,
                        //    countryrecords: widget.countryrecords,
                        //    userregionlist: widget.userregionlist,
                        //    regionrecords: widget.regionrecords,
                          ),
                        ))
                  },
              //     onPressed: () => {SplashScreen()},
              iconSize: 80,
              icon: const Icon(Icons.map)),
        ],
      )),
    ]);
  }
}

Future<PlaceHistory> fetchPlaceHistory(
    double latitude, double longitude) async {
  // var client = http.Client();
  // Uri contacts_url =
  //     'https://api.mapbox.com/geocoding/v5/mapbox.places/148.64536374318646,-33.027220457663375.json?country=au&limit=1&types=place%2Cpostcode%2Caddress%2Cregion%2Cneighborhood&access_token=pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw'
  //         as Uri;
  // String basicAuth = 'Basic mykeyexampele';
  // var response = client.get(contacts_url, headers: <String, String>{'authorization': basicAuth});
  // var jsonString = jsonDecode(response.);
  // print(response.statusCode);
  // print(jsonString);
  //return jsonString;
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
  // String longitude = "148.64536374318646";
  // String latitude = "-33.027220457663375";
  String access_token =
      "pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw";

  String urlString = "https://api.mapbox.com/geocoding/v5/mapbox.places/" +
      longitude.toString() +
      "," +
      //     // "-33.027220457663375." +
      latitude.toString() +
      ".json?limit=1&access_token=" +
      access_token;
  var res = await http.get(
    Uri.parse(urlString),
    //     //"pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw"),
    // "https://api.mapbox.com/geocoding/v5/mapbox.places/148.64536374318646,-33.027220457663375.json?country=au&limit=1&types=place%2Cpostcode%2Caddress%2Cregion%2Cneighborhood&access_token=pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw"),
    //  body: map,
  );
  developer.log(urlString, name: 'my.app.urlstring');

  developer.log(res.body, name: 'my.app.category');
  jsonString = jsonDecode(res.body);
  // var shortCode = jsonString['features'][0]['context'][3]['short_code'];

  // developer.log(shortCode, name: 'my.app.category.shortCode');
//   String place_name = jsonString['features'][0]['place_name'];
//   String address = jsonString['features'][0]['place_name'];
//   developer.log(address, name: 'my.app.category.address');
//   String city = jsonString['features'][0]['context'][2]['text'];
//   // String country = jsonString['features'][0]['context'][4]['text'];
//   String region = jsonString['features'][0]['context'][3]['text'];
// //   final postcode = jsonString['features'][0]["context"][1]["text"];
//   final postcode = jsonString['features'][0]["context"][0]["text"];
//   final locality = jsonString['features'][0]["context"][2]["text"];
// //  final countryCode = jsonString['features'][0]["context"][4]["short_code"];
//   final countryCode = jsonString['features'][0]["context"][3]["short_code"];

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
        //_placeHistory.name = item['short_code'];

      }
    }
  }

  // _placeHistory.userId = FirebaseAuth.instance.currentUser!.uid;
  //_placeHistory.name = jsonString['features'][0]['context'][3]['text'];
  // _placeHistory.location = jsonString['features'][0]['context'][4]['text'];
  //_placeHistory.longitude = longitude;
  //_placeHistory.latitude = latitude;
  //_placeHistory.streetAddress = jsonString['features'][0]['address'];
  //_placeHistory.streetAddress = jsonString['features'][0]['place_name'];
  //_placeHistory.city = jsonString['features'][0]['context'][1]['text'];
  //_placeHistory.countryName = jsonString['features'][0]['context'][4]['text'];
//  _placeHistory.countryName = jsonString['features'][0]['context'][3]['text'];
  //_placeHistory.countryCode =
  //    jsonString['features'][0]["context"][4]["short_code"];
  //_placeHistory.postal = jsonString['features'][0]["context"][1]["text"];
  //_placeHistory.region = jsonString['features'][0]['context'][3]['text'];
  //_//placeHistory.regionCode =
  //    jsonString['features'][0]['context'][3]['short_code'];
  //_placeHistory.timestamp = DateTime.now().millisecondsSinceEpoch;
  //_placeHistory.arrivaldate = DateTime.now();
  // _placeHistory.timezone =
  //     jsonString['features'][0]["context"][4]["short_code"];
  // _placeHistory.elevation = 0;
  return _placeHistory;
  //var shortCode2 = res.body['features'][0]['context'][2]['short_code'];

  //final data = jsonDecode(res.body);

  //return res.body;
  // http.Response regioncode;

  // regioncode = http.get(Uri.parse(
  //         'https://api.mapbox.com/geocoding/v5/mapbox.places/148.64536374318646,-33.027220457663375.json?country=au&limit=1&types=place%2Cpostcode%2Caddress%2Cregion%2Cneighborhood&access_token=pk.eyJ1IjoidHJpcGlmeSIsImEiOiJjbGRmaWdkcHgwaGJpM25wZTh0eDAwN2JoIn0.H_QiLx6jgdQXVX4OqzKCVw'))
  //     as http.Response;
  // ;

  // var jsonString = jsonDecode(regioncode.body);
  // print(jsonString);
  // return jsonString;
}

class CountryHttpDetails {
  final String countryCode;
  final String? capital;
  final double? lat;
  final double? long;

  CountryHttpDetails({
    required this.countryCode,
    this.capital,
    this.lat,
    this.long,
  });
}

Future<CountryHttpDetails> fetchCountry(String countryCode) async {
  String urlString = 'https://restcountries.com/v2/alpha/' + countryCode;
  var response = await http.get(Uri.parse(urlString));
  var country = jsonDecode(response.body);

  return CountryHttpDetails(
    countryCode: country['alpha2Code'],
    capital: country['capital'],
    lat: country['latlng'][0],
    long: country['latlng'][1],
  );
}
