import 'package:flutter/material.dart';
import 'package:gtk_flutter/screens/SignInScreen.dart';
import 'package:gtk_flutter/screens/mainpage.dart';

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
    final Widget widgetToRender =
        widget.loggedIn != true ? SignIn() : MainPage();
    return Container(
      child: widgetToRender,
    );
  }
}
