import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import './widgets/Login_Page/Login_background.dart';
import './widgets/Signup_Page/Signup_background.dart';

void main() {
  runApp(HomeScreen());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      title: "WinterHacks Login Page",
      //add routes here
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/signup': (context) => SignupPage(),
      },
    );
  }
}
