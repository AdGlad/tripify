import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gtk_flutter/model/users.dart';

import '../../state/applicationstate.dart';
import '../country/ActiveCountryPage.dart';
//import '../ActiveCountryPage.dart';

Container UserCntryContainer(
    BuildContext context, UserProfile? user, ApplicationState appState) {
  return Container(
      width: MediaQuery.of(context).size.width,
      child: GestureDetector(
        onTap: () {
          String flags = '';
          for (var item in appState.tripHistory) {
            flags = flags + CountryFlag(item.countryCode!);
          }

          FlutterShare.share(
            title: 'My Location',
            text:
                'Tripify: I have a ${user?.currentstreak} day streak! \n Travelled ${appState.userProfile!.distancetotal} Kms\n visited ${appState.userProfile!.countrycount} countries \n $flags ',
            chooserTitle: 'Share on social media',
          );
        },
        child: Card(
          color: Color.fromARGB(255, 49, 52, 59),
          elevation: 8.0,
          margin: EdgeInsets.all(2.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.all(0.0),
                width: MediaQuery.of(context).size.width - 20,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  reverse: true,
                  itemCount: appState.tripHistory.length,
                  itemBuilder: (BuildContext context, int index) {
                    return FittedBox(
                      fit: BoxFit.fill,

                      //                    fit: BoxFit.scaleDown,

                      child: Text(
                        CountryFlag(appState.tripHistory[index].countryCode!),
                        style: TextStyle(fontSize: 25),
                      ),
                    );
                  },
                ),
              ),
              // Container(
              //           alignment: Alignment.topLeft,
              //           margin: EdgeInsets.all(5.0),
              //     width: 40,
              //     child: IconButton(
              //       iconSize: 25,
              //       color: Color.fromARGB(255, 26, 173, 182),
              //       onPressed: () {
              //         String flags = '';
              //         for (var item in appState.tripHistory) {
              //           flags = flags + CountryFlag(item.countryCode!);
              //         }

              //         FlutterShare.share(
              //           title: 'My Location',
              //           text:
              //               'Tripify: I have a ${user.currentstreak} day streak! \n Travelled ${appState.user.distancetotal} Kms\n visited ${appState.user.countrycount} countries \n $flags ',
              //           chooserTitle: 'Share on social media',
              //         );
              //       },
              //       icon: const Icon(Icons.share),
              //       tooltip: 'Share',
              //     )),
            ],
          ),
        ),
      ));
}
