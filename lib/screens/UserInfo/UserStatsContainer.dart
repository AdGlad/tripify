import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../model/placehistory.dart';
import '../../model/users.dart';
import '../../src/customwidgets.dart';
import '../../state/applicationstate.dart';

//Widget userStatsContainer(Map<String, dynamic>? userProfile, BuildContext context) {
Widget userStatsContainer(UserProfile? userProfile, BuildContext context) {

  return          Center(child: Consumer<ApplicationState>(
        builder: (context, appState, _) =>
    Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Text(
                            'Statistics for ${appState.userProfile!.nickname}',
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                         // Text( 'joinDate',
                          Text('Join Date: ${DateFormat('dd MMMM yyyy').format(userProfile!.joinDate!)}',
                          //  Text('Join Date: ${DateFormat('dd MMMM yyyy').format((userProfile?['joinDate'] as Timestamp ).toDate())}',
  
                            style: TextStyle(
                                fontSize: 12.0, fontWeight: FontWeight.bold),
                          ),
                        //  SizedBox(height: 12.0),
                          Row(
                            children: [
                             Expanded(
                                  child: IconTextWidget(icon: Icons.local_fire_department,units: 'Days', message: appState.userProfile!.currentstreak.toString(), size: 12, title: 'Streak',)),
                             Expanded(
                                  child:IconTextWidget(icon: Icons.run_circle,units: 'km', message: appState.userProfile!.distancetotal!.toInt().toString(), size: 12, title: 'Distance',)),
                            ]

                          ),
                          //SizedBox(height: 16.0),
                          Row(
                            children: [
                                                           Expanded(
                                  child: IconTextWidget(icon: Icons.map_outlined,units: '', message: appState.userProfile!.countrycount.toString(), size: 12, title: 'Countries',)),
                             Expanded(
                                  child:IconTextWidget(icon: Icons.place,units: '', message: appState.userProfile!.placescount!.toInt().toString(), size: 12, title: 'Check-ins',)),
     
                             ],
                          ),
                        ],
                      ),
                    ),
  ));
        
}


