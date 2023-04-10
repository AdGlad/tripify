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
import 'package:gtk_flutter/model/users.dart';
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
  StreamSubscription<QuerySnapshot>? _usersSubscription;

  StreamSubscription<DocumentSnapshot>? _userProfileSubscription;
  StreamSubscription<QuerySnapshot>? _tripsSubscription;
  StreamSubscription<QuerySnapshot>? _locationCurrentSubscription;
  StreamSubscription<QuerySnapshot>? _placeHistorySubscription;
  StreamSubscription<QuerySnapshot>? _userRegionListSubscription;

  List<UserProfile> _users = [];
  List<UserProfile> get users => _users;

  List<PlaceHistory> _placeHistory = [];
  List<PlaceHistory> get placeHistory => _placeHistory;

  List<TripHistory> _tripHistory = [];
  List<TripHistory> get tripHistory => _tripHistory;

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

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
        developer.log('Fire applicationstate');
        _usersSubscription = FirebaseFirestore.instance
            .collection('users')
            //.where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('distancetotal', descending: true)
            .snapshots()
            .listen((snapshot) {
          _users = [];

          for (final document in snapshot.docs) {
            //  globals.new_latitude = document.data()['latitude'] as double;
            //  globals.new_longitude = document.data()['longitude'] as double;
            //int timeInMillis = document.data()['timestamp'] as int;
            //DateTime current_arrivalDate =
            //  DateTime.fromMillisecondsSinceEpoch(timeInMillis);

            //final data =  document.data();
            // _users.add( UserProfile.fromJson(data));

            _users.add(UserProfile(
              id: document.id,
              userId: document.data()['userId'] as String,
              email: document.data()['email'] as String,
              nickname: document.data()['nickname'] as String,
              avatar: document.data()['avatar'] as String,
              // photo: document.data()['photo"'] as String,
              language: document.data()['language'] as String,
              //joinData: document.data()['joinDate"'] as String,
              friend: document.data()['friend'] as int,
              league: document.data()['league'] as int,
              countrycount: document.data()['countrycount'] as int,
              visitcount: document.data()['visitcount'] as int,
              distancetotal: document.data()['distancetotal'] as int,
              regioncount: document.data()['regioncount'] as int,
              placescount: document.data()['placescount'] as int,
            ));

            // );
          }

          notifyListeners();
        });

        // var userRef = FirebaseFirestore.instance
        //     .collection('Collection_name')
        //     .doc('Document_Id')
        //     .snapshots();
        //     //.get();

        final CollectionReference _usersProfileCollection =
            FirebaseFirestore.instance.collection('users');

        final docRef =
            _usersProfileCollection.doc(FirebaseAuth.instance.currentUser!.uid);

        // final docRef = db.collection("cities").doc("SF");

        docRef.get().then(
          (DocumentSnapshot doc) {
            if (doc.exists) {
            Map<String, dynamic>? data = doc.data() as Map<String, dynamic>;
            // _userProfile?.userId = data['userId'];

            //  _userProfile = UserProfile.fromJson(data);
            developer.log(' userId ${data['userId']}');
            developer.log(' currentstreak ${data['currentstreak']}');
            _userProfile = UserProfile(id: user.uid);

            _userProfile?.userId = data['userId'] ?? 'userId';
            _userProfile?.email = data['email'] ?? 'email';
            _userProfile?.nickname = data['nickname'] ?? 'nickname';
            _userProfile?.avatar = data['avatar'] ?? 'avatar';
            _userProfile?.photo = data['photo'] ?? 'photo';
            _userProfile?.language = data['language'] ?? 'language';
            _userProfile?.joinData = data['joinDate'] ?? DateTime.now();
            _userProfile?.friend = data['friend'] ?? 'userId';
            _userProfile?.league = data['league'] ?? 'userId';
            _userProfile?.countrycount = data['countrycount'] ?? 0;
            _userProfile?.visitcount = data['visitcount'] ?? 0;
            _userProfile?.distancetotal = data['distancetotal'] ?? 0;
            _userProfile?.regioncount = data['regioncount'] ?? 0;
            _userProfile?.placescount = data['placescount'] ?? 0;
            _userProfile?.currentstreak = data['currentstreak'] ?? 0;
            // _userProfile?.currentstreak= event.get("currentstreak") !=null ?  event.get("currentstreak") : 0;
            developer.log(
                ' _userProfile?.currentstreak= ${_userProfile?.currentstreak}');
            notifyListeners();
            }
            
          },
          onError: (e) => print("Error getting document: $e"),
        );
        developer.log(
            ' _userProfile?.currentstreak= ${_userProfile?.currentstreak}');
        notifyListeners();

        //   final doc =  _usersCollection.doc(user.uid).get();
        //   final data = doc.data;
        //     UserProfile.fromJson(data);

        //  Future<DocumentSnapshot<Map<String, dynamic>>> _usersCollection= FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.uid).get();

        // UserProfile user = _usersCollection.data;
        // UserProfile.fromJson(_usersCollection)

        //    _userProfileSubscription = FirebaseFirestore.instance
        //       .collection("users")
        //       .doc(FirebaseAuth.instance.currentUser!.uid)
        //      .snapshots()
        //       .listen((event) {
        //     developer.log(
        //         'In user profile loop ${FirebaseAuth.instance.currentUser!.uid}');
        //     _userProfile?.id = FirebaseAuth.instance.currentUser!.uid;
        //     _userProfile?.userId = event.get("userId");
        //     _userProfile?.email = event.get("email");
        //     _userProfile?.nickname = event.get("nickname");
        //     _userProfile?.avatar = event.get("avatar");
        //     _userProfile?.photo = event.get("photo");
        //     _userProfile?.language = event.get("language");
        //     _userProfile?.joinData = event.get("joinDate");
        //     _userProfile?.friend = event.get("friend");
        //     _userProfile?.league = event.get("league");
        //     _userProfile?.countrycount = event.get("countrycount")  ??  0;
        //     _userProfile?.visitcount = event.get("visitcount")  ??  0;
        //     _userProfile?.distancetotal = event.get("distancetotal")  ??  0;
        //     _userProfile?.regioncount = event.get("regioncount")  ??  0;
        //     _userProfile?.placescount = event.get("placescount")  ??  0;
        //     _userProfile?.currentstreak= event.get("currentstreak") ??  0;
        //  // _userProfile?.currentstreak= event.get("currentstreak") !=null ?  event.get("currentstreak") : 0;
        //  developer.log(
        //         ' _userProfile?.currentstreak= ${ _userProfile?.currentstreak}');
        //            notifyListeners();

        //   });

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
          String previousCountryName = 'previous_countryName';
          String previousRegionCode = 'previous_regionCode';
          int previousVisitNumber = -1;
          int loopcounter = 0;
          int countrycounter = 0;
          int visitcounter = 0;
          int regioncounter = 0;
          double distancetotal = 0.0;
          int placescounter = 0;

          _tripHistory = [];
          _userTotals = UserTotals(
              userId: FirebaseAuth.instance.currentUser!.uid,
              CountryCount: 0,
              VisitCount: 0,
              DistanceTotal: 0,
              RegionTotal: 0,
              PlacesCount: 0);

          for (final document in snapshot.docs) {
            String currentCountryName =
                document.data()['countryName'] as String;
            String currentCountryCode =
                document.data()['countryCode'] as String;
            String currentRegionCode = document.data()['regionCode'] as String;
            double? currentDistance =
                document.data()['distance'] as double? ?? 0.0;
            int? currentVisitNumber =
                document.data()['visitnumber'] as int? ?? 0;
            int timeInMillis = document.data()['timestamp'];
            DateTime currentArrivalDate =
                DateTime.fromMillisecondsSinceEpoch(timeInMillis);

            if (previousCountryName != currentCountryName) {
              countrycounter++;
            }
            if (previousRegionCode != currentRegionCode) {
              regioncounter++;
            }
            if (previousVisitNumber != currentVisitNumber) {
              visitcounter++;
            }

            placescounter++;
            developer.log(
                'distancetotal $distancetotal , current_distance, $currentDistance');
            distancetotal = distancetotal + currentDistance;

            if (previousCountryName != currentCountryName) {
              _tripHistory.add(TripHistory(
                userId: FirebaseAuth.instance.currentUser!.uid,
                countryName: currentCountryName,
                countryCode: currentCountryCode,
                arrivalDate: currentArrivalDate,
                visitNumber: currentVisitNumber,
              ));

              if (loopcounter > 0) {
                _tripHistory[loopcounter - 1].departureDate =
                    currentArrivalDate;
              }
              loopcounter++;

              developer.log(
                  'Creating new trip record ${document.data()['countryName']} , ${document.data()['countryCode']}, ${document.data()['visitnumber']}');
            }

            previousCountryName = currentCountryName;
            previousRegionCode = currentRegionCode;
            previousVisitNumber = currentVisitNumber;
          }

          developer.log(
              'countrycounter $countrycounter , $visitcounter, $distancetotal');
          _userTotals.CountryCount = countrycounter;
          _userTotals.VisitCount = visitcounter;
          _userTotals.DistanceTotal = distancetotal ~/ 1000;
          _userTotals.RegionTotal = regioncounter;
          _userTotals.PlacesCount = placescounter;

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
