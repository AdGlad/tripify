import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/screens/checkIn/checkcountry.dart';
import 'package:gtk_flutter/screens/country/UserCountryPage.dart';
//import 'package:firebase_auth/firebase_auth.dart';

import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:gtk_flutter/screens/league/league.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:provider/provider.dart';

//import '../src/ad_helper.dart';
import '../src/temp.dart';
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
    // const ActiveCountryPage(),
    IsoCountryList(),
   // const League(),
    const UserInfoPage(),
   // const UserDetails(),
  ];

  BannerAd? _bannerAd;

  @override
  Widget build(BuildContext context) {

    return Container(
        child: Consumer<ApplicationState>(
            builder: (context, appState, _) => Center(
                    child: Scaffold(
                  resizeToAvoidBottomInset: false,
                  appBar: AppBar(
                    //    automaticallyImplyLeading: false,
                  // title: const Text('Tripify [V2]'),
                    title:  Text('Tripify 3${appState.packageInfo?.version} [${appState.packageInfo?.buildNumber}]'),
                    actions: [
                      IconButton(
                          onPressed: () {
                            FirebaseAuth.instance.signOut();
                            context.go("/sign-in");
                          },
                          icon: Icon(Icons.login)),
                      // IconButton(
                      //     onPressed: () {
                      //       //    context.go("/profile");
                      //       //    Navigator.pushNamed(context, "/userprofile");
                      //       //context.go("/userprofile");
                      //       context.push("/userprofile");
                      //     },
                      //     icon: Icon(Icons.person)),
                    ],
                  ),
                  body: SafeArea(
                    child: Stack(
                      children: <Widget>[
Consumer<ApplicationState>(
  builder: (context, appState, _) =>

                        Container(
                          // margin: const EdgeInsets.all(5.0),x`
                          child: pageList.elementAt(_selectedIndex),
                        ),
                        // TODO: Display a banner when ready
)
                    
                      ],

                    ),
                  ),
                  bottomNavigationBar: BottomNavigationBar(
                    type: BottomNavigationBarType.fixed,
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

                      // BottomNavigationBarItem(
                      //   icon: Icon(Icons.map_outlined),
                      //   label: 'Maps',
                      // ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.table_chart_sharp),
                        label: 'league',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.group), //flag_circle_outlined),
                        label: 'Friends',
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
