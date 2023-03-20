//import 'dart:ffi';
//import 'dart:math';

//import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';
//import 'package:flutter/src/widgets/container.dart';
//import 'package:flutter/src/widgets/framework.dart';
//import 'package:gtk_flutter/model/placehistory.dart';
import 'package:gtk_flutter/screens/ActiveCountryPage.dart';
import 'package:gtk_flutter/screens/checkcountry.dart';
import 'package:gtk_flutter/screens/UserCountryPage.dart';
import 'package:gtk_flutter/screens/logoutprofile.dart';
//import 'package:gtk_flutter/src/confetti.dart';
//import 'package:gtk_flutter/screens/delete_mapcontainer.dart';
//import 'dart:developer' as developer;
//import 'dart:convert';
//import 'package:http/http.dart' as http;
//import 'package:gtk_flutter/src/delete_location.dart' as triplocation;
//import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:mapbox_gl/mapbox_gl.dart';
//import 'package:provider/provider.dart';
//import 'dart:developer';
//import 'package:gtk_flutter/src/globals.dart' as globals;
//import 'package:confetti/confetti.dart';
//import 'package:audioplayers/audioplayers.dart';

//import '../src/authentication.dart';
//import '../state/applicationstate.dart';
//import 'dart:typed_data';
//import 'package:audioplayers/audioplayers.dart';
//import 'package:flutter/services.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

import '../src/ad_helper.dart';
import '../state/applicationstate.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

// void signOut() {
//   FirebaseAuth.instance.signOut();
// }

class _MainPageState extends State<MainPage> {
  @override
  // initState() {
  //   BannerAd(
  //     adUnitId: AdHelper.bannerAdUnitId,
  //     request: AdRequest(),
  //     size: AdSize.banner,
  //     listener: BannerAdListener(
  //       onAdLoaded: (ad) {
  //         setState(() {
  //           _bannerAd = ad as BannerAd;
  //         });
  //       },
  //       onAdFailedToLoad: (ad, err) {
  //         print('Failed to load a banner ad: ${err.message}');
  //         ad.dispose();
  //       },
  //     ),
  //   ).load();
  // }

  int _selectedIndex = 0;
  List<Widget> pageList = [
    const CheckCountry(),
    const UserCountryPage(),
    const ActiveCountryPage(),
    // const UserCountryPage(),
    // const ActiveCountryPage(),
    // const QuickScanScreen(),
  ];

  BannerAd? _bannerAd;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Consumer<ApplicationState>(
            builder: (context, appState, _) => Center(
                    child: Scaffold(
                  appBar: AppBar(
                    title: const Text('Tripify'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            context.go("/sign-in");
                          },
                          // {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: (context) => const LogoutProfile()));
                          // },
                          icon: Icon(Icons.login)),

                      // if (appState.loggedIn == true) ...[
                      // IconButton(
                      //     onPressed: () {
                      //       context.go("/profile");
                      //     },
                      //     // {
                      //     //   Navigator.push(
                      //     //       context,
                      //     //       MaterialPageRoute(
                      //     //           builder: (context) => const LogoutProfile()));
                      //     // },
                      //     icon: Icon(Icons.logout))
                      // ] else ...[
                      //   IconButton(
                      //       onPressed: () {
                      //         context.go("/sign-in");
                      //       },
                      //       // {
                      //       //   Navigator.push(
                      //       //       context,
                      //       //       MaterialPageRoute(
                      //       //           builder: (context) => const LogoutProfile()));
                      //       // },
                      //       icon: Icon(Icons.login)),
                      // ]
                    ],
                  ),
                  body: SafeArea(
                    child: Stack(
                      children: <Widget>[
                        // Positioned(
                        //   top: 0,
                        //   // left: 0,
                        //   // right: 0,
                        //   child: (_bannerAd != null)
                        //       ? Align(
                        //           alignment: Alignment.topCenter,
                        //           child: Container(
                        //             width: _bannerAd!.size.width.toDouble(),
                        //             height: _bannerAd!.size.height.toDouble(),
                        //             child: AdWidget(ad: _bannerAd!),
                        //           ),
                        //         )
                        //       : Text('No Ad'),
                        // ),
                        // Positioned(
                        //     top: 40,
                        //     child: Expanded(
                        //      child: pageList.elementAt(_selectedIndex)
                        //))
                        //Text(" fsfsflsjflkjsdflkjslfkjs")
                        //)
                        // Positioned(
                        //   top: 20,
                        //   // left: 0,
                        //   // right: 0,
                        //   //child: SafeArea(
                        //   child:
                        Container(
                          // margin: const EdgeInsets.all(5.0),
                          child: pageList.elementAt(_selectedIndex),
                        ),
                        //)
                        // )
                        // TODO: Display a banner when ready
                      ],
                    ),
                  ),

                  //ListView.builder(itemBuilder: ,)
                  // (children: [
                  // Column(
                  //  children: [
                  // Text('Banner'),
                  // // TODO: Display a banner when ready
                  // if (_bannerAd != null)
                  //   Align(
                  //     alignment: Alignment.topCenter,
                  //     child: Container(
                  //       width: _bannerAd!.size.width.toDouble(),
                  //       height: _bannerAd!.size.height.toDouble(),
                  //       child: AdWidget(ad: _bannerAd!),
                  //     ),
                  //   ),

                  //  pageList.elementAt(_selectedIndex),
                  //   ]),
                  //],
                  //  ),

                  // CheckCountry(),
                  bottomNavigationBar: BottomNavigationBar(
                    onTap: (index) => setState(() {
                      _selectedIndex = index;
                    }),
                    // onTap: _onTappedHandler,
                    //         selectedFontSize: 20,
                    // selectedIconTheme: IconThemeData(color: Colors.amberAccent, size: 40),
                    // selectedItemColor: Colors.amberAccent,
                    // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold,
                    items: const <BottomNavigationBarItem>[
                      BottomNavigationBarItem(
                        icon: Icon(Icons.my_location),
                        label: 'Location',
                      ),
                      BottomNavigationBarItem(
                        icon:
                            Icon(Icons.outlined_flag), //flag_circle_outlined),
                        label: 'Countries',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.map_outlined),
                        label: 'Maps',
                      ),
                    ],
                  ),
                ))));
  }

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd?.dispose();
    super.dispose();
  }
}
