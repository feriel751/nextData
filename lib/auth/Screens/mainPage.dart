import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testapp/auth/Screens/login.dart';
import 'package:testapp/home/Screens/Widgets/bottumBar.dart';
class mainpage extends StatelessWidget{
  const mainpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
     
      body: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          return MainScreen(initialIndex: 1,);
        }else{
          return loginPage();
        }


      },),



    );
  }
}
