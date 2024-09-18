import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/home/Screens/Model/users.dart';

import 'Controllers/homeController.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {

  @override
  void initState() {


    super.initState();
  }


  @override
  Widget build(BuildContext context) {


      return Scaffold(

        body:Text('home') ,

      );}}