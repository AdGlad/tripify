 import 'package:flutter/material.dart';
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/league/league.dart';
import 'package:provider/provider.dart';
import '../state/applicationstate.dart';
import 'dart:developer' as developer;


class FindFriendsPage extends StatefulWidget {
    const FindFriendsPage({super.key});


  @override
  _FindFriendsPageState createState() => _FindFriendsPageState();
}

class _FindFriendsPageState extends State<FindFriendsPage> {
  
  final TextEditingController _searchController = TextEditingController();
  List<QueryDocumentSnapshot> _searchResults = [];

bool isFriend(   List<Friend> friendlist, String friendUserId) {

bool isfriend = friendlist.any((friend) => friend.friendId == friendUserId);
if ( isfriend)
{
  developer.log('Is Friend $friendUserId');

  return true;
}
else {
    developer.log('Is NOT Friend $friendUserId');

  return false;
}
}

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
                _search(value.toLowerCase());
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
                    leading: 
                  //   Text('Hello'),
                    // Text(userData.data().toString().contains('avatar')?userData['avatar'] : 'null'),
                   //  Text(userData.data().toString().contains('avatar')?userData['avatar'] : 'null'),
                    Container( width: 40,
                    height: 40,
                      child: avatar(userData.data().toString().contains('avatar')?userData['avatar'] : null ,30.0), 
                      ),

                   // Text('Hello'),

                    //avatar(userData['avatar']),
                    
                    
                    //  Container(
                    //         // color: Colors.white,
                    //         //  alignment: Alignment.centerLeft,
                    //         child: CircleAvatar(
                    //           radius: 10.0,
                    //           backgroundImage: 
                              
                    //           userData['avatar'] !=null
                    //            //   ? null //FileImage(_imageFile)
                    //            //   : userData['avatar'] != null
                    //                   ? NetworkImage(userData['avatar'])
                    //                   : AssetImage('assets/quokka1.png'),
                    //       ),
                   title: Text(userData.data().toString().contains('nickname')? userData['nickname'] : ' ' ,
                  //  userData['nickname'],
                   style: TextStyle(
                                color: Colors.white,
                                fontSize: 10.0,
                                fontWeight: FontWeight.w700,
                              )), //Text('title'), //Text(userData['nickname']),
                    subtitle: 
                    Text( userData.data().toString().contains('email')?userData['email'] : ' '  , //['email'],
                   style: TextStyle(
                                color: Colors.white,
                                fontSize: 8.0,
                                fontWeight: FontWeight.w700,
                              )), //Text('email'), //Text(userData['email']),
                    trailing:
                    isFriend(appState.friendList,userData['userId']) ? 
                                       Container(padding: EdgeInsets.all(10.0),
                                        child: Icon(size: 30,Icons.person, color: Colors.blue))
                                       // Icons.check_circle, color: Colors.green)
                     :
                     //IconButton(onPressed: () {_sendFriendRequest(uid, appState.userProfile!);}, icon: Icon(Icons.person, color: Colors.blue)),
                    ElevatedButton(
                                                style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orangeAccent,
                            elevation: 5,),
                      
                      child: Icon(Icons.person_add, color: Colors.white,),
                      //Text('Friend'),
                      onPressed: () {
                       // _sendFriendRequest(uid, appState.userProfile!);
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
        .orderBy('nickname', descending: false) // Order the data by 'nickname'
        //.doc()
        .where('nickname', isGreaterThanOrEqualTo: value)
        .where('nickname', isLessThanOrEqualTo: value + '\uf8ff')
        //.where('status', isNotEqualTo: 'pending')
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
