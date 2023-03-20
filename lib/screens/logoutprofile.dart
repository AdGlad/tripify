import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../src/authentication.dart';
import '../state/applicationstate.dart';

class LogoutProfile extends StatefulWidget {
  const LogoutProfile({super.key});

  @override
  State<LogoutProfile> createState() => _LogoutProfileState();
}

class _LogoutProfileState extends State<LogoutProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Logout'),
      ),
      body: Container(
        child: Consumer<ApplicationState>(
          builder: (context, appState, _) => AuthFunc(
              loggedIn: appState.loggedIn,
              signOut: () {
                FirebaseAuth.instance.signOut();
              }),
        ),
      ),
    );
    ;
  }
}
