import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
//import 'dart:ffi';

//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_auth/firebase_auth.dart'
    hide PhoneAuthProvider, EmailAuthProvider;
import 'package:flutter/services.dart';
//import 'package:firebase_auth/firebase_auth.dart' // new
//   hide
//        EmailAuthProvider,
//        PhoneAuthProvider; // new
import 'package:gtk_flutter/model/placehistory.dart';
import 'package:gtk_flutter/model/topPoi.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import '../firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // new
import 'dart:async';
import 'package:gtk_flutter/src/globals.dart' as globals;
import 'dart:developer' as developer;

import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';

import 'package:package_info_plus/package_info_plus.dart';

import '../map/src/isocountry2.dart';

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
  StreamSubscription<QuerySnapshot>? _friendSubscription;
  StreamSubscription<QuerySnapshot>? _poiListsSubscription;
  StreamSubscription<QuerySnapshot>? _poiSubscription;

  List<UserProfile> _users = [];
  List<UserProfile> get users => _users;

  List<PlaceHistory> _placeHistory = [];
  List<PlaceHistory> get placeHistory => _placeHistory;

  List<Friend> _friendList = [];
  List<Friend> get friendList => _friendList;

//  List<TripHistory> _tripHistory = [];
//  List<TripHistory> get tripHistory => _tripHistory;

  UserProfile? _userProfile;
  UserProfile? get userProfile => _userProfile;

  List<Poi> _poiList = [];
  List<Poi> get poiList => _poiList;

  List<Poi> _blpoiList = [];
  List<Poi> get blpoiList => _blpoiList;

  //List<PlaceHistory> _tripList = [];
  //List<PlaceHistory> get tripList => _tripList;

//  UserTotals _userTotals = UserTotals();
//  UserTotals get userTotals => _userTotals;

  // List<PlaceHistory> _currentPlace = [];
  // List<PlaceHistory> get currentPlace => _currentPlace;
  PlaceHistory? _currentPlace; // = PlaceHistory();
  PlaceHistory? get currentPlace => _currentPlace;
  PackageInfo? _packageInfo;
  PackageInfo? get packageInfo => _packageInfo;

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

//List<IsoCountry2>  _IsoCountry2List = [];
  List<IsoCountry2> _IsoCountry2List = [];
  List<IsoCountry2> get IsoCountry2List => _IsoCountry2List;

  Map<String, dynamic> _poiMap = {};
  Map<String, dynamic> get poiMap => _poiMap;

  Map<String, dynamic> _placehistoryMap = {};
  Map<String, dynamic> get placehistoryMap => _placehistoryMap;

  Map<String, dynamic> _countryrecords = {};
  Map<String, dynamic> get countryrecords => _countryrecords;

  Map<String, dynamic> _regionrecords = {};
  Map<String, dynamic> get regionrecords => _regionrecords;
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;

//import json file /asset/data_iso_3166-*.json into IsoCountry2Rec arrary of type IsoCountry2

  Future<void> init() async {
    _IsoCountry2List = await loadIsoCountry2Rec('2');
    WidgetsFlutterBinding.ensureInitialized();

    _packageInfo = await PackageInfo.fromPlatform();
    developer.log('PackageInfo.version ${_packageInfo?.version}');
    developer.log('PackageInfo.buildNumber ${_packageInfo?.buildNumber}');
    developer.log('PackageInfo ${_packageInfo?.appName}');

    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);

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

    FirebaseAuth.instance.userChanges().listen((user) async {
      if (user != null) {
        _loggedIn = true;
        _emailVerified = user.emailVerified;
        log(' User logged in ..');
        developer
            .log('User logged in .. ${FirebaseAuth.instance.currentUser!.uid}');
        _userProfile = UserProfile(id: FirebaseAuth.instance.currentUser!.uid);

        // StreamSubscription<QuerySnapshot> _userCountryListSubscription =
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
              //    userId: document.data()['userId'] as String,
            ));
          }
          notifyListeners();
        });

        developer.log('currentUser ${FirebaseAuth.instance.currentUser!.uid}');

        listenForUserChanges(FirebaseAuth.instance.currentUser!.uid);
        listenForAllUsersChanges();
        listenForRegionChanges(FirebaseAuth.instance.currentUser!.uid);
        listenForCurrrentPlace(FirebaseAuth.instance.currentUser!.uid);
        listenForPlaceHistory(FirebaseAuth.instance.currentUser!.uid);
        listenForAllFriends(FirebaseAuth.instance.currentUser!.uid);
        listenForTopPois()();

        notifyListeners();

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
          int distancetotal = 0;
          int placescounter = 0;

          // _tripHistory = [];

          // _userTotals = UserTotals(
          //     userId: FirebaseAuth.instance.currentUser!.uid,
          //     CountryCount: 0,
          //     VisitCount: 0,
          //     DistanceTotal: 0,
          //     RegionTotal: 0,
          //     PlacesCount: 0);

          // for (final document in snapshot.docs) {
          //   String currentCountryName =
          //       document.data()['countryName'] as String;
          //   String currentCountryCode =
          //       document.data()['countryCode'] as String;
          //   String currentRegionCode = document.data()['regionCode'] as String;
          //   double? currentDistance =
          //       document.data()['distance'] as double? ?? 0.0;
          //   int? currentVisitNumber =
          //       document.data()['visitnumber'] as int? ?? 0;
          //   int timeInMillis = document.data()['timestamp'];
          //   DateTime currentArrivalDate =
          //       DateTime.fromMillisecondsSinceEpoch(timeInMillis);

          //   if (previousCountryName != currentCountryName) {
          //     countrycounter++;
          //   }
          //   if (previousRegionCode != currentRegionCode) {
          //     regioncounter++;
          //   }
          //   if (previousVisitNumber != currentVisitNumber) {
          //     visitcounter++;
          //   }

          //   placescounter++;
          //   developer.log(
          //       'distancetotal $distancetotal , current_distance, $currentDistance');
          //   distancetotal = distancetotal + currentDistance;

          //   //   if (previousCountryName != currentCountryName) {
          //   //     _tripHistory.add(TripHistory(
          //   //       userId: FirebaseAuth.instance.currentUser!.uid,
          //   //       countryName: currentCountryName,
          //   //       countryCode: currentCountryCode,
          //   //       arrivalDate: currentArrivalDate,
          //   //       visitNumber: currentVisitNumber,
          //   //     ));

          //   //   if (loopcounter > 0) {
          //   //     _tripHistory[loopcounter - 1].departureDate =
          //   //         currentArrivalDate;
          //   //   }
          //   //   loopcounter++;

          //   //   developer.log(
          //   //       'Creating new trip record ${document.data()['countryName']} , ${document.data()['countryCode']}, ${document.data()['visitnumber']}');
          //   // }

          //   previousCountryName = currentCountryName;
          //   previousRegionCode = currentRegionCode;
          //   previousVisitNumber = currentVisitNumber;
          // }

          developer.log(
              'countrycounter $countrycounter , $visitcounter, $distancetotal');
          // _userTotals.CountryCount = countrycounter;
          // _userTotals.VisitCount = visitcounter;
          // _userTotals.DistanceTotal = distancetotal ~/ 1000;
          // _userTotals.RegionTotal = regioncounter;
          // _userTotals.PlacesCount = placescounter;

          // _tripHistory.forEach((trip) {
          //   developer.log(
          //       'trip list ${trip.countryName} , ${trip.countryCode}, ${trip.visitNumber}');
        });

        notifyListeners();
        //}
        // );
      } else
        _loggedIn = false;
      _emailVerified = false;
      //    _placeHistory = [];
      //    _placeHistorySubscription?.cancel();
      notifyListeners();
    }

        // notifyListeners();
        //}
        );
  }

  Future<void> refreshLoggedInUser() async {
    final currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser == null) {
      return;
    }

    await currentUser.reload();
  }

  //UserProfile?
  listenForUserChanges(String userId) {
    // UserProfile userProfile = UserProfile(id: userId);

    // Get a reference to the user's document in Firestore
    DocumentReference userRef =
        FirebaseFirestore.instance.collection('users').doc(userId);

    developer.log('listenForUserChanges in ');

    // Listen for changes to the user document

    userRef.snapshots().listen(
        onError: (error) => print("Listen failed: $error"), (userSnapshot) {
      developer.log('listenForUserChanges in ');

      //Check if the document exists
      if (userSnapshot.exists) {
        // Get the user's data as a Map
        Map<String, dynamic>? userData =
            userSnapshot.data() as Map<String, dynamic>;
        // UserProfile? userProfile = userProfilefunc(userData,  userId );

        Timestamp? joinDateTimestamp = userData['joinDate'];
        DateTime joinDate = joinDateTimestamp?.toDate() ?? DateTime.now();

        Timestamp? lastRecordedTimestamp = userData['lastRecordedDate'];
        DateTime lastRecordedDate =
            lastRecordedTimestamp?.toDate() ?? DateTime.now();

        //DateTime joinDate = ((userData['joinDate'] as Timestamp?.toDate()?? DateTime.now() ;
        //  DateTime lastRecordedDate =
        //      ((userData['lastRecordedDate'] as Timestamp).toDate())?? DateTime.now();
        // Extract the user's age and address from the data
        _userProfile?.userId =
            userData['userId'] ?? 'userId'; // event.get("userId") ?? "userId";
        _userProfile?.email = userData['email'] as String? ?? 'email';

        _userProfile?.nickname = userData['nickname'] as String? ?? 'nickname';
        _userProfile?.avatar = userData['avatar'] as String? ?? 'avatar';
        // _userProfile?.photo = userData['photo'] as String? ?? 'photo';
        _userProfile?.language = userData['language'] as String? ?? 'language';
        _userProfile?.joinDate = joinDate;
        //  _userProfile?.joinDate = userData['joinDate'].toDate() as DateTime? ;//?? DateTime.now() as DateTime? ;
        _userProfile?.friend = userData['friend'] as int? ?? 0;
        _userProfile?.league = userData['league'] as int? ?? 0;
        _userProfile?.countrycount = userData['countrycount'] as int? ?? 0;
        _userProfile?.visitcount = userData['visitcount'] as int? ?? 0;
        _userProfile?.distancetotal = (userData['distancetotal'] as int? ?? 0);
        _userProfile?.regioncount = userData['regioncount'] as int? ?? 0;
        _userProfile?.placescount = userData['placescount'] as int? ?? 0;
        _userProfile?.currentstreak = userData['currentstreak'] as int? ?? 0;

        //  _userProfile?.currentstreak = userData['lastRecordedDate'] ?? 0;
        _userProfile?.latestlatitude =
            (userData['latestlatitude'] as double?) ?? 0.0;
        _userProfile?.latestlongitude =
            (userData['latestlongitude'] as double?) ?? 0.0;
        _userProfile?.lateststreetAddress =
            userData['lateststreetAddress'] as String? ?? 'lateststreetAddress';
        _userProfile?.latestcity =
            userData['latestcity'] as String? ?? 'latestcity';
        _userProfile?.latestcountryName =
            userData['latestcountryName'] as String? ?? 'latestcountryName';
        _userProfile?.latestcountryCode =
            userData['latestcountryCode'] as String? ?? 'latestcountryCode';
        _userProfile?.latestpostal =
            userData['latestpostal'] as String? ?? 'latestpostal';
        _userProfile?.latestregion =
            userData['latestregion'] as String? ?? 'latestregion';
        _userProfile?.latestregionCode =
            userData['latestregionCode'] as String? ?? 'latestregionCode';
        List<dynamic>? _countryListData = userData['countrycodelist'] ?? [];
        _userProfile?.countrycodelist =
            _countryListData?.map((e) => e.toString()).toList();

        List<Map<String, dynamic>> poiList =
            List<Map<String, dynamic>>.from(userData['poi']);
        _userProfile?.poi = poiList;

        List<Map<String, dynamic>> blpoiList =
            List<Map<String, dynamic>>.from(userData['blpoi']);
        _userProfile?.blpoi = blpoiList;

        _blpoiList = [];
        //_poiMap['Bucket List']['poi'] = [];

        _poiMap['Bucket List'] ??= {
          'description': 'Your Bucket List',
          'title': 'Bucket List',
          'poi': [],
        };
        _poiMap['Bucket List']['poi'].clear();

        blpoiList.forEach((bucketListPoiMap) {
          // _poiMap['Bucket List'][bucketListPoiMap['id']] = bucketListPoiMap;

          _poiMap['Bucket List']['poi'].add(bucketListPoiMap);

          //  _poiMap['Bucket List']['poi'][bucketListPoiMap['id']] =  {
          //      bucketListPoiMap,
          //   };

          _blpoiList.add(poifunc(bucketListPoiMap, 'Bucket List'));
        });

        developer.log('User _poiMap $_poiMap ');
        List<dynamic>? _countryvisitListData =
            userData['countryvisitlist'] ?? [];
        _userProfile?.countryvisitlist =
            _countryvisitListData?.map((e) => e.toString()).toList();

        // _userProfile?.lastRecordedDate = userData['lastRecordedDate'].toDate()
        //     as DateTime?; //  ?? DateTime.now();

        // Print the user's ID, age, and address to the console
        print('User ${_userProfile?.userId}');
        notifyListeners();
      } else {
        print('User document for $userId does not exist.');
      }
    });
    notifyListeners();

//    return userProfile;
  }

  //List<UserProfile>
  listenForAllUsersChanges() {
    // List<UserProfile> users = [];
    developer.log('listenForAllUsersChanges start ');

    _usersSubscription = FirebaseFirestore.instance
        .collection('users')
        // .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('distancetotal', descending: true)
        .snapshots()
        .listen((snapshot) {
      _users = [];

      for (final document in snapshot.docs) {
        //   DateTime joinDate =
        //       (document.data()['joinDate'] ?? DateTime.now()) as DateTime;

        dynamic joinDateData = document.data()['joinDate'];
        DateTime joinDate;

        if (joinDateData is Timestamp) {
          joinDate = joinDateData.toDate();
        } else if (joinDateData is DateTime) {
          joinDate = joinDateData;
        } else {
          // Handle the case where joinDateData is null or has an unsupported type.
          // For example, you can assign a default value:
          joinDate = DateTime.now();
        }

        //   DateTime lastRecordedDate =
        //       (document.data()['lastRecordedDate'] ?? DateTime.now()) as DateTime;

        dynamic lastRecordedDateData = document.data()['joinDate'];
        DateTime lastRecordedDate;

        if (lastRecordedDateData is Timestamp) {
          lastRecordedDate = lastRecordedDateData.toDate();
        } else if (lastRecordedDateData is DateTime) {
          lastRecordedDate = lastRecordedDateData;
        } else {
          // Handle the case where joinDateData is null or has an unsupported type.
          // For example, you can assign a default value:
          lastRecordedDate = DateTime.now();
        }

        //  final data =  document.data();
        //  users.add( UserProfile.fromJson(data));

        _users.add(UserProfile(
          id: document.id,
          userId: document.data()['userId'] ?? 'userId',
          email: document.data()['email'] ?? 'email',
          nickname: document.data()['nickname'] ?? 'nickname',
          avatar: document.data()['avatar'] ?? 'avatar',
          // photo: document.data()['photo"']  ?? 'photo' as String,
          language: document.data()['language'] ?? 'language',
          joinDate: joinDate,
          //    joinDate: document.data()['joinDate']?.toDate ?? DateTime.now(),
          //  joinDate: DateTime.tryParse(document.data()['joinDate']),
          friend: document.data()['friend'] as int? ?? 0,
          league: document.data()['league'] as int? ?? 0,
          countrycount: document.data()['countrycount'] as int? ?? 0,
          visitcount: document.data()['visitcount'] as int? ?? 0,
          distancetotal: document.data()['distancetotal'] as int? ?? 0,
          regioncount: document.data()['regioncount'] as int? ?? 0,
          placescount: document.data()['placescount'] as int? ?? 0,
          currentstreak: document.data()['currentstreak'] as int? ?? 0,
          lastRecordedDate: lastRecordedDate,
          //    lastRecordedDate: document.data()['lastRecordedDate']?.toDate ?? DateTime.now(),
          // lastRecordedDate: document.data()['lastRecordedDate'].toDate as DateTime?,
          //              lastRecordedDate: DateTime.tryParse(document.data()['lastRecordedDate']),
        ));

        // );
      }

      developer.log('listenForAllUsersChanges end ');
    });
    notifyListeners();

    // return users;
  }

  //List<Region>
  listenForRegionChanges(String userId) {
    //  List<Region> userRegionList = [];

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
        developer.log(' document.id ${document.id}}');

        _regionrecords[document.id] = document.id;
        //   _regionrecords[IsoCountry2GetCode( _IsoCountry2List,document.id)] = document.id;
        //  _regionrecords[document.id] = IsoCountry2GetCode( _IsoCountry2List,document.id);
        //    developer.log(' _regionrecords ${IsoCountry2GetCode( _IsoCountry2List,document.id)}');
        // developer.log(' _regionrecords ${document.id}');

        String apiregionCode = 'AU-NSW';
        if (document.data().containsKey('apiregionCode')) {
          apiregionCode = document.data()['apiregionCode'] as String;
          // Now you can use the apiregionCode value
        } else {
          print('apiregionCode field does not exist in the document.');
        }

        _userRegionList.add(
          Region(
            userId: userId, // FirebaseAuth.instance.currentUser!.uid,
            regionCode: document.id,
            region: document.data()['region'] as String,
            countryCode: document.data()['countryCode'] as String,
            apiregionCode: apiregionCode,

            ///  apiregionCode: IsoCountry2GetCode( _IsoCountry2List, document.id),
          ),
        );
      }
    });
    notifyListeners();

    //  return userRegionList;
  }

  //PlaceHistory?
  listenForCurrrentPlace(String userId) {
    // PlaceHistory? currentPlace;

    developer.log('listenForCurrrentPlace start ');

    //_locationCurrentSubscription =
    FirebaseFirestore.instance
        .collectionGroup('placehistory')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('timestamp', descending: true)
        .limit(1)
        .snapshots()
        .listen(onError: (error) => print("Listen failed: $error"), (snapshot) {
      _currentPlace = null;

    final document = snapshot.docs[0];

      developer.log('listenForCurrrentPlace In ');

  if (snapshot.docs.isNotEmpty) {

    //  for (final document in snapshot.docs) {
        globals.new_latitude = document.data()['latitude'] as double;
        globals.new_longitude = document.data()['longitude'] as double;
        int timeInMillis = document.data()['timestamp'] as int;
        DateTime currentArrivaldate =
            DateTime.fromMillisecondsSinceEpoch(timeInMillis);
        developer.log('listenForCurrrentPlace In For loop ');

        final List<dynamic> poiGroupIdList =
            document.data()['poiGroupIds'] ?? <dynamic>[];
        final List<String> poiGroupIds = poiGroupIdList.cast<String>().toList();
        final List<dynamic> imagePathList =
            document.data()['imagePaths'] ?? <dynamic>[];
        final List<String> imagePath = imagePathList.cast<String>().toList();

        _currentPlace = PlaceHistory(
            userId: FirebaseAuth.instance.currentUser!.uid,
            name: document.data()['name'] as String?,
            latitude: document.data()['latitude'] as double?,
            longitude: document.data()['longitude'] as double?,
            streetAddress: document.data()['streetAddress'] as String?,
            city: document.data()['city'] as String?,
            countryName: document.data()['countryName'] as String?,
            countryCode: document.data()['countryCode'] as String?,
            postal: document.data()['postal'] as String?,
            region: document.data()['region'] as String?,
            regionCode: document.data()['regionCode'] as String?,
            timezone: document.data()['timezone'] as String?,
            elevation: document.data()['elevation'] as int?,
            visitnumber: document.data()['visitnumber'] as int?,
            description: document.data()['description'] as String?,
            rating: document.data()['rating'] as String?,
            poi: document.data()['poi'] as String?,
            poiId: document.data()['poiId'] as num?,
            poiName: document.data()['poiName'] as String?,
            poiGroupIds: poiGroupIds,

            //imagePaths: document.data()['imagePaths'] as List<String>?,
            imagePaths: imagePath,
            arrivaldate: currentArrivaldate);
  }
  else {
    // Set _currentPlace to default values when the snapshot is empty
    _currentPlace = PlaceHistory(
        userId: FirebaseAuth.instance.currentUser!.uid,
        name: 'First Place',
        latitude: 0.0,
        longitude: 0.0,
        // Set other default values here...
        arrivaldate: DateTime.now().subtract(Duration(days: 1))  
        );
  }
        developer.log('listenForCurrrentPlace out ');
    //  }
      developer.log('listenForCurrrentPlace notifyListeners before');

      //   notifyListeners();
      developer.log('listenForCurrrentPlace notifyListeners after 1');
    });

    developer.log('return currentPlace ');

    if (_currentPlace == null){
      _currentPlace = PlaceHistory(
        userId: FirebaseAuth.instance.currentUser!.uid,
        name: 'First Place',
        latitude: 0.0,
        longitude: 0.0,
        // Set other default values here...
        arrivaldate: DateTime.now().subtract(Duration(days: 1))  
        );
  }




    // return currentPlace;
  }

  //List<PlaceHistory>
  listenForPlaceHistory(String userId) {
    _placeHistorySubscription = FirebaseFirestore.instance
        .collectionGroup('placehistory')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      _placeHistory = [];

      for (final document in snapshot.docs) {
        _placeHistory.add(placeHistoryfunc(document.data()));
        _placehistoryMap[document.id] = document.data();
        developer.log('_placeHistory.add  in ');
      }

      notifyListeners();
    });
  }

  listenForAllFriends(String userId) {
    // List<UserProfile> users = [];
    developer.log('listenForAllFriends start ');

    _friendSubscription = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        // .collection('friendRequests')
        .collection('friends')
        .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .orderBy('friendNickname', descending: true)
        .snapshots()
        .listen((snapshot) {
      _friendList = [];

      for (final document in snapshot.docs) {
        _friendList.add(Friend(
            id: document.id,
            userId: document.data()['userId'] ?? 'userId',
            friendId: document.data()['friendId'] ?? 'friendId',
            friendNickname:
                document.data()['friendNickname'] ?? 'friendNickname',
            friendEmail: document.data()['friendEmail'] ?? 'friendEmail',
            friendAvatar: document.data()['friendAvatar'] ?? 'friendAvatar',
            status: document.data()['status'] ?? 'status'));

        developer.log(
            'listenForAllFriends adding friend ${document.data()['friendId']} ');
      }

      developer.log('listenForAllFriends end ');
    });
    notifyListeners();

    // return users;
  }

  listenForTopPois() {
    // List<UserProfile> users = [];
    developer.log('listenForTopPois() start ');
    _poiList = [];
    _poiListsSubscription = FirebaseFirestore.instance
        //  .collection('poi-to-visit')
        .collection('toppoi')
        .snapshots()
        .listen((snapshot) {
      for (final poiGroupDoc in snapshot.docs) {
        FirebaseFirestore.instance
            //  .collection('poi-to-visit')
            .collection('toppoi')
            .doc(poiGroupDoc.id)
            .collection('poi')
            .snapshots()
            .listen((poisnapshot) {
          developer.log('toppoi _poiMap poiGroupDoc ${poiGroupDoc.id} }');

          _poiMap[poiGroupDoc.id] ??= {
            'description': poiGroupDoc['description'],
            'title': poiGroupDoc['title'],
            'poi': [],
          };
          _poiMap[poiGroupDoc.id]['poi'] = [];

          developer.log('toppoi check _poiMap $_poiMap }');

          for (final poiDoc in poisnapshot.docs) {
            developer.log('toppoi poiDoc id ${poiDoc.id}');

            _poiMap[poiGroupDoc.id]['poi'].add(poiDoc.data());

            _poiList.add(poifunc(poiDoc.data(), poiGroupDoc.id));
            developer.log('_poiMap ${_poiMap[poiGroupDoc.id][poiDoc.id]} }');
          }
        });
      }

      developer.log('listenForTopPois() end ');
      developer.log('full _poiMap $_poiMap ');
    });
    // notifyListeners();

    // return users;
  }
}

Poi poifunc(Map<String, dynamic> documentData, String poiGroupDocId) {
  final _poi = Poi(
    poiId: documentData['properties']['name'],
    groupId: poiGroupDocId,
    geometry: documentData['geometry'],
    id: documentData['id'],
    poiRadius: documentData['poiRadius'] ?? 0,
    properties: documentData['properties'],
    category: documentData['properties']['category_en'],
    poiclass: documentData['properties']['class'],
    iso_3166_1: documentData['properties']['iso_3166_1'],
    iso_3166_2: documentData['properties']['iso_3166_2'],
    maki: documentData['properties']['maki'],
    name: documentData['properties']['name'],
    type: documentData['properties']['type'],
    longitude: documentData['geometry']['coordinates'][0],
    latitude: documentData['geometry']['coordinates'][1],
  );

  developer.log('_poi.add  in ');

  return _poi;
}

PlaceHistory placeHistoryfunc(Map<String, dynamic> documentData) {
  int timeInMillis = documentData['timestamp'] as int;
  DateTime currentArrivaldate =
      DateTime.fromMillisecondsSinceEpoch(timeInMillis);

  dynamic poiData = documentData['poi'];
  String? poi;
// Check if poiData is of type String or null
  if (poiData is String || poiData == null) {
    // Cast poiData to String? (nullable String)
    poi = poiData as String?;

    // Now you can use poi as a nullable String
    // Do whatever you need to do with poi
  } else {
    poi = poiData
        .toString(); // Handle the case where poiData is of a different type (e.g., int)
    // You can decide what to do here based on your requirements
  }

  final _placeHistory = PlaceHistory(
      userId: FirebaseAuth.instance.currentUser!.uid,
      name: documentData['name'] as String,
      latitude: documentData['latitude'] as double,
      longitude: documentData['longitude'] as double,
      streetAddress: documentData['streetAddress'] as String,
      city: documentData['city'] as String,
      countryName: documentData['countryName'] as String,
      countryCode: documentData['countryCode'] as String,
      postal: documentData['postal'] as String?,
      region: documentData['region'] as String?,
      regionCode: documentData['regionCode'] as String?,
      timezone: documentData['timezone'] as String?,
      elevation: documentData['elevation'] as int?,
      visitnumber: documentData['visitnumber'] as int?,
      description: documentData['description'] as String?,
      rating: documentData['rating'] as String?,
      //    poi: documentData['poi'] as String?,
      poi: poi,
      // imagePaths: documentData()['imagePaths'] as List<String>?,
      imagePaths:
          (documentData['imagePaths'] as List<dynamic>?)?.cast<String>(),
      arrivaldate: currentArrivaldate);

  developer.log('_placeHistory.add  in ');

  return _placeHistory;
}
