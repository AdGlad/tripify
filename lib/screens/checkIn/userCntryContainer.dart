import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gtk_flutter/model/users.dart';

import '../../state/applicationstate.dart';
import '../ActiveCountryPage.dart';



Container UserCntryContainer(BuildContext context, UserProfile user, ApplicationState appState   )
   {
    return                   Container(
                    child: Expanded(
                      child: Row(
                        children: [
                          
                            Container(
                                  // margin: EdgeInsets.all(1),
                                  color: Color.fromARGB(255, 49, 52, 59),
                                  height: 40,
                                  child: Container(
                          //                                    height: 20,
                                          width: MediaQuery.of(context).size.width-80,
                                    child: ListView.builder(
                                      // padding: EdgeInsetsGeometry.lerp(1, , 1.0)
                                      // shrinkWrap: true,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: appState.tripHistory
                                          .length, // appState.userCountrylist.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: Text(
                                            textAlign: TextAlign.center,
                                            CountryFlag(
                                                appState.tripHistory[index].countryCode!),
                                            style: TextStyle(fontSize: 25),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  // )
                                ),
                          
                             Container(
                              width: 80,
                                                              height: 40,
                  
                                                              color: Color.fromARGB(255, 49, 52, 59),
                  
                           //   child: Text('Hello')) 
                                                           child:    IconButton(
                                        color: Color.fromARGB(255, 26, 173, 182),
                                        onPressed: () {        
                                                                         String flags = '';
                                 for (var item in appState.tripHistory) {
                                   flags = flags + CountryFlag(item.countryCode!);
                                 }
                                          
                                                  FlutterShare.share(
                                  //  title: 'My Streak',
                                  title: 'My Location',
                                  text:
                                      //  'Tripify: I have a $_currentStreak day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                      // 'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags',
                                  //     'Tripify: I have a ${appState.userProfile?.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags \n  ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!! ${appState.userProfile?.nickname}',
                                       'Tripify: I have a ${user.currentstreak} day streak! \n Travelled ${appState.userTotals.DistanceTotal} Kms\n visited ${appState.userTotals.CountryCount} countries \n $flags ',
                                    //  'Tripify: Hi, I am visiting ${appState.currentPlace?.region} in ${appState.currentPlace?.name} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!!',
                                   //   'Tripify: Hi, I am visiting ${appState.currentPlace?.streetAddress} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!! ${appState.userProfile?.nickname}' ,
                                  chooserTitle: 'Share on social media',
                                );},
                                        icon: const Icon(Icons.share),
                                        tooltip: 'Share',
                             )),
                        ],
                        
                      ),
                    ),
                  );

   }
