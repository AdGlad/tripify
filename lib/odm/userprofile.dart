import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer' as developer;

import 'country.dart';
import 'poi.dart';

class UserProfile {
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

  UserProfile({
    required this.id,
    this.userId = 'userId',
    this.email = 'email',
    this.nickname = 'nickname',
    this.avatar = 'avatar',
    this.avatarPath = 'avatarPath',
    this.photo = 'photo',
    this.language = 'language',
    this.joinDate,
    this.friend = 0,
    this.league = 0,
    this.countrycount = 0,
    this.visitcount = 0,
    this.distancetotal = 0,
    this.currentstreak = 0,
    this.regioncount = 0,
    this.placescount = 0,

    // this.friendRequests,
    this.friends = const <String>[],
    this.lastRecordedDate,
    this.latestcountryCode = 'latestcountryCode',
    this.latestcountryName = 'latestcountryName',
    this.latestcity = 'latestcity',
    this.latestlatitude = 0.0,
    this.latestlongitude = 0.0,
    this.latestpostal = 'latestpostal',
    this.latestregion = 'latestregion',
    this.latestregionCode = 'latestregionCode',
    this.lateststreetAddress = 'lateststreetAddress',
    this.countries = const <Country>[],
    this.countryvisitlist = const <String>[],
    this.poi = const <Map<String, dynamic>>[{}],
    this.blpoi = const <String>[],
  });

  factory UserProfile.fromJson(Map<String, dynamic> documentData) {
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


    dynamic lastRecordedDateData = documentData['joinDate'];
    DateTime lastRecordedDate;

    if (lastRecordedDateData is Timestamp) {
      lastRecordedDate = lastRecordedDateData.toDate();
    } else if (lastRecordedDateData is DateTime) {
      lastRecordedDate = lastRecordedDateData;
    } else {

      lastRecordedDate = DateTime.now();
    }
    List<Map<String, dynamic>> poiList = documentData['poi'] != null
        ? List<Map<String, dynamic>>.from(documentData['poi']!)
        : <Map<String, dynamic>>[];

    List<String> blpoiList = documentData['blpoi'] != null
        ? List<String>.from(documentData['blpoi']!)
        : <String>[];


    List<String>? _friendList = documentData['friends'] != null
        ? List<String>.from(documentData['friends']!)
        : <String>[];

    List<String>? _countryvisitListData =
        documentData['countryvisitlist'] != null
            ? List<String>.from(documentData['countryvisitlist']!)
            : <String>[];

    final _UserProfile = UserProfile(
      id: documentData['userId'],
      userId: documentData['userId'] ?? 'userId',
      email: documentData['email'] ?? 'email',
      nickname: documentData['nickname'] ?? 'nickname',
      avatar: documentData['avatar'] ?? 'avatar',
      language: documentData['language'] ?? 'language',
      joinDate: joinDate,
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
      lateststreetAddress: documentData['lateststreetAddress'] as String? ??
          'lateststreetAddress',
      latestcity: documentData['latestcity'] as String? ?? 'latestcity',
      latestcountryName:
          documentData['latestcountryName'] as String? ?? 'latestcountryName',
      latestcountryCode:
          documentData['latestcountryCode'] as String? ?? 'latestcountryCode',
      latestpostal: documentData['latestpostal'] as String? ?? 'latestpostal',
      latestregion: documentData['latestregion'] as String? ?? 'latestregion',
      latestregionCode:
          documentData['latestregionCode'] as String? ?? 'latestregionCode',
      countries: (documentData['countries'] as List)
          .map((e) => Country.fromJson(e))
          .toList(),
      friends: _friendList,
      poi: poiList,
      blpoi: blpoiList,
      countryvisitlist: _countryvisitListData,
    );
    return _UserProfile;
  }

Map<String, dynamic> toJson() {
  return {
    'id': id,
    'userId': userId,
    'email': email,
    'nickname': nickname,
    'avatar': avatar,
    'avatarPath': avatarPath,
    'photo': photo,
    'language': language,
    //'joinDate': joinDate?.millisecondsSinceEpoch,
    'joinDate': joinDate != null ? Timestamp.fromDate(joinDate!) : null,
    'lastRecordedDate': lastRecordedDate != null ? Timestamp.fromDate(lastRecordedDate!) : null,
    'friend': friend,
    'league': league,
    'countrycount': countrycount,
    'visitcount': visitcount,
    'distancetotal': distancetotal,
    'currentstreak': currentstreak,
    'regioncount': regioncount,
    'placescount': placescount,
    'latestlongitude': latestlongitude,
    'latestlatitude': latestlatitude,
    'lateststreetAddress': lateststreetAddress,
    'latestcity': latestcity,
    'latestcountryName': latestcountryName,
    'latestcountryCode': latestcountryCode,
    'latestpostal': latestpostal,
    'latestregion': latestregion,
    'latestregionCode': latestregionCode,
    //'lastRecordedDate': lastRecordedDate?.millisecondsSinceEpoch,
    'friends': friends,
    'poi': poi,
    'blpoi': blpoi,
    'countries': countries?.map((country) => country.toJson()).toList(),
    'countryvisitlist': countryvisitlist,
  };
}



}
