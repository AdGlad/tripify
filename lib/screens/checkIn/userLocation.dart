import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/ActiveCountryPage.dart';
import 'package:intl/intl.dart';

import '../../state/applicationstate.dart';

Container UserLocationContainer(
    BuildContext context, UserProfile user, ApplicationState appState) {
  return Container(
    //ss  width: MediaQuery.of(context).size.width - 5,
    child: GestureDetector(
      onTap: () {
        FlutterShare.share(
          //  title: 'My Streak',
          title: 'My Location',
          text:
              'Tripify: Hi, I am visiting ${appState.currentPlace!.streetAddress} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!! ${appState.userProfile?.nickname}',
          chooserTitle: 'Share on social media',
        );
      },
      child: Card(
        color: Color.fromARGB(255, 49, 52, 59),
        elevation: 8.0,
        margin: EdgeInsets.all(2.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Container(
          alignment: Alignment.topLeft,
          child: Row(
            children: [
              // (appState.currentPlace != null)
              //     ? Container(
              //         alignment: Alignment.topLeft,
              //     //    margin: EdgeInsets.all(0.0),
              //         child: Text(
              //           CountryFlag(appState.currentPlace!.countryCode!),
              //           style: TextStyle(fontSize: 35),
              //         ),
              //       )
              //     : Text('', style: TextStyle(fontSize: 10)),
              //   ),
              Expanded(
                child: FittedBox(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.all(5.0),
                        child: Row(
                          children: [
                            (appState.currentPlace != null)
                                ? Text(appState.currentPlace!.countryName!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ))
                                : Text('', style: TextStyle(fontSize: 20)),
                            Text(': ', style: TextStyle(fontSize: 20)),
                            (appState.currentPlace != null)
                                ? Text(appState.currentPlace!.region!,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.w700,
                                    ))
                                : Text('', style: TextStyle(fontSize: 20)),
                          ],
                        ),
                      ),
                      (appState.currentPlace != null)
                          ? Text(appState.currentPlace!.streetAddress!,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                              ))
                          : Text('', style: TextStyle(fontSize: 20)),
                    ],
                  ),
                ),
              ),
              //         IconButton(
              //           color: Color.fromARGB(255, 26, 173, 182),
              //           onPressed: () {                            FlutterShare.share(
              //     //  title: 'My Streak',
              //     title: 'My Location',
              //     text:
              //         'Tripify: Hi, I am visiting ${appState.currentPlace!.streetAddress} ${CountryFlag(appState.currentPlace!.countryCode!)} today ${DateFormat('dd MMMM yyyy').format(DateTime.now())}!! ${appState.userProfile?.nickname}' ,
              //     chooserTitle: 'Share on social media',
              //   );},
              //           icon: const Icon(Icons.share),
              //           tooltip: 'Share',
              //         ),
            ],
          ),
        ),
      ),
    ),
  );
}
