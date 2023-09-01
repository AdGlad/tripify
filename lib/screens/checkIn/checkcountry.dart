import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gtk_flutter/model/placehistory.dart';
import 'package:gtk_flutter/screens/checkIn/UserCheckInContainer.dart';
import 'package:gtk_flutter/screens/checkIn/userCntryContainer.dart';
import 'package:gtk_flutter/screens/checkIn/userLocationContainer.dart';
import 'package:gtk_flutter/screens/checkIn/userStreakContainer.dart';
import 'package:gtk_flutter/src/confetti.dart';
import 'dart:developer' as developer;
import 'package:location/location.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:provider/provider.dart';
import 'package:confetti/confetti.dart';
import '../../src/ad_helper.dart';
import '../../state/applicationstate.dart';
import 'dart:async';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

import 'userMapContainer.dart';

class CheckCountry extends StatefulWidget {
  const CheckCountry({super.key});

  @override
  State<CheckCountry> createState() => _CheckCountryState();
}

late ConfettiController controllerConfetti;
late ConfettiController controllerConfettiGold;

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
    controllerConfettiGold =
        ConfettiController(duration: const Duration(seconds: 3));
  }

  @override
  void dispose() {
    // dispose the controller
    controllerConfetti.dispose();
    controllerConfettiGold.dispose();
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
      //  color: Color.fromARGB(255, 49, 52, 59),

      child: Consumer<ApplicationState>(
        builder: (context, appState, _) => Center(
          child: Stack(
            children: <Widget>[
              Center(
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
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
                    Expanded(
                        flex: 1,
                        child:
                            UserStreakContainer(context, appState.userProfile)),
                    Expanded(
                        flex: 2,
                        child: UserCntryContainer(
                            context, appState.userProfile, appState)),
                    Expanded(
                        flex: 12,
                        child: (appState.userProfile != null &&
                                appState.userProfile?.latestlatitude != null)
                            ? UserMapContainer(context, appState.userProfile)
                            : Container()),
                    Expanded(
                        flex: 2,
                        child: UserLocationContainer(
                            context, appState?.userProfile, appState)),
                    Expanded(
                        flex: 2,
                        child: CheckInContainer(
                            context: context,
                            appState: appState,
                            user: appState.userProfile)),
                    // Spacer(),
                    //  Container(
                    //   child: Align(
                    //     alignment: Alignment.topCenter,
                    //     child:

                    //     ConfettiWidget(
                    //       confettiController: controllerConfetti,
                    //       blastDirectionality: BlastDirectionality.explosive,
                    //       createParticlePath: drawStar,
                    //       blastDirection: -pi / 2,
                    //       maxBlastForce: 30,
                    //       minBlastForce: 10,
                    //       emissionFrequency: 0.03,
                    //       numberOfParticles: 50,
                    //       gravity: 0.1,
                    //     ),

                    //   ),
                    //  )
                  ], // here
                ),
              ),
              Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
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
              ), 
              Container(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConfettiWidget(
                    confettiController: controllerConfettiGold,
                    blastDirectionality: BlastDirectionality.explosive,
                    createParticlePath: drawStar,
                    blastDirection: -pi / 2,
                    maxBlastForce: 30,
                    minBlastForce: 10,
                    emissionFrequency: 0.03,
                    numberOfParticles: 500,
                    gravity: 0.1,
                   // colors: [Colors.yellow,const Color.fromARGB(255, 245, 140, 4),Color.fromARGB(255, 218, 194, 8)] // Confetti colors (gold)
                    colors: [Color.fromARGB(255, 218, 194, 8)] // Confetti colors (gold)

                  ),
                ),
              ), ///Listview
            ],
          ), //stack
        ),
      ),
    );
  }
}
