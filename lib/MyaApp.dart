import 'package:flutter/material.dart';
import 'package:gtk_flutter/auth_gate.dart';
import 'package:gtk_flutter/screens/mainpage.dart';
//import 'auth_gate.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(), //AuthGate(),
    );
  }
}
