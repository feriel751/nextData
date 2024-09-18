import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/home/Screens/Model/users.dart';
import 'Controllers/homeController.dart';

class AccountPage extends StatefulWidget{
  const AccountPage({super.key});
  @override
  _AccountPageState createState() => _AccountPageState();
}
class _AccountPageState extends State<AccountPage> {

  @override
  void initState() {


    super.initState();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body:Text('Account') ,

    );}}