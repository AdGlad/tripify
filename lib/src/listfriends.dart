//import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/users.dart';

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
      body: FriendList() //UserProfileList() //Text('Friend Requests'),  // FriendRequests(),
    );
  }
}
