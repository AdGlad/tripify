import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/UserInfo/UserStatsContainer.dart';
import 'package:provider/provider.dart';

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
          title: Text('User States $userId'),
        ),
        body: 
        Column(
              // PlaceHistorylist(
             // countrycode: widget.countrycode, regioncode: widget.regioncode, userid: widget.userid),
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
     