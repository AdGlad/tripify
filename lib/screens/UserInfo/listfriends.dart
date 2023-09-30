//import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/UserInfo/FriendProfileScreen.dart';

import '../league/league.dart';

class ListFriends extends StatefulWidget {
  const ListFriends({super.key});

  @override
  State<ListFriends> createState() => _ListFriendsState();
}

class _ListFriendsState extends State<ListFriends> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
      ),
      body: 
Column(
  children: [
        Container(height: 300, child: FriendList()),
        Container(height: 300, child: League()),
  ],
) //UserProfileList() //Text('Friend Requests'),  // FriendRequests(),
    );
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
  }