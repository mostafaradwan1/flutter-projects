import 'package:flutter/material.dart';
import 'settings.dart';
import 'contact.dart';
import 'FAQ.dart';
import 'MasterClass.dart';
import 'MyAccount.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                MaterialPageRoute(builder: (context) => MasterClass()),
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
                MaterialPageRoute(builder: (context) => MyAccount()),
              );
              // ...
            },
          ),
        ],
      ),
    );
  }
}
