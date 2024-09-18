import 'dart:async';
import 'package:flutter/material.dart';
import 'package:testapp/auth/Screens/login.dart';
import 'package:testapp/auth/Screens/widgets/loader.dart';
import 'mainPage.dart';
class SplashScreentwo extends StatefulWidget{
  SplashScreentwo({super.key});
  @override
  _SplashState createState() => _SplashState();
}
class _SplashState extends State<SplashScreentwo>{
  startTimer(){
    Timer(const Duration(seconds: 4), () async{
      // send user to home screen
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (c) => loginPage()));
    });
  }

  @override
  void initState(){
    super.initState();
    startTimer( );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff0C4AA6),
        body:  SafeArea(
        child: Padding(
        padding: const EdgeInsets.only( top : 273 , left :0 , right :0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/nextdata-logo-blanc.png',
                width: 168,
                height: 84.96,
                fit: BoxFit.fill,
              ),
              const SizedBox(height:20),
              Loader(
              ),
            ],
          ),),)
        );
  }
}
