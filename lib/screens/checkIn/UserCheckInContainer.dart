import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/checkIn/userSaveLocation.dart';

import '../../model/usertotals.dart';
import '../../state/applicationstate.dart';
import '../ActiveCountryPage.dart';
import '../checkcountry.dart';
import 'dart:developer' as developer;


Container UserCheckInContainer(BuildContext context, UserProfile user, ApplicationState appState   )
   {
    return                                        Container(
                       child: Card(
                        color: Color.fromARGB(255, 49, 52, 59),
                        elevation: 8.0,
                        margin: EdgeInsets.all(5.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                     
                        //  width: MediaQuery.of(context).size.width - 20,
                        //    margin: const EdgeInsets.all(5.0),
                        //   color: Colors.blueAccent,
                        child: Center(
                          // child: Row(
                          //   children: [
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orangeAccent,
                              elevation: 5,
                            ),
                            onPressed: () async {
                            //  _toggleLoading();
                              await saveLocation(context,
                                  appState.currentPlace, appState.userProfile);
                              updateStats(appState.userTotals);
                             // _toggleLoading();
                            },
                            child: //_isLoading
                               // ? CircularProgressIndicator()
                                //: 
                                Text('Check-in',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                      fontWeight: FontWeight.w700,
                                    )),
                          ),
                        ),
                                         ),
                     );

   }
   
  Future<void> updateStats(UserTotals userTotals) async {
    final user = FirebaseAuth.instance.currentUser;
    // await user?.updateDisplayName(_nicknameController.text);
    // await user!.updateDisplayName("you");
    developer.log(
        'Update users ${userTotals.CountryCount}, ${userTotals.VisitCount}, ${userTotals.DistanceTotal}, ${userTotals.RegionTotal}, ${userTotals.PlacesCount}');
    await FirebaseFirestore.instance.collection('users').doc(user!.uid).update({
      'countrycount': userTotals.CountryCount ?? 0,
      'visitcount': userTotals.VisitCount ?? 0,
      'distancetotal': userTotals.DistanceTotal ?? 0,
      'regiontotal': userTotals.RegionTotal ?? 0,
      'placescount': userTotals.PlacesCount ?? 0,
    });
  }