import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testapp/auth/Screens/splashScreentwo.dart';

import 'mainPage.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTimer() {
    Timer(const Duration(seconds:4 ), () async {
      // send user to home screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => SplashScreentwo()));
    });
  }

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0C4AA6),
        body: Padding(
          padding: EdgeInsets.only(top : 301 ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/nextdata-logo-blanc.png',
                  width: 221.76,
                  height: 112.15,
                  fit: BoxFit.fill,
                ),
              ],
            ),
          ),
        ));
  }
}
