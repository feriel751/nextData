

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'Auth/Screens/signUp.dart';
import 'home/Screens/Widgets/bottumBar.dart';
import 'home/Screens/homePage.dart';







class RoutesClass{
static String login='/login';
static String posts='/postspage';
static String signUp='/signUp';

static String getLoginRoute()=> login;
static String getPostsRoute()=> posts;
static String getRegisterRoute() => signUp;

static List<GetPage> routes= [

GetPage(name: signUp,  
page: () =>   const SignUpPage(),
),
  GetPage(name: posts,
    page: () =>   const MainScreen(initialIndex: 1,),
  ),

];


}
