import 'package:flutter/material.dart';
import 'splashScreen.dart';
import 'homePage.dart';
import 'appbar.dart';
import 'settings.dart';
import 'contact.dart';
import 'FAQ.dart';

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
    return Scaffold(
      appBar: AppBar2(),
      //AppBarr(),
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text(
                    'Gammal.tech',
                    style: TextStyle(fontSize: 30, color: Colors.white),
                  ),
                  Image.asset(
                    'images/logo.png',
                    color: Colors.white,
                    height: 100,
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text(
                'Settings',
                style: TextStyle(fontSize: 22),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Settings()),
                );
              },
            ),
            ListTile(
              title: Text('Contact', style: TextStyle(fontSize: 22)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );
                // ...
              },
            ),
            ListTile(
              title: Text('MasterClass', style: TextStyle(fontSize: 22)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );
                // ...
              },
            ),
            ListTile(
              title: Text('FAQ', style: TextStyle(fontSize: 22)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => FAQ(),
                  ),
                );
                // ...
              },
            ),
            ListTile(
              title: Text('My Account', style: TextStyle(fontSize: 22)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Contact()),
                );
                // ...
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal,
      body: HomePage(),
    );
  }
}
