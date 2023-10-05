import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

import 'country.dart';
import 'poi.dart';

class UserProfileFull {
  String id;
  String? userId;
  String? email;
  String? nickname;
  String? avatar;
  String? avatarPath;
  String? photo;
  String? language;
  DateTime? joinDate;
  int? friend;
  int? league;
  int? countrycount;
  int? visitcount;
  int? distancetotal;
  int? regioncount;
  int? placescount;
  int? currentstreak;
  double? latestlongitude;
  double? latestlatitude;
  String? lateststreetAddress;
  String? latestcity;
  String? latestcountryName;
  String? latestcountryCode;
  String? latestpostal;
  String? latestregion;
  String? latestregionCode;
  DateTime? lastRecordedDate;


//  List<FriendRequest>? friendRequests;
  List<String>? friends;
  List<Map<String, dynamic>>? poi;
  List<String>? blpoi;
  List<Country>? countries;
  List<String>? countryvisitlist;

  UserProfileFull({
     required this.id,
    this.userId,
    this.email,
    this.nickname,
    this.avatar,
    this.avatarPath,
        this.photo,
    this.language,
        this.joinDate,
    this.friend,
    this.league,
    this.countrycount,
    this.visitcount,
    this.distancetotal,
    this.currentstreak,
    this.regioncount,
    this.placescount,

 
   // this.friendRequests,
    this.friends,
    this.lastRecordedDate,
    this.latestcountryCode,
    this.latestcountryName,
    this.latestcity,
    this.latestlatitude,
    this.latestlongitude,
    this.latestpostal,
    this.latestregion,
    this.latestregionCode,
    this.lateststreetAddress,
       this.countries,
    this.countryvisitlist,
    this.poi,
        this.blpoi,

  });

  factory UserProfileFull.fromJson(Map<String, dynamic> documentData) {

 developer.log('userProfilefunc in ${documentData['userId']} ');

  dynamic joinDateData = documentData['joinDate'];
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

  dynamic lastRecordedDateData = documentData['joinDate'];
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
  List<Map<String, dynamic>> poiList = documentData['poi'] != null
      ? List<Map<String, dynamic>>.from(documentData['poi']!)
      : <Map<String, dynamic>>[];

  List<String> blpoiList = documentData['blpoi'] != null
      ? List<String>.from(documentData['blpoi']!)
      : <String>[];

// List<Map<String, dynamic>> friendList = documentData['friends'] != null
//       ? List<Map<String, dynamic>>.from(documentData['friends']!)
//       : <Map<String, dynamic>>[];

    List<String>? _friendList = documentData['friends'] != null
      ? List<String>.from(documentData['friends']!)
      : <String>[];


    List<String>? _countryvisitListData = documentData['countryvisitlist'] != null
      ? List<String>.from(documentData['countryvisitlist']!)
      : <String>[];

    final _userProfileFull = UserProfileFull(
          id: documentData['userId'],
    userId: documentData['userId'] ?? 'userId',
    email: documentData['email'] ?? 'email',
    nickname: documentData['nickname'] ?? 'nickname',
    avatar: documentData['avatar'] ?? 'avatar',
    // photo: documentData['photo"']  ?? 'photo' as String,
    language: documentData['language'] ?? 'language',
    joinDate: joinDate,
    //    joinDate: document.data()['joinDate']?.toDate ?? DateTime.now(),
    //  joinDate: DateTime.tryParse(document.data()['joinDate']),
    friend: documentData['friend'] as int? ?? 0,
    league: documentData['league'] as int? ?? 0,
    countrycount: documentData['countrycount'] as int? ?? 0,
    visitcount: documentData['visitcount'] as int? ?? 0,
    distancetotal: documentData['distancetotal'] as int? ?? 0,
    regioncount: documentData['regioncount'] as int? ?? 0,
    placescount: documentData['placescount'] as int? ?? 0,
    currentstreak: documentData['currentstreak'] as int? ?? 0,
    latestlatitude: documentData['latestlatitude'] as double? ?? 0.0,
    latestlongitude: documentData['latestlongitude'] as double? ?? 0.0,
    lateststreetAddress:
        documentData['lateststreetAddress'] as String? ?? 'lateststreetAddress',
    latestcity: documentData['latestcity'] as String? ?? 'latestcity',
    latestcountryName:
        documentData['latestcountryName'] as String? ?? 'latestcountryName',
    latestcountryCode:
        documentData['latestcountryCode'] as String? ?? 'latestcountryCode',
    latestpostal: documentData['latestpostal'] as String? ?? 'latestpostal',
    latestregion: documentData['latestregion'] as String? ?? 'latestregion',
    latestregionCode:  documentData['latestregionCode'] as String? ?? 'latestregionCode',
        countries: (documentData['countries'] as List)
            .map((e) => Country.fromJson(e))
            .toList(),
    friends: _friendList,
    poi: poiList,
    blpoi: blpoiList,
    countryvisitlist: _countryvisitListData,
 
      );
      return _userProfileFull;

}
}