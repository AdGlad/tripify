import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:gtk_flutter/model/placehistory.dart';

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
    this.joinData,
    this.friend,
    this.league,
    this.countrycount,
    this.visitcount,
    this.distancetotal,
    this.regioncount,
    this.placescount,
    this.currentstreak,
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
  DateTime? joinData;
  int? friend;
  int? league;

  int? countrycount;
  int? visitcount;
  int? distancetotal;
  int? regioncount;
  int? placescount;
  int? currentstreak;
  

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
class FriendRequest {
  FriendRequest({required this.id, this.userId, this.requesterId,this.requesterNickname,this.requesterEmail,this.requesterAvatar, this.status});
  //{
  //   _$assertPlaceHistory(this);
  // }

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
final usersRef = UserProfileCollectionReference();
//final friendrequestsRef = FriendRequestCollectionReference();
//FriendRequestCollectionReference friendrequestsRef = usersRef.doc('myDocumentID').addresses;




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

        return ListView.builder(
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
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundImage: NetworkImage(friendrequest.requesterAvatar!)
                            ),),
                          
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
                            backgroundColor: Colors.orangeAccent,
                            elevation: 5,),
                      
                      child: Text('Accept \nFriend',
                      style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w700,

                      )),
                      onPressed: () {
                        _acceptFriendRequest(friendrequest.id);
                      },
                    ),
                  ),
                );
            
            //Text('User name: ${friendrequest.requesterNickname}, Status ${friendrequest.status}');
          
          
          
          },
        );
      }
    );
    
  }
void _acceptFriendRequest(String friendId) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(friendId);
    final friendRequest = {
      'status': 'accepted',
    };
    final friendRequestsRef = userRef.collection('friendRequests');
   // final existingRequests = await friendRequestsRef
   //     .where('requester', isEqualTo: friendRequest['requester'])
   //     .get();
   // if (existingRequests.docs.isEmpty) {
     await friendRequestsRef.doc(friendId).update(friendRequest);
    //  await friendRequestsRef.add(friendRequest);
   // }
  }

}



class FriendList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FirestoreBuilder<FriendRequestQuerySnapshot>(
      ref: usersRef.doc(FirebaseAuth.instance.currentUser!.uid).friendRequests.whereStatus(isEqualTo: 'accepted'),
      builder: (context, AsyncSnapshot<FriendRequestQuerySnapshot> snapshot, Widget? child) {
        if (snapshot.hasError) return Text('Something went wrong!');
        if (!snapshot.hasData) return Text('Loading users...');

        // Access the QuerySnapshot
        FriendRequestQuerySnapshot querySnapshot = snapshot.requireData;

        return ListView.builder(
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
                            child: CircleAvatar(
                              radius: 10.0,
                              backgroundImage: NetworkImage(friendrequest.requesterAvatar!)
                            ),),
                          
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
                );
            
            //Text('User name: ${friendrequest.requesterNickname}, Status ${friendrequest.status}');
          
          
          
          },
        );
      }
    );
    
  }
void _acceptFriendRequest(String friendId) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(friendId);
    final friendRequest = {
      'status': 'accepted',
    };
    final friendRequestsRef = userRef.collection('friendRequests');
   // final existingRequests = await friendRequestsRef
   //     .where('requester', isEqualTo: friendRequest['requester'])
   //     .get();
   // if (existingRequests.docs.isEmpty) {
     await friendRequestsRef.doc(friendId).update(friendRequest);
    //  await friendRequestsRef.add(friendRequest);
   // }
  }

}

