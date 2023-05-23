// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtk_flutter/firebase_options.dart';
import 'package:gtk_flutter/screens/SignInScreen.dart';
import 'package:gtk_flutter/screens/findfriendpage.dart';
import 'package:gtk_flutter/screens/firstpage.dart';
import 'package:gtk_flutter/screens/mainpage.dart';
import 'package:gtk_flutter/screens/UserInfo/UserInfoPage.dart';
import 'package:provider/provider.dart';
import 'state/applicationstate.dart';
import 'screens/splashscreen.dart';
import 'package:go_router/go_router.dart';

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:firebase_ui_oauth_facebook/firebase_ui_oauth_facebook.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    // emailLinkProviderConfig,
    PhoneAuthProvider(),
    GoogleProvider(
        clientId:
            "90817750920-9307of40hl4eg62dabtvcd403s6pg5a8.apps.googleusercontent.com"),
    //  AppleProvider(),
    FacebookProvider(clientId: "1dae917812269b6ffe95a586db98aca8"),
    //TwitterProvider(
    // apiKey: TWITTER_API_KEY,
    // apiSecretKey: TWITTER_API_SECRET_KEY,
    // redirectUri: TWITTER_REDIRECT_URI,
    //),
  ]);

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const App()),
  ));
}

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'home',
          builder: (context, state) => const MainPage(),
        ),
        GoRoute(
          path: 'userprofile',
          builder: (context, state) => const UserInfoPage(),
        ),
        GoRoute(
            path: 'first',
            builder: (context, state) {
              return Consumer<ApplicationState>(
                  builder: (context, appState, _) =>
                      FirstPage(loggedIn: appState.loggedIn));
            }),
        GoRoute(
          path: 'findfriends',
          builder: (context, state) => const FindFriendsPage(),
        ),
        GoRoute(
          path: ' ',
          builder: (context, state) {
            return SignIn();
          },
          routes: [
            GoRoute(
              path: 'forgot-password',
              builder: (context, state) {
                final arguments = state.queryParams;
                return ForgotPasswordScreen(
                  email: arguments['email'],
                  headerMaxExtent: 200,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: 'profile',
          builder: (context, state) {
            return Consumer<ApplicationState>(
              builder: (context, appState, _) => ProfileScreen(
                appBar: AppBar(
                  title: const Text('User Profile'),
                ),
                // key: xalueKey(appState.emailVerified),
                //providers: const [],
                actions: [
                  SignedOutAction((context) {
                    Navigator.pushReplacementNamed(context, '/sign-in');
                    //  Navigator.of(context).pop();
                  })
                ],
                children: [
                  Visibility(
                      visible: !appState.emailVerified,
                      child: OutlinedButton(
                        child: const Text('Recheck Verification State'),
                        onPressed: () {
                          appState.refreshLoggedInUser();
                        },
                      ))
                ],
              ),
            );
          },
        ),
      ],
    ),
  ],
);

class App extends StatelessWidget {
  const App({super.key});

  Future<InitializationStatus> _initGoogleMobileAds() {
    //  Initialize Google Mobile Ads SDK
    return MobileAds.instance.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tripify',
      theme: ThemeData(
          colorScheme: Theme.of(context).colorScheme.copyWith(
                primary: Color.fromARGB(255, 49, 52, 59),
                // secondary will be the textColor, when the textTheme is set to accent
                secondary: Colors.white,
              ),
          //),

          // buttonTheme: ButtonThemeData(
          //   textTheme: ButtonTextTheme.accent,
          //   colorScheme: Theme.of(context).colorScheme.copyWith(
          //         primary: Colors.orange,
          //         // secondary will be the textColor, when the textTheme is set to accent
          //         secondary: Colors.white,
          //       ),
          // ),

          // buttonTheme: ButtonThemeData(
          //   buttonColor: Colors.orange,
          //   textTheme: ButtonTextTheme.accent,
          // ),

          //   inputDecorationTheme: InputDecorationTheme(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //   ),
          //   outlinedButtonTheme: OutlinedButtonThemeData(
          //     style: ButtonStyle(
          //       padding: MaterialStateProperty.all<EdgeInsets>(
          //         const EdgeInsets.all(1),
          //       ),
          //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          //     ),
          //   ),
          //   buttonTheme: Theme.of(context).buttonTheme.copyWith(
          //         highlightColor: Colors.deepPurple,
          //       ),
//        primarySwatch: Colors.deepPurple,
          //      textTheme:
          // const TextTheme(
          // displayLarge: TextStyle(color: Colors.amber),
          // displayMedium: TextStyle(color: Colors.amber),
          // displaySmall: TextStyle(color: Colors.amber),
          // headlineLarge: TextStyle(color: Colors.amber),
          // headlineMedium: TextStyle(color: Colors.amber),
          // headlineSmall: TextStyle(color: Colors.amber),
          // titleLarge: TextStyle(color: Colors.amber),
          // titleMedium: TextStyle(color: Colors.amber),
          // titleSmall: TextStyle(color: Colors.amber),
          // bodyLarge: TextStyle(color: Colors.amber),
          // bodyMedium: TextStyle(color: Colors.amber),
          // bodySmall: TextStyle(color: Colors.amber),
          // labelLarge: TextStyle(color: Colors.amber),
          // labelMedium: TextStyle(color: Colors.amber),

          //   button: TextStyle(color: Colors.amber),
          //        labelSmall: TextStyle(color: Colors.amber),
          //headline1: TextStyle(color: Colors.amber),
// headline2: TextStyle(color: Colors.amber),
// headline3: TextStyle(color: Colors.amber),
// headline4: TextStyle(color: Colors.amber),
// headline5: TextStyle(color: Colors.amber),
// headline6: TextStyle(color: Colors.amber),
// subtitle1: TextStyle(color: Colors.amber),
// subtitle2: TextStyle(color: Colors.amber),
// bodyText1: TextStyle(color: Colors.amber),
// bodyText2: TextStyle(color: Colors.amber),
// caption: TextStyle(color: Colors.amber),
          //button: TextStyle(color: Colors.amber),
// overline: TextStyle(color: Colors.amber),
          // ),
          textTheme: GoogleFonts.robotoTextTheme()
          //TextTheme()
          //  GoogleFonts.lato(fontSize: 5).
          //    GoogleFonts.robotoTextTheme().copyWith(
          // displayLarge: TextStyle(fontSize: 10),
          // displayMedium: TextStyle(fontSize: 10),
          // displaySmall: TextStyle(fontSize: 10),
          // headlineLarge: TextStyle(fontSize: 10),
          // headlineMedium: TextStyle(fontSize: 10),
          // headlineSmall: TextStyle(fontSize: 10),
          // titleLarge: TextStyle(fontSize: 10),
          // titleMedium: TextStyle(fontSize: 10),
          // titleSmall: TextStyle(fontSize: 10),
          // bodyLarge: TextStyle(fontSize: 10),
          // bodyMedium: TextStyle(fontSize: 10),
          // bodySmall: TextStyle(fontSize: 10),
          // labelLarge: TextStyle(fontSize: 10),
          // labelMedium: TextStyle(fontSize: 10),
          // labelSmall: TextStyle(fontSize: 10),
          // headline1: TextStyle(fontSize: 10),
          // headline2: TextStyle(fontSize: 10),
          // headline3: TextStyle(fontSize: 10),
          // headline4: TextStyle(fontSize: 10),
          // headline5: TextStyle(fontSize: 10),
          // headline6: TextStyle(fontSize: 10),
          // subtitle1: TextStyle(fontSize: 10),
          // subtitle2: TextStyle(fontSize: 10),
          // bodyText1: TextStyle(fontSize: 10),
          // bodyText2: TextStyle(fontSize: 10),
          // caption: TextStyle(fontSize: 10),
          //    button: TextStyle(fontSize: 10),
          //  overline: TextStyle(fontSize: 10),
          //        )
          //  caption: TextStyle(fontSize: 10),
          //  button: TextStyle(fontSize: 5)),

//              robotoTextTheme(
//                  TextTheme(displayLarge: TextStyle(color: Colors.amber)))

//            robotoTextTheme(
          //         Theme.of(context).textTheme,
          // ),

          //   visualDensity: VisualDensity.adaptivePlatformDensity,
          //   useMaterial3: true,

          //   inputDecorationTheme: InputDecorationTheme(
          //     border: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(8),
          //     ),
          //   ),
          //   outlinedButtonTheme: OutlinedButtonThemeData(
          //     style: ButtonStyle(
          //       padding: MaterialStateProperty.all<EdgeInsets>(
          //         const EdgeInsets.all(24),
          //       ),
          //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
          //       foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          //     ),
          //   ),

          //   // buttonTheme: Theme.of(context).buttonTheme.copyWith(
          //   //       highlightColor: Colors.deepPurple,
          //   //     ),
          ),
      routerConfig: _router,
    );
  }
}
