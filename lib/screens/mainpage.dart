import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/screens/ActiveCountryPage.dart';
import 'package:gtk_flutter/screens/checkcountry.dart';
import 'package:gtk_flutter/screens/UserCountryPage.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';

//import '../src/ad_helper.dart';
import '../state/applicationstate.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  int _selectedIndex = 0;
  List<Widget> pageList = [
    const CheckCountry(),
    const UserCountryPage(),
    const ActiveCountryPage(),
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
                          icon: Icon(Icons.login)),
                    ],
                  ),
                  body: SafeArea(
                    child: Stack(
                      children: <Widget>[
                        Container(
                          // margin: const EdgeInsets.all(5.0),
                          child: pageList.elementAt(_selectedIndex),
                        ),
                        // TODO: Display a banner when ready
                      ],
                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    onTap: (index) => setState(() {
                      _selectedIndex = index;
                    }),
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
