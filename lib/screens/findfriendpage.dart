import 'package:firebase_auth/firebase_auth.dart';
 import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:provider/provider.dart';

import '../state/applicationstate.dart';

class FindFriendsPage extends StatefulWidget {
    const FindFriendsPage({super.key});


  @override
  _FindFriendsPageState createState() => _FindFriendsPageState();
}

class _FindFriendsPageState extends State<FindFriendsPage> {
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> _searchResults = [];

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<ApplicationState>(
            builder: (context, appState, _) => Center(
                    child: 
    
    Scaffold(
      appBar: AppBar(
        title: Text('Find Friends'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for friends...',
              ),
              onChanged: (value) {
                _search(value);
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _searchResults.length,
              itemBuilder: (BuildContext context, int index) {
                final userData = _searchResults[index]; // .data();
                final uid = _searchResults[index].id;
                return Card(
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
                              backgroundImage: userData['avatar'] == null
                                  ? null //FileImage(_imageFile)
                                  : userData['avatar'] != null
                                      ? NetworkImage(userData['avatar'])
                                      : null,
                            ),
                          ),
                   title: Text(userData['nickname'],style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w700,
                              )), //Text('title'), //Text(userData['nickname']),
                    subtitle: Text(userData['email'],style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w700,
                              )), //Text('email'), //Text(userData['email']),
                    trailing: ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            elevation: 5,),
                      
                      child: Text('Add Friend'),
                      onPressed: () {
                        _sendFriendRequest(uid, appState.userProfile!);
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
            ))));

  }

  void _search(String value) async {
    final results = await FirebaseFirestore.instance
        .collection('users')
        //.doc()
        .where('nickname', isGreaterThanOrEqualTo: value)
        .where('nickname', isLessThanOrEqualTo: value + '\uf8ff')
      //  .where('userId', isNotEqualTo: FirebaseAuth.instance.currentUser!.uid)
     // .where(FieldPath.documentId, isNotEqualTo: FirebaseAuth.instance.currentUser!.uid )
        .get();
    setState(() {
      _searchResults = results.docs;
    });
  }

  void _sendFriendRequest(String friendId, UserProfile currentUser) async {
    final userRef =
        FirebaseFirestore.instance.collection('users').doc(friendId);
    final friendRequest = {
      'userId': friendId ,
      'requesterId': currentUser.id,
      'requesterNickname': currentUser.nickname,
      'requesterEmail': currentUser.email,
      'requesterAvatar': currentUser.avatar,
      'status': 'pending',
    };
    final friendRequestsRef = userRef.collection('friendRequests');
   // final existingRequests = await friendRequestsRef
   //     .where('requester', isEqualTo: friendRequest['requester'])
   //     .get();
   // if (existingRequests.docs.isEmpty) {
     await friendRequestsRef.doc(currentUser.id).set(friendRequest, SetOptions(merge: true));

    //  await friendRequestsRef.add(friendRequest);
   // }
  }
}
