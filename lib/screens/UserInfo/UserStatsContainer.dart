import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/ActiveCountryPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:intl/intl.dart';

import '../../model/placehistory.dart';
import '../../model/users.dart';

//Widget userStatsContainer(Map<String, dynamic>? userProfile, BuildContext context) {
Widget userStatsContainer(UserProfile? userProfile, BuildContext context) {

  return          Container(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Statistics for ${userProfile!.nickname}',
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
                                child: buildCard(
                                    userProfile?.currentstreak,
                                  //  userProfile?['currentStreak'],
                                    'Days',
                                    Icons.local_fire_department,
                                    'Streak')),
                           // SizedBox(width: 12.0),
                            Expanded(
                                child: buildCard(
                                  userProfile.distancetotal,
                                   // userProfile?['distancetotal'],
                                    'Kms',
                                    Icons.run_circle,
                                    'Distance')),
                          ],
                        ),
                        //SizedBox(height: 16.0),
                        Row(
                          children: [
                            Expanded(
                                child: buildCard(
                                   userProfile.countrycount,
                                   // userProfile?['countrycount'],
                                    '',
                                    Icons.map_outlined,
                                    'Countries')),
                           // SizedBox(width: 16.0),
                            Expanded(
                                child: buildCard(
                                   userProfile.placescount,
                                  //  userProfile?['placescount'],
                                    '',
                                    Icons.place,
                                    'Check-ins')),
                          ],
                        ),
                      ],
                    ),
                  );
        
}
