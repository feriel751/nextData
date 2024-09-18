import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testapp/routes.dart';

import 'auth/Screens/splashScreen.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  assert(() {
    debugPrint = (String? message, {int? wrapWidth}) => {};
    return true;
  }());
  runApp( MyApp(




    child :  GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'test app',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor:Color(0xff0C4AA6)),
          useMaterial3: true,
        ),
      getPages: RoutesClass.routes,
        home:  SplashScreen(),
      )
  ));
}



class MyApp extends StatefulWidget {
  final Widget? child;
  MyApp({this.child});


  static void restartApp(BuildContext context) {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Key key = UniqueKey();
  void restartApp() {
    setState(() {
      key = UniqueKey();
    });
  }

  @override
  Widget build(BuildContext context) => Theme(
    data:  ThemeData(
  colorScheme: ColorScheme.fromSeed(seedColor:Color(0xff0C4AA6)),
  useMaterial3: true,
  ),
    child: Builder(
        builder: (context) => KeyedSubtree(
          child: widget.child!,
          key: key,
        )),
  );
}
