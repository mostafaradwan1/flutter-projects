import 'package:flutter/material.dart';
import 'appbar.dart';
import 'splashScreen.dart';
import 'homePage.dart';

const dev = false;

void main() {
  runApp(new MaterialApp(
    home: dev ? MyApp() : MySplashScreen(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  @override //(to make clear you are not accedently override ) not required decorator provided by flutter to make code cleaner
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HelperMethod.getAppar(context, true),
        backgroundColor: Colors.teal,
        body: HomePage(),
      ),
    );
  }
}
