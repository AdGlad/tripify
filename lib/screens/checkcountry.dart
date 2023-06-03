import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gtk_flutter/model/placehistory.dart';
import 'package:gtk_flutter/model/users.dart';
import 'package:gtk_flutter/screens/checkIn/UserCheckInContainer.dart';
import 'package:gtk_flutter/screens/checkIn/userCntryContainer.dart';
import 'package:gtk_flutter/screens/checkIn/userLocationContainer.dart';
import 'package:gtk_flutter/screens/checkIn/userStreakContainer.dart';
import 'package:gtk_flutter/src/confetti.dart';
import 'dart:developer' as developer;
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:location/location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:gtk_flutter/src/globals.dart' as globals;
import 'package:confetti/confetti.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:geolocator/geolocator.dart';
import '../model/usertotals.dart';
import '../src/ad_helper.dart';
import '../state/applicationstate.dart';
import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'checkIn/userMapContainer.dart';

class CheckCountry extends StatefulWidget {
  const CheckCountry({super.key});

  @override
  State<CheckCountry> createState() => _CheckCountryState();
}
  late ConfettiController controllerConfetti;

class _CheckCountryState extends State<CheckCountry> {
  @override
  void initState() {
    super.initState();

    _bannerAd?.dispose();

    setState(() {
      initController();
    });

    getLocation();
    
    BannerAd(
      adUnitId: AdHelper.bannerAdUnitId,
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          setState(() {
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          ad.dispose();
        },
      ),
    ).load();
  }

  bool _isLoading = false;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void initController() {
    controllerConfetti =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    // dispose the controller
    controllerConfetti.dispose();
    super.dispose();
    _bannerAd?.dispose();
  }

  PlaceHistory? currentPlace;

  LocationData? newPlace;
  Location _location = Location();
  LatLng? _newLatLng;
  
  


  void getLocation() async {
    try {
      var locationData = await _location.getLocation();
      setState(() {
        newPlace = locationData;
        developer.log(newPlace!.latitude.toString(), name: 'my.app.urlstring');
      });
    } catch (e) {
      print('Could not get the location: $e');
    }
  }

 
  BannerAd? _bannerAd;

  
  Future<void> shareFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null || result.files.isEmpty) return null;

    await FlutterShare.shareFile(
      title: 'Example share',
      text: 'Example share text',
      filePath: result.files[0] as String,
    );
  }

  final _controller = ScreenshotController();

  Future<void> shareScreenshot() async {
    Directory? directory;
    if (Platform.isAndroid) {
      directory = await getExternalStorageDirectory();
    } else {
      directory = await getApplicationDocumentsDirectory();
    }
    final String localPath =
        '${directory!.path}/${DateTime.now().toIso8601String()}.png';

    await _controller.captureAndSave(localPath);

    await Future.delayed(Duration(seconds: 1));

    await FlutterShare.shareFile(
        title: 'Tripify', filePath: localPath, fileType: 'image/png');
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Consumer<ApplicationState>(
        builder: (context, appState, _) => Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  children: [ 
                    Expanded(
                      child: Container(
                        child: (_bannerAd != null)
                            ? Align(
                                alignment: Alignment.topCenter,
                                child: Container(
                                  width: _bannerAd!.size.width.toDouble(),
                                  height: _bannerAd!.size.height.toDouble(),
                                  child: AdWidget(ad: _bannerAd!),
                                ),
                              )
                            : Text('No Ad'),
                      ),
                    ),
                    Expanded(  child: UserStreakContainer(context, appState.  userProfile)),
                    Expanded(flex: 1,child: UserCntryContainer(context, appState.userProfile, appState)),
                   // Expanded(flex: 6,child: UserMapContainer(context, appState.userProfile!, newPlace)),
                    Expanded(flex: 6,child: UserMapContainer(context, appState.userProfile!)),
                    Expanded(flex: 1,child: UserLocationContainer( context, appState.userProfile! , appState )),
                    Expanded(child: CheckInContainer(context: context, appState: appState , user: appState.userProfile!)),
                          // Spacer(),
                     Container(
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: 
                        
                        ConfettiWidget(
                          confettiController: controllerConfetti,
                          blastDirectionality: BlastDirectionality.explosive,
                          createParticlePath: drawStar,
                          blastDirection: -pi / 2,
                          maxBlastForce: 30,
                          minBlastForce: 10,
                          emissionFrequency: 0.03,
                          numberOfParticles: 50,
                          gravity: 0.1,
                        ),
                        
                      ),
                     )
                  ], // here
                ),
              ), //Listview
            ],
          ), //stack
        ),
      ),
    );
  }
}
