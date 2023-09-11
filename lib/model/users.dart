import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:provider/provider.dart';

import '../screens/UserInfo/FriendProfileScreen.dart';
import '../screens/league/league.dart';
import '../state/applicationstate.dart';

part 'users.g.dart';

@firestoreSerializable
class UserProfile {
  UserProfile({
    required this.id,
    this.userId,
    this.email,
    this.nickname,
    this.avatar,
    this.photo,
    this.language,
    this.joinDate,
    this.friend,
    this.league,
    this.countrycount,
    this.visitcount,
    this.distancetotal,
    this.regioncount,
    this.placescount,
    this.currentstreak,
    this.lastRecordedDate,
    this.latestlatitude,
    this.latestlongitude,
    this.lateststreetAddress,
    this.latestcity,
    this.latestcountryName,
    this.latestcountryCode,
    this.latestpostal,
    this.latestregion,
    this.latestregionCode,
    this.countrycodelist,
    this.countryvisitlist,
    this.poi,
  });

  factory UserProfile.fromJson(Map<String, Object?> json) =>
      _$UserProfileFromJson(json);

  @Id()
  late final String id;
  String? userId;
  String? email;
  String? nickname;
  String? avatar;

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
  List<String>? countrycodelist;
  List<String>? countryvisitlist;
  List<Map<String, dynamic>>? poi;



  Map<String, Object?> toJson() => _$UserProfileToJson(this);
}

/// A custom JsonSerializable annotation that supports decoding objects such
/// as Timestamps and DateTimes.
/// This variable can be reused between different models
const firestoreSerializable = JsonSerializable(
  converters: firestoreJsonConverters,
  // The following values could alternatively be set inside your `build.yaml`
  explicitToJson: true,
  createFieldMap: true,
);


@firestoreSerializable
class Friend {
    Friend({required this.id, this.userId, this.friendId,this.friendNickname,this.friendEmail,this.friendAvatar, this.status});

  //{
  //   _$assertPlaceHistory(this);
  // }

  factory Friend.fromJson(Map<String, Object?> json) =>  _$FriendFromJson(json);

  //String get id => FirebaseAuth.instance.currentUser!.uid;

  @Id()
  final String id;

  String? userId;
  String? friendId;
  String? friendNickname;
  String? friendEmail;
  String? friendAvatar;
  String? status;


  Map<String, Object?> toJson() => _$FriendToJson(this);
}
@firestoreSerializable
class FriendRequest {
    FriendRequest({required this.id, this.userId, this.requesterId,this.requesterNickname,this.requesterEmail,this.requesterAvatar, this.status});
  
   // _$assertFriendRequest(this);
  

  factory FriendRequest.fromJson(Map<String, Object?> json) =>
      _$FriendRequestFromJson(json);

  //String get id => FirebaseAuth.instance.currentUser!.uid;

  @Id()
  final String id;
   String? userId;
  String? requesterId;
  String? requesterNickname;
  String? requesterEmail;
  String? requesterAvatar;
  String? status;
  
  Map<String, Object?> toJson() => _$FriendRequestToJson(this);
}

//@Collection<UserProfile>('users')
//@Collection<FriendRequest>('users/*/friendRequests')
@Collection<UserProfile>('users')
@Collection<FriendRequest>('users/*/friendRequests')
@Collection<Friend>('users/*/friends')
final usersRef = UserProfileCollectionReference();
//final friendrequestsRef = FriendRequestCollectionReference();
//FriendRequestCollectionReference friendrequestsRef = usersRef.doc('myDocumentID').addresses;

/////////

//////////

// @JsonSerializable(explicitToJson: true)
// class User {
//   User({
//     required this.name,
//     required this.age,
//     required this.email,
//   });

//   factory User.fromJson(Map<String, Object?> json) => _$UserFromJson(json);

//   final String name;
//   final int age;
//   final String email;

//   Map<String, Object?> toJson() => _$UserToJson(this);
// }



class UserProfileList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FirestoreBuilder<UserProfileQuerySnapshot>(
      ref: usersRef,
      builder: (context, AsyncSnapshot<UserProfileQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading users...');

        // Access the QuerySnapshot
        UserProfileQuerySnapshot querySnapshot = snapshot.requireData;

        return ListView.builder(
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            // Access the User instance
            UserProfile user = querySnapshot.docs[index].data;

            return Text('User name: ${user.nickname}, email ${user.email}');
          },
        );
      }
    );
  }
}

class FriendRequestList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FirestoreBuilder<FriendRequestQuerySnapshot>(
      ref: usersRef.doc(FirebaseAuth.instance.currentUser!.uid).friendRequests.whereStatus(isEqualTo: 'pending'),
      builder: (context, AsyncSnapshot<FriendRequestQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading users...');

        // Access the QuerySnapshot
        FriendRequestQuerySnapshot querySnapshot = snapshot.requireData;

        return 
        
        
        
        Container(

      child: Consumer<ApplicationState>(
        builder: (context, appState, _) =>
          Container(
            child: ListView.builder(
              itemCount: querySnapshot.docs.length,
              itemBuilder: (context, index) {
                // Access the User instance
                FriendRequest friendrequest = querySnapshot.docs[index].data;
                return 
                Card(
                       color: Color.fromARGB(255, 49, 52, 59),
                          elevation: 8.0,
                          margin: EdgeInsets.all(5.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                      child: ListTile(
                        leading: Container(
                                // color: Colors.white,
                                //  alignment: Alignment.centerLeft,
                                child: 
                                Container(
                                  height: 40,
                                  width: 40,
                                  child: //Text('sdsfffs')),
                                  avatar(friendrequest.requesterAvatar,30.0))
                                
                                //CircleAvatar(
                                //  radius: 10.0,
                                //  backgroundImage: NetworkImage(friendrequest.requesterAvatar!)
                                //),
                                ),
                              
                       title: Text(friendrequest.requesterNickname!,style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w700,
                                  )), //Text('title'), //Text(userData['nickname']),
                        subtitle: Text( friendrequest.requesterEmail!,style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w700,
                                  )), //Text('email'), //Text(userData['email']),
                        trailing: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                backgroundColor:   Colors.orangeAccent,
                                elevation: 5,), 
                          
                          child: Text('Accept \nFriend',
                          style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 8.0,
                                    fontWeight: FontWeight.w700,
                  
                          )),
                          onPressed: () {
                            _acceptFriendRequest(appState.userProfile!,  friendrequest);
                          },
                        ),
                      ),
                    );
                
                //Text('User name: ${friendrequest.requesterNickname}, Status ${friendrequest.status}');
              
              
              
              },
            ),
          ),
      )
        );




      }
    );
    
  }
void _acceptFriendRequest(UserProfile userprofile,  FriendRequest friendrequest) async {
  final userrequesterRef =
        FirebaseFirestore.instance.collection('users').doc(friendrequest.requesterId);
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid);
    final friendRequest = {
      'status': 'accepted',
    };
    final friendRequestsRef = userRef.collection('friendRequests');
     await friendRequestsRef.doc(friendrequest.requesterId).update(friendRequest);


    final friend1 = {
      'id': friendrequest.requesterId,
      'userId': friendrequest.userId,
      'friendId': friendrequest.requesterId,
      'friendNickname': friendrequest.requesterNickname,
      'friendEmail': friendrequest.requesterEmail,
      'friendAvatar': friendrequest.requesterAvatar,
      'status': 'active',
    };

// Get current user details

      final friend2 = {
      'id': userprofile.id,
      'userId': friendrequest.requesterId,
      'friendId': userprofile.id,
      'friendNickname': userprofile.nickname,
      'friendEmail': userprofile.email,
      'friendAvatar': userprofile.avatar,
      'status': 'active',
    };

    final friendRef = userRef.collection('friends');
     await friendRef.doc(friendrequest.requesterId).set(friend1);


       final friendRef2 = userrequesterRef.collection('friends');
     await friendRef2.doc(userprofile.id).set(friend2);
     
  }

}



class FriendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FirestoreBuilder<FriendQuerySnapshot>(
      ref: usersRef.doc(FirebaseAuth.instance.currentUser!.uid).friends.whereStatus(isEqualTo: 'active'),// friends, //.whereStatus(isEqualTo: 'accepted'),
      builder: (context, AsyncSnapshot<FriendQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading users...');

        // Access the QuerySnapshot
        FriendQuerySnapshot querySnapshot = snapshot.requireData;

        return ListView.builder(          
          itemCount: querySnapshot.docs.length,
          itemBuilder: (context, index) {
            // Access the User instance
            Friend friend = querySnapshot.docs[index].data;

            return 
            GestureDetector(
                                        onTap: () {
                                          
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => 
                                        FriendProfileScreen(
                                             friend.id
                                                    ),
                                
                              ),
                            );
                          },
              child: Card(                
                     color: Color.fromARGB(255, 49, 52, 59),
                        elevation: 8.0,
                        margin: EdgeInsets.all(5.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      
                      leading: 
                                                      Container(
                                                        height: 40,
                                                        width: 40,
                                                        child: avatar(friend.friendAvatar,20.0)),

                    //  Container(
                    //          // color: Colors.white,
                    //          //  alignment: Alignment.centerLeft,
                    //          child: CircleAvatar(
                    //            radius: 10.0,
                    //            backgroundImage: NetworkImage(friend.friendAvatar!)
                    //          ),
                   // ),
                            
                     title: Text(friend.friendNickname!,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w700,
                                )), //Text('title'), //Text(userData['nickname']),
                      subtitle: Text( friend.friendEmail!,style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8.0,
                                  fontWeight: FontWeight.w700,
                                )),
                //                               this.countrycount,
                // this.visitcount,
                // this.distancetotal,
                // this.regioncount,
                // this.placescount,
                // this.currentstreak,
                                 //Text('email'), //Text(userData['email']),
                      // trailing: ElevatedButton(
                      //                             style: ElevatedButton.styleFrom(
                      //         backgroundColor: Colors.orangeAccent,
                      //         elevation: 5,),
                        
                      //   child: Text('Accept \nFriend',
                      //   style: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 8.0,
                      //             fontWeight: FontWeight.w700,
            
                      //   )),
                      //   onPressed: () {
                      //     _acceptFriendRequest(friendrequest.id);
                      //   },
                      // ),
                    ),
                  ),
            );
            
            //Text('User name: ${friendrequest.requesterNickname}, Status ${friendrequest.status}');
          
          
          
          },
        );
      }
    );
    
  }

// void _acceptFriendRequest(String friendId) async {
//     final userRef =
//         FirebaseFirestore.instance.collection('users').doc(friendId);
//     final friendRequest = {
//       'status': 'accepted',
//     };
//     final friendRequestsRef = userRef.collection('friendRequests');
//    // final existingRequests = await friendRequestsRef
//    //     .where('requester', isEqualTo: friendRequest['requester'])
//    //     .get();
//    // if (existingRequests.docs.isEmpty) {
//      await friendRequestsRef.doc(friendId).update(friendRequest);
//     //  await friendRequestsRef.add(friendRequest);
//    // }
//   }
  // Insert two friend records.


}