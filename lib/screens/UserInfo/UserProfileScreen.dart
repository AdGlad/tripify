import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:gtk_flutter/screens/UserInfo/UserStatsContainer.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/users.dart';
import '../../state/applicationstate.dart';
import '../checkIn/UserMapContainer.dart';

class UserProfileScreen extends StatelessWidget {
  final String userId;

  UserProfileScreen({required this.userId});

 // Future<DocumentSnapshot<Map<String, dynamic>>> getUserProfile(
 //     String userId) async {
 //   final userRef = FirebaseFirestore.instance.collection('users').doc(userId);
 //   final snapshot = await userRef.get();

   // return snapshot;
 // }

  @override
  Widget build(BuildContext context) {
    return Container(
       child: Consumer<ApplicationState>(
        builder: (context, appState, _) =>
      Scaffold(
        appBar: AppBar(
          title: Text('Profile'),
        ),
        body: 
        Column(
              children: [
                Expanded(flex: 1, child: userStatsContainer(appState.userProfile, context)),
               // userStatsContainer(_userProfile, context),
              //  UserMapContainer( context, _userProfile!, null)
                //Container(child: UserMapContainer( context, _userProfile!))
              Expanded( flex: 1, child: UserMapContainer( context, appState.userProfile)) 
    
              ]
              )
              )
              )
              );
              }
              }
     