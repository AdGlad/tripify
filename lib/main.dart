// Copyright 2022 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:firebase_core/firebase_core.dart';
//import 'package:firebase_ui_auth/firebase_ui_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gtk_flutter/firebase_options.dart';
import 'package:gtk_flutter/screens/SignInScreen.dart';
import 'package:gtk_flutter/screens/firstpage.dart';
//import 'package:gtk_flutter/screens/AuthGate.dart';
import 'package:gtk_flutter/screens/mainpage.dart';
import 'package:provider/provider.dart';
import 'state/applicationstate.dart';
import 'screens/splashscreen.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
//import 'package:gtk_flutter/auth_gate.dart';

import 'package:flutterfire_ui/auth.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

//import '../firebase_options.dart';

//import 'package:flutterfire_ui/auth.dart';

//import 'app_state.dart';
//import 'home_page.dart';

// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth =
//       await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ApplicationState(),
    builder: ((context, child) => const App()),
  ));
}

// List<AuthProvider> providers = [EmailAuthProvider(),OAuthProvider()];
//const providers = [const EmailAuthProvider()];

//FirebaseUIAuth.configureProviders([
//    GoogleProvider(clientId: GOOGLE_CLIENT_ID),
//  ]);

final _router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      //  builder: (context, state) => const AuthGate(),
    ),
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
      routes: [
        GoRoute(
          path: 'home',
          builder: (context, state) =>
              const MainPage(), // AuthGate() // MainPage(),
        ),
        GoRoute(
            path: 'first',
            builder: (context, state) {
              return Consumer<ApplicationState>(
                  builder: (context, appState, _) =>
                      FirstPage(loggedIn: appState.loggedIn));
            }

            //  const FirstPage(), // AuthGate() // MainPage(),
            ),
        // GoRoute(
        //   path: 'authgate',
        //   builder: (context, state) => const AuthGate(),
        // ),
        GoRoute(
          path: 'sign-in',
          builder: (context, state) {
            return SignIn();

            // SignInScreen(
            //   resizeToAvoidBottomInset: true,
            //   providerConfigs: [
            //     EmailProviderConfiguration(),
            //     GoogleProviderConfiguration(
            //         clientId:
            //             "90817750920-9307of40hl4eg62dabtvcd403s6pg5a8.apps.googleusercontent.com"),
            //     //     "90817750920-qeda6kshcc4msuc0tbgnvd0lu9mh1enb.apps.googleusercontent.com"),
            //     // "90817750920-2bmot5is9ic9m61t8a7875v4ekhnj1m4.apps.googleusercontent.com"),
            //   ],
            //   actions: [
            //     ForgotPasswordAction(((context, email) {
            //       final uri = Uri(
            //         path: '/sign-in/forgot-password',
            //         queryParameters: <String, String?>{
            //           'email': email,
            //         },
            //       );
            //       context.push(uri.toString());
            //     })),
            //     AuthStateChangeAction(((context, state) {
            //       if (state is SignedIn || state is UserCreated) {
            //         var user = (state is SignedIn)
            //             ? state.user
            //             : (state as UserCreated).credential.user;
            //         if (user == null) {
            //           return;
            //         }
            //         if (state is UserCreated) {
            //           user.updateDisplayName(user.email!.split('@')[0]);
            //         }
            //         if (!user.emailVerified) {
            //           user.sendEmailVerification();
            //           const snackBar = SnackBar(
            //               content: Text(
            //                   'Please check your email to verify your email address'));
            //           ScaffoldMessenger.of(context).showSnackBar(snackBar);
            //         }
            //         context.pushReplacement('/');
            //       }
            //     })),
            //   ],
            //   // headerBuilder: (context, constraints, shrinkOffset) {
            //   //   return Padding(
            //   //     padding: const EdgeInsets.all(20),
            //   //     child: AspectRatio(aspectRatio: 1, child: Text("Hello")
            //   //         // Image.asset('flutterfire_300x.png'),
            //   //         ),
            //   //   );
            //   // },
            //   subtitleBuilder: (context, action) {
            //     return Padding(
            //       padding: const EdgeInsets.symmetric(vertical: 4.0),
            //       child: action == AuthAction.signIn
            //           ? const Text(
            //               style: TextStyle(fontSize: 5),
            //               'Welcome to Tripify, please sign in!')
            //           : const Text(style: TextStyle(fontSize: 5), 'Welcome to Tripify, please sign up!'),
            //     );
            //   },
            //   // footerBuilder: (context, action) {
            //   //   return const Padding(
            //   //     padding: EdgeInsets.only(top: 4),
            //   //     child: Text(
            //   //       'By signing in, you agree to our terms and conditions.',
            //   //       style: TextStyle(color: Colors.grey),
            //   //     ),
            //   //   );
            //   // },
            //   // sideBuilder: (context, shrinkOffset) {
            //   //   return Padding(
            //   //     padding: const EdgeInsets.all(20),
            //   //     child: AspectRatio(aspectRatio: 1, child: Text("Bye")
            //   //         //Image.asset('flutterfire_300x.png'),
            //   //         ),
            //   //   );
            //   // },
            // );
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
                key: ValueKey(appState.emailVerified),
                //providers: const [],
                actions: [
                  // SignedOutAction(
                  //   ((context) {
                  //     context.go('/sign-in');
                  //     // Navigator.of(context).pushReplacementNamed('/sign-in');
                  //     //  context.pushReplacement('/');
                  //   }),
                  // ),
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
        // GoRoute(
        //   path: 'logout-profile',
        //   builder: (context, state) {
        //     return ProfileScreen(
        //       // providers: const [],
        //       actions: [
        //         SignedOutAction((context) {
        //           context.pushReplacement('/');
        //         }),
        //       ],
        //     );
        //   },
        // ),
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
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            padding: MaterialStateProperty.all<EdgeInsets>(
              const EdgeInsets.all(1),
            ),
            backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
          ),
        ),
        buttonTheme: Theme.of(context).buttonTheme.copyWith(
              highlightColor: Colors.deepPurple,
            ),
        primarySwatch: Colors.deepPurple,
        textTheme: GoogleFonts.robotoTextTheme(
          Theme.of(context).textTheme,
        ),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
