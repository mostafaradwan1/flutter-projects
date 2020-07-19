import 'package:splashscreen/splashscreen.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class MySplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
        seconds: 4,
        navigateAfterSeconds: MyApp(),
        title: new Text('Welcome To Gammal Tech'),
        image: new Image.asset('images/logo.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        loaderColor: Colors.teal);
  }
}
