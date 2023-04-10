//import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:gtk_flutter/model/users.dart';

class AcceptFriendRequests extends StatefulWidget {
  const AcceptFriendRequests({super.key});

  @override
  State<AcceptFriendRequests> createState() => _AcceptFriendRequestsState();
}

class _AcceptFriendRequestsState extends State<AcceptFriendRequests> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Friend Requests'),
      ),
      body: FriendRequestList() //UserProfileList() //Text('Friend Requests'),  // FriendRequests(),
    );
  }
}
