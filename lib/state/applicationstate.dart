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

        _userProfile =
            listenForUserChanges(FirebaseAuth.instance.currentUser!.uid);
        _users = listenForAllUsersChanges();
        _userRegionList =
            listenForRegionChanges(FirebaseAuth.instance.currentUser!.uid);

        _currentPlace =
            listenForCurrrentPlace(FirebaseAuth.instance.currentUser!.uid);
        _placeHistory =
            listenForPlaceHistory(FirebaseAuth.instance.currentUser!.uid);

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

  UserProfile listenForUserChanges(String userId) {
    UserProfile _userProfile = UserProfile(id: userId);

    // Get a reference to the user's document in Firestore
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(userId);

    // Listen for changes to the user document
    userRef.snapshots().listen((userSnapshot) {
      // Check if the document exists
      if (userSnapshot.exists) {
        // Get the user's data as a Map
        Map<String, dynamic> userData =
            userSnapshot.data() as Map<String, dynamic>;
        DateTime joinDate = (userData['joinDate'] as Timestamp).toDate();
        DateTime lastRecordedDate =
            (userData['lastRecordedDate'] as Timestamp).toDate();
        // Extract the user's age and address from the data
        _userProfile.userId =
            userData['userId'] ?? 'userId'; // event.get("userId") ?? "userId";
        _userProfile.email = userData['email'] ?? 'email';
        _userProfile.nickname = userData['nickname'] ?? 'nickname';
        _userProfile.avatar = userData['avatar'] ?? 'avatar';
        // _userProfile.photo = userData['photo'] ?? 'photo';
        _userProfile.language = userData['language'] ?? 'language';
        _userProfile.joinDate = joinDate;
        //  _userProfile.joinDate = userData['joinDate'].toDate() as DateTime? ;//?? DateTime.now() as DateTime? ;
        _userProfile.friend = userData['friend'] ?? 0;
        _userProfile.league = userData['league'] ?? 0;
        _userProfile.countrycount = userData['countrycount'] ?? 0;
        _userProfile.visitcount = userData['visitcount'] ?? 0;
        _userProfile.distancetotal = userData['distancetotal'] ?? 0;
        _userProfile.regioncount = userData['regioncount'] ?? 0;
        _userProfile.placescount = userData['placescount'] ?? 0;
        _userProfile.currentstreak = userData['currentStreak'] ?? 0;
        _userProfile.lastRecordedDate = lastRecordedDate;

        //   _userProfile.lastRecordedDate = userData['lastRecordedDate'].toDate() as DateTime?; //  ?? DateTime.now();

        // Print the user's ID, age, and address to the console
        print('User $_userProfile.userId');
      } else {
        print('User document for $userId does not exist.');
      }
    });
    return _userProfile;
  }

  List<UserProfile> listenForAllUsersChanges() {
    _usersSubscription = FirebaseFirestore.instance
        .collection('users')
        // .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('distancetotal', descending: true)
        .snapshots()
        .listen((snapshot) {
      _users = [];

      for (final document in snapshot.docs) {
        DateTime joinDate = (document.data()['joinDate'] as Timestamp).toDate();
        DateTime lastRecordedDate =
            (document.data()['lastRecordedDate'] as Timestamp).toDate();

        //  final data =  document.data();
        //  _users.add( UserProfile.fromJson(data));

        _users.add(UserProfile(
          id: document.id,
          userId: document.data()['userId'] ?? 'userId',
          email: document.data()['email'] as String,
          nickname: document.data()['nickname'] as String,
          avatar: document.data()['avatar'] as String,
          // photo: document.data()['photo"'] as String,
          language: document.data()['language'] as String,
          joinDate: joinDate,
          //    joinDate: document.data()['joinDate']?.toDate ?? DateTime.now(),
          //  joinDate: DateTime.tryParse(document.data()['joinDate']),
          friend: document.data()['friend'] as int?,
          league: document.data()['league'] as int?,
          countrycount: document.data()['countrycount'] as int?,
          visitcount: document.data()['visitcount'] as int?,
          distancetotal: document.data()['distancetotal'] as int?,
          regioncount: document.data()['regioncount'] as int?,
          placescount: document.data()['placescount'] as int?,
          currentstreak: document.data()['currentStreak'] as int?,
          lastRecordedDate: lastRecordedDate,
          //    lastRecordedDate: document.data()['lastRecordedDate']?.toDate ?? DateTime.now(),
          // lastRecordedDate: document.data()['lastRecordedDate'].toDate as DateTime?,
          //              lastRecordedDate: DateTime.tryParse(document.data()['lastRecordedDate']),
        ));

        // );
      }

      notifyListeners();
    });
    return _users;
  }

  List<Region> listenForRegionChanges(String userId) {
    _userRegionListSubscription = FirebaseFirestore.instance
        .collectionGroup('region')
        //.collectionGroup('currentuser/*/country/*/region')
        .where('userId',
            isEqualTo: userId) //FirebaseAuth.instance.currentUser!.uid)
        //.orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      _userRegionList = [];
      for (final document in snapshot.docs) {
        _regionrecords[document.id] = document.id;

        _userRegionList.add(
          Region(
            userId: userId, // FirebaseAuth.instance.currentUser!.uid,
            regionCode: document.id,
            region: document.data()['region'] as String,
            countryCode: document.data()['countryCode'] as String,
          ),
        );
      }
      notifyListeners();
    });

    return _userRegionList;
  }

  PlaceHistory? listenForCurrrentPlace(String userId) {
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
    return _currentPlace;
  }

  List<PlaceHistory> listenForPlaceHistory(String userId) {
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
    return _placeHistory;
  }
}
