import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:gtk_flutter/homescreen.dart';
//import 'package:gtk_flutter/screens/mainpage.dart';

//import 'home.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return SignInScreen(
            providerConfigs: const [
              EmailProviderConfiguration(),
            ],
          );
        }

        return const HomeScreen();
      },
    );
  }
}
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutterfire_ui/auth.dart';
// import 'package:gtk_flutter/screens/mainpage.dart';
// import 'package:provider/provider.dart';

// import '../src/authentication.dart';
// import '../state/applicationstate.dart';

// class AuthGate extends StatelessWidget {
//   const AuthGate({Key? key}) : super(key: key);

// //   @override
// //   Widget build(BuildContext context) {
// //     return

// //         //StreamBuilder<User?>(
// //         //  stream: FirebaseAuth.instance.authStateChanges(),
// //         Consumer<ApplicationState>(
// //             builder: (context, appState, _) =>
// //                 //  if (!appState.loggedIn) {
// //                 //return const
// //                 SignInScreen(
// //                   providerConfigs: [
// //                     EmailProviderConfiguration(),
// //                     GoogleProviderConfiguration(
// //                         clientId:
// //                             "90817750920-2bmot5is9ic9m61t8a7875v4ekhnj1m4.apps.googleusercontent.com"),
// //                   ],
// //                 )

// //           //      );
// //     return MainPage();
// //     //}
// //   }
// // }
//   @override
//   Widget build(BuildContext context) {
//     return StreamBuilder<User?>(
//       stream: FirebaseAuth.instance.authStateChanges(),
//       builder: (context, snapshot) {
//         if (!snapshot.hasData) {
//           return SignInScreen(
//             providerConfigs: const [
//               EmailProviderConfiguration(),
//               GoogleProviderConfiguration(
//                   clientId:
//                       "90817750920-2bmot5is9ic9m61t8a7875v4ekhnj1m4.apps.googleusercontent.com"),
//             ],
//           );
//         }

//         return const MainPage();
//       },
//     );
//   }
// }
