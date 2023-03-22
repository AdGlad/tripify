import 'dart:developer';
//import 'dart:ffi';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
//import 'package:firebase_auth/firebase_auth.dart' // new
//   hide
//        EmailAuthProvider,
//        PhoneAuthProvider; // new
import 'package:gtk_flutter/model/placehistory.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'dart:async';
import 'package:gtk_flutter/src/globals.dart' as globals;
import 'dart:developer' as developer;

import '../model/triphistory.dart';
import '../model/usertotals.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';

class ApplicationState extends ChangeNotifier {
  ApplicationState() {
    init();
  }

  bool _loggedIn = false;
  bool get loggedIn => _loggedIn;

  bool _emailVerified = false;

  bool get emailVerified => _emailVerified;

  //bool Location = true;
  //StreamSubscription<QuerySnapshot>? _placeHistorySubscription;

  StreamSubscription<QuerySnapshot>? _tripsSubscription;
  StreamSubscription<QuerySnapshot>? _locationCurrentSubscription;

  StreamSubscription<QuerySnapshot>? _placeHistorySubscription;

  StreamSubscription<QuerySnapshot>? _userRegionListSubscription;

  List<PlaceHistory> _placeHistory = [];
  List<PlaceHistory> get placeHistory => _placeHistory;

  List<TripHistory> _tripHistory = [];
  List<TripHistory> get tripHistory => _tripHistory;

  UserTotals _userTotals = UserTotals();
  UserTotals get userTotals => _userTotals;

  // List<PlaceHistory> _currentPlace = [];
  // List<PlaceHistory> get currentPlace => _currentPlace;
  PlaceHistory? _currentPlace; // = PlaceHistory();
  PlaceHistory? get currentPlace => _currentPlace;

  LatLng _newLatLng = LatLng(0, 0);
  LatLng get newLatLng => _newLatLng;

  set newLatLng(LatLng latlng)
  // double longitude )
  {
    _newLatLng = latlng;
    notifyListeners();
  }

  List<CurrentCountry> _userCountryList = [];
  List<CurrentCountry> get userCountrylist => _userCountryList;

  List<Region> _userRegionList = [];
  List<Region> get userRegionlist => _userRegionList;

  Map<String, dynamic> _countryrecords = {};
  Map<String, dynamic> get countryrecords => _countryrecords;

  Map<String, dynamic> _regionrecords = {};
  Map<String, dynamic> get regionrecords => _regionrecords;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

    // FirebaseUIAuth.configureProviders([
    //   EmailAuthProvider(),
    //   //EmailAuthProvider(),
    //   // EmailAuthProvider(),

    //   // EmailProvider(),
    // ]);
    FirebaseUIAuth.configureProviders([
      EmailAuthProvider(),
      // emailLinkProviderConfig,
      PhoneAuthProvider(),
      GoogleProvider(
          clientId:
              "90817750920-9307of40hl4eg62dabtvcd403s6pg5a8.apps.googleusercontent.com"),
      //  AppleProvider(),
      FacebookProvider(clientId: "1dae917812269b6ffe95a586db98aca8"),
      //TwitterProvider(
      // apiKey: TWITTER_API_KEY,
      // apiSecretKey: TWITTER_API_SECRET_KEY,
      // redirectUri: TWITTER_REDIRECT_URI,
      //),
    ]);

    FirebaseAuth.instance.userChanges().listen((user) {
      if (user != null) {
        _loggedIn = true;
        _emailVerified = user.emailVerified;
        log(' User logged in ..');

        StreamSubscription<QuerySnapshot> _userCountryListSubscription =
            FirebaseFirestore.instance
                .collection('currentuser')
                .doc(FirebaseAuth.instance.currentUser!.uid)
                .collection('country')
                .snapshots()
                .listen((snapshot) {
          _userCountryList = [];
          for (final document in snapshot.docs) {
            _countryrecords[document.id] = document.data()['countryName'];

            _userCountryList.add(CurrentCountry(
              countryCode: document.id,
              countryName: document.data()['countryName'] as String,
              userId: document.data()['userId'] as String,
            ));
          }
          notifyListeners();
        });

        _userRegionListSubscription = FirebaseFirestore.instance
            .collectionGroup('region')
            //.collectionGroup('currentuser/*/country/*/region')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            //.orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _userRegionList = [];
          for (final document in snapshot.docs) {
            _regionrecords[document.id] = document.id;

            _userRegionList.add(
              Region(
                userId: FirebaseAuth.instance.currentUser!.uid,
                regionCode: document.id,
                region: document.data()['region'] as String,
                countryCode: document.data()['countryCode'] as String,
              ),
            );
          }
          notifyListeners();
        });

        _locationCurrentSubscription = FirebaseFirestore.instance
            .collectionGroup('placehistory')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('timestamp', descending: true)
            .limit(1)
            .snapshots()
            .listen((snapshot) {
          //_currentPlace = [];

          for (final document in snapshot.docs) {
            globals.new_latitude = document.data()['latitude'] as double;
            globals.new_longitude = document.data()['longitude'] as double;
            int timeInMillis = document.data()['timestamp'] as int;
            DateTime current_arrivalDate =
                DateTime.fromMillisecondsSinceEpoch(timeInMillis);

            // _currentPlace.add(
            _currentPlace = PlaceHistory(
                userId: FirebaseAuth.instance.currentUser!.uid,
                name: document.data()['name'] as String,
                latitude: document.data()['latitude'] as double,
                longitude: document.data()['longitude'] as double,
                streetAddress: document.data()['streetAddress'] as String,
                city: document.data()['city'] as String,
                countryName: document.data()['countryName'] as String,
                countryCode: document.data()['countryCode'] as String,
                postal: document.data()['postal'] as String,
                region: document.data()['region'] as String,
                regionCode: document.data()['regionCode'] as String,
                timezone: document.data()['timezone'] as String,
                elevation: document.data()['elevation'] as int,
                visitnumber: document.data()['visitnumber'] as int,
                arrivaldate: current_arrivalDate);
          }

          notifyListeners();
        });

        _placeHistorySubscription = FirebaseFirestore.instance
            .collectionGroup('placehistory')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('timestamp', descending: true)
            .snapshots()
            .listen((snapshot) {
          _placeHistory = [];

          for (final document in snapshot.docs) {
            //  globals.new_latitude = document.data()['latitude'] as double;
            //  globals.new_longitude = document.data()['longitude'] as double;
            int timeInMillis = document.data()['timestamp'] as int;
            DateTime current_arrivalDate =
                DateTime.fromMillisecondsSinceEpoch(timeInMillis);

            _placeHistory.add(PlaceHistory(
                userId: FirebaseAuth.instance.currentUser!.uid,
                name: document.data()['name'] as String,
                latitude: document.data()['latitude'] as double,
                longitude: document.data()['longitude'] as double,
                streetAddress: document.data()['streetAddress'] as String,
                city: document.data()['city'] as String,
                countryName: document.data()['countryName'] as String,
                countryCode: document.data()['countryCode'] as String,
                postal: document.data()['postal'] as String,
                region: document.data()['region'] as String,
                regionCode: document.data()['regionCode'] as String,
                timezone: document.data()['timezone'] as String,
                elevation: document.data()['elevation'] as int,
                visitnumber: document.data()['visitnumber'] as int,
                arrivaldate: current_arrivalDate));
          }

          notifyListeners();
        });

        _tripsSubscription = FirebaseFirestore.instance
            .collectionGroup('placehistory')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('timestamp', descending: false)
            .snapshots()
            .listen((snapshot) {
          String previous_countryName = 'previous_countryName';
          String previous_regionCode = 'previous_regionCode';
          int previous_visitNumber = -1;
          int loopcounter = 0;
          int countrycounter = 0;
          int visitcounter = 0;
          int regioncounter = 0;
          double distancetotal = 0.0;
          int placescounter = 0;

          _tripHistory = [];
          _userTotals = UserTotals();

          for (final document in snapshot.docs) {
            String current_countryName =
                document.data()['countryName'] as String;
            String current_countryCode =
                document.data()['countryCode'] as String;
            String current_regionCode = document.data()['regionCode'] as String;
            double? current_distance =
                document.data()['distance'] as double? ?? 0.0;
            int? current_visitNumber =
                document.data()['visitnumber'] as int? ?? 0;
            int timeInMillis = document.data()['timestamp'];
            DateTime current_arrivalDate =
                DateTime.fromMillisecondsSinceEpoch(timeInMillis);

            if (previous_countryName != current_countryName) {
              countrycounter++;
            }
            if (previous_regionCode != current_regionCode) {
              regioncounter++;
            }
            if (previous_visitNumber != current_visitNumber) {
              visitcounter++;
            }

            placescounter++;
            distancetotal = distancetotal + current_distance;

            if (previous_countryName != current_countryName) {
              _tripHistory.add(TripHistory(
                userId: FirebaseAuth.instance.currentUser!.uid,
                countryName: current_countryName,
                countryCode: current_countryCode,
                arrivalDate: current_arrivalDate,
                visitNumber: current_visitNumber,
              ));

              if (loopcounter > 0) {
                _tripHistory[loopcounter - 1].departureDate =
                    current_arrivalDate;
              }
              loopcounter++;

              developer.log(
                  'Creating new trip record ${document.data()['countryName']} , ${document.data()['countryCode']}, ${document.data()['visitnumber']}');
            }

            previous_countryName = current_countryName;
            previous_regionCode = current_regionCode;
            previous_visitNumber = current_visitNumber;

            _userTotals.CountryCount = countrycounter;
            _userTotals.VisitCount = visitcounter;
            _userTotals.DistanceTotal = (distancetotal / 1000).toInt();
            _userTotals.RegionTotal = regioncounter;
            _userTotals.PlacesCount = placescounter;
          }

          _tripHistory.forEach((trip) {
            developer.log(
                'trip list ${trip.countryName} , ${trip.countryCode}, ${trip.visitNumber}');
          });

          notifyListeners();
        });
      } else {
        _loggedIn = false;
        _emailVerified = false;
        //    _placeHistory = [];
        //    _placeHistorySubscription?.cancel();
      }
      notifyListeners();
    });
  }

  Future<void> refreshLoggedInUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return;
    }

    await currentUser.reload();
  }
}
