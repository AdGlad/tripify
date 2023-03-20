//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gtk_flutter/screens/SignInScreen.dart';
import 'package:gtk_flutter/screens/mainpage.dart';
import 'package:provider/provider.dart';

import '../firebase_options.dart';
//import '../src/authentication.dart';
import '../state/applicationstate.dart';

import 'package:firebase_auth/firebase_auth.dart' // new
    hide
        EmailAuthProvider,
        PhoneAuthProvider; // new

class FirstPage extends StatefulWidget {
  const FirstPage({super.key, required this.loggedIn});
  final bool loggedIn;

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
  }

  @override
  Widget build(BuildContext context) {
    //  final int firstEvenNumber = 2;
    // final Widget widgetToRender = firstEvenNumber ==2

    final Widget widgetToRender = widget.loggedIn != true
        ? SignIn()
        // Text(
        //     'Even number found.',
        //     style: TextStyle(
        //       color: Colors.green,
        //     ),
        //   )
        : MainPage();
    return Container(
      child: widgetToRender,
    );
  }
}

//   Widget build(BuildContext context) {
//     Widget child1
//     if (true) {
//       child:
//       Text('Text 1');
//     } else if (1==3) {
//       child:
//       Text("text2");
//     }
//   return new Container(child: child1);
//     // return Container(
//     //     child: Consumer<ApplicationState>(
//     //         builder: (context, appState, _) => AuthFunc(
//     //             loggedIn: appState.loggedIn,
//     //             signOut: () {
//     //               FirebaseAuth.instance.signOut();
//     //             })));
//   }
// }
