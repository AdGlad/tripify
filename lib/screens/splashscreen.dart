import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gtk_flutter/screens/homePage.dart';
import 'package:gtk_flutter/screens/mainpage.dart';
import 'package:lottie/lottie.dart';
import 'package:gtk_flutter/screens/maphomescreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: (10)),
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset(
        'assets/lottie_passport.json',
        controller: _controller,
        height: MediaQuery.of(context).size.height * 1,
        animate: true,
        onLoaded: (composition) {
          _controller
            ..duration = composition.duration
            ..forward().whenComplete(() => context.go("/first"));
          //   ..forward().whenComplete(() => context.go("/home"));
          //     ..forward().whenComplete(() => context.go("/authgate"));

          //Navigator.pushReplacement(
          // context,
          // MaterialPageRoute(builder: (context) => HomePage()),
          // MaterialPageRoute(builder: (context) => HomeMap()),
          // MaterialPageRoute(builder: (context) => MainPage()),
          // ));
        },
      ),
    );
  }
}
