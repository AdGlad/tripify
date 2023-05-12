import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/ActiveCountryPage.dart';
import 'package:intl/intl.dart';

import '../../state/applicationstate.dart';

Container UserLocationContainer(BuildContext context, UserProfile user ,ApplicationState appState    )
   {
    return                    Container(
                      height: 70,
                      width: MediaQuery.of(context).size.width - 5,
                      child: Card(
                        color: Color.fromARGB(255, 49, 52, 59),
                        elevation: 8.0,
                        margin: EdgeInsets.all(2.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),

                        //  width: MediaQuery.of(context).size.width - 20,
                        // margin: const EdgeInsets.all(5.0),
                        // color: Colors.greenAccent,
                        child: Row(
                            children: [
                                 // Padding(
                                  //  padding: const EdgeInsets.all(2.0),
                                    //child: 
                                    (appState.currentPlace != null)
                                        ? Text(
                                            CountryFlag(appState
                                                .currentPlace!.countryCode!),
                                            style: TextStyle(fontSize: 45),
                                          )
                                        : Text('',
                                            style: TextStyle(fontSize: 10)),
                               //   ),
                              Expanded(
                                child: Column(
                                  children: [
                                              Row(
                                      //  runAlignment: WrapAlignment.center,
                                        children: [
                                          (appState.currentPlace != null)
                                              ? Text(
                                                  appState.currentPlace!.countryName!,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w700,
                                                  ))
                                              : Text('',
                                                  style: TextStyle(fontSize: 10)),
                                          Text(': ', style: TextStyle(fontSize: 10)),
                                          (appState.currentPlace != null)
                                              ? Text(appState.currentPlace!.region!,
                                                  textAlign: TextAlign.left,
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0,
                                                    fontWeight: FontWeight.w700,
                                                  ))
                                              : Text('',
                                                  style: TextStyle(fontSize: 10)),
                                        ],
                                      ),
                                    
                                    (appState.currentPlace != null)
                                    ? 
                                        Text(
                                            appState.currentPlace!.streetAddress!,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 8.0,
                                              fontWeight: FontWeight.w700,
                                            ))
                                      
                                    : Text('', style: TextStyle(fontSize: 10)),
                                // Text(': ',style: TextStyle(fontSize: 10)),
                                      //  ButtonBar(
                               //   alignment: MainAxisAlignment.end,
                                 // children: [
                                    // IconButton(
                                    //   color: Color.fromARGB(255, 26, 173, 182),
                                    //   onPressed: () {},
                                    //   icon: const Icon(Icons.share),
                                    //   tooltip: 'Share',
                                    // ),
                                    //child: Text('SHARE')),
                                //  ],
                                //)
                                  ],
                                
                                ),
                                
                              ),
                          //          TextButton(
                          //   child: Text('SHARE', style: TextStyle(fontSize: 12)),
                          //   onPressed: () {
                          //     String flags = '';
                          //     for (var item in appState.tripHistory) {
                          //       flags = flags + CountryFlag(item.countryCode!);
                          //     }
                          //     FlutterShare.share(
                          //       //  title: 'My Streak',
                          //       title: 'My Location',
                          //       text:
                          //           //  'Tripify: I have a $_currentStreak day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                          //           // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                          //           // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                          //           'Tripify: Hi, I am visiting ${appState.currentPlace?.region} in ${appState.currentPlace?.name} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
                          //       chooserTitle: 'Share on social media',
                          //     );
                          //     // TODO: Implement share functionality
                          //     Navigator.of(context).pop();
                          //   },
                          // ),
                                    IconButton(
                                      color: Color.fromARGB(255, 26, 173, 182),
                                      onPressed: () {                            FlutterShare.share(
                                //  title: 'My Streak',
                                title: 'My Location',
                                text:
                                    //  'Tripify: I have a $_currentStreak day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                    // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                    // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                  //  'Tripify: Hi, I am visiting ${appState.currentPlace?.region} in ${appState.currentPlace?.name} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
                                    'Tripify: Hi, I am visiting ${appState.currentPlace!.streetAddress} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!! ${appState.userProfile?.nickname}' ,
                                chooserTitle: 'Share on social media',
                              );},
                                      icon: const Icon(Icons.share),
                                      tooltip: 'Share',
                                    ),
                              // (appState.currentPlace != null)
                              //           ? Text(
                              //               CountryFlag(appState
                              //                   .currentPlace!.countryCode!),
                              //               style: TextStyle(fontSize: 35),
                              //             )
                              //           : Text('',
                              //               style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        
                        
                      ),
                    );
          
   }
