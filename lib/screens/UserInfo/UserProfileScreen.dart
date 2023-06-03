import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:gtk_flutter/screens/UserInfo/UserStatsContainer.dart';
import 'package:intl/intl.dart';

import '../../model/users.dart';
import '../checkIn/UserMapContainer.dart';

class UserProfileScreen extends StatelessWidget {
  final String userId;

  UserProfileScreen({required this.userId});

  Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(
      String userId) async {
    final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
    final snapshot = await userRef.get();

    return snapshot;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          future: getUserProfile(userId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
    
            if (snapshot.hasError) {
              return Center(
                child: Text('Error occurred: ${snapshot.error.toString()}'),
              );
            }
    
            if (!snapshot.hasData || snapshot.data == null) {
              return Center(
                child: Text('No user profile found'),
              );
            }
    
    //        Map<String, dynamic>? userProfileMap;
            //       userProfileMap = snapshot.data?.data();
            final _userProfile = userProfilefunc(snapshot.data?.data(), userId);
    
            //   final userProfile = snapshot.data!.data();
            //   UserProfile _userProfile = UserProfile(id: userId);
            //   DateTime joinDate = (userProfile!['joinDate'] as Timestamp).toDate();
            //   DateTime lastRecordedDate =
            //     (userProfile['lastRecordedDate'] as Timestamp).toDate();
            // _userProfile.userId =
            //     userProfile['userId'] ?? 'userId'; // event.get("userId") ?? "userId";
            // _userProfile.email = userProfile['email'] ?? 'email';
            // _userProfile.nickname = userProfile['nickname'] ?? 'nickname';
            // _userProfile.avatar = userProfile['avatar'] ?? 'avatar';
            // // _userProfile.photo = userProfile['photo'] ?? 'photo';
            // _userProfile.language = userProfile['language'] ?? 'language';
            // _userProfile.joinDate = joinDate;
            // //  _userProfile.joinDate = userProfile['joinDate'].toDate() as DateTime? ;//?? DateTime.now() as DateTime? ;
            // _userProfile.friend = userProfile['friend'] ?? 0;
            // _userProfile.league = userProfile['league'] ?? 0;
            // _userProfile.countrycount = userProfile['countrycount'] ?? 0;
            // _userProfile.visitcount = userProfile['visitcount'] ?? 0;
            // _userProfile.distancetotal = userProfile['distancetotal'] ?? 0;
            // _userProfile.regioncount = userProfile['regioncount'] ?? 0;
            // _userProfile.placescount = userProfile['placescount'] ?? 0;
            // _userProfile.currentstreak = userProfile['currentStreak'] ?? 0;
            // _userProfile.lastRecordedDate = lastRecordedDate;
    
            return Column(
              children: [
                Expanded(child: userStatsContainer(_userProfile, context)),
               // userStatsContainer(_userProfile, context),
              //  UserMapContainer( context, _userProfile!, null)
                //Container(child: UserMapContainer( context, _userProfile!))
              Expanded(child: UserMapContainer( context, _userProfile!)) 
    
              ],
            );
          },
        ),
      ),
    );
  }
}

UserProfile? userProfilefunc(
    Map<String, dynamic>? userProfileMap, String userId) {
  final userProfile = userProfileMap;
  UserProfile? _userProfile = UserProfile(id: userId);
  DateTime joinDate = (userProfile?['joinDate'] as Timestamp).toDate();
  DateTime lastRecordedDate =
      (userProfile?['lastRecordedDate'] as Timestamp).toDate();
  _userProfile.userId =
      userProfile?['userId'] ?? 'userId'; // event.get("userId") ?? "userId";
  _userProfile.email = userProfile?['email'] ?? 'email';
  _userProfile.nickname = userProfile?['nickname'] ?? 'nickname';
  _userProfile.avatar = userProfile?['avatar'] ?? 'avatar';
  // _userProfile.photo = userProfile['photo'] ?? 'photo';
  _userProfile.language = userProfile?['language'] ?? 'language';
  _userProfile.joinDate = joinDate;
  //  _userProfile.joinDate = userProfile['joinDate'].toDate() as DateTime? ;//?? DateTime.now() as DateTime? ;
  _userProfile.friend = userProfile?['friend'] ?? 0;
  _userProfile.league = userProfile?['league'] ?? 0;
  _userProfile.countrycount = userProfile?['countrycount'] ?? 0;
  _userProfile.visitcount = userProfile?['visitcount'] ?? 0;
  _userProfile.distancetotal = userProfile?['distancetotal'] ?? 0;
  _userProfile.regioncount = userProfile?['regioncount'] ?? 0;
  _userProfile.placescount = userProfile?['placescount'] ?? 0;
  _userProfile.currentstreak = userProfile?['currentStreak'] ?? 0;

        _userProfile.latestlatitude = userProfile?['latestlatitude'] ?? 0.0;
        _userProfile.latestlongitude = userProfile?['latestlongitude'] ?? 0.0;
        _userProfile.lateststreetAddress = userProfile?['lateststreetAddress'] ?? 'lateststreetAddress';
        _userProfile.latestcity = userProfile?['latestcity'] ?? 'latestcity';
        _userProfile.latestcountryName = userProfile?['latestcountryName'] ?? 'latestcountryName';
        _userProfile.latestcountryCode = userProfile?['latestcountryCode'] ?? 'latestcountryCode';
        _userProfile.latestpostal = userProfile?['latestpostal'] ?? 'latestpostal';
        _userProfile.latestregion = userProfile?['latestregion'] ?? 'latestregion';
        _userProfile.latestregionCode = userProfile?['latestregionCode'] ?? 'latestregionCode';


  _userProfile.lastRecordedDate = lastRecordedDate;

  return _userProfile;
}
