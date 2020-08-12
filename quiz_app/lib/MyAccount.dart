import 'package:flutter/material.dart';
import 'appbar.dart';
import 'header.dart';

class MyAccount extends StatelessWidget {
  static var routeName = '/myaccount';

  final accountDetails = [
    "Name",
    "Email",
    "Phone",
    "T-shirst Size",
    "Gender",
    "codeforces Handle",
    "Birthday"
  ];
  final shadows = <Shadow>[
    Shadow(
      offset: Offset(1.0, 2.0),
      blurRadius: 3.0,
      color: Color.fromARGB(255, 0, 0, 0),
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar2(),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Header("Account Details"),
            Column(
              children: <Widget>[
                Text(
                  "Name",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: shadows),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: shadows),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Text(
                  "Phone",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: shadows),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Text(
                  "T-shirst Size",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: shadows),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Text(
                  "Gender",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      shadows: shadows),
                ),
                Container(
                  color: Colors.white,
                  margin: EdgeInsets.all(15),
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                RaisedButton(
                    child: Text(
                      "Save Changes",
                      style: TextStyle(color: Colors.green, fontSize: 20),
                    ),
                    color: Colors.white,
                    onPressed: () {}),
                Text(
                  "Membership",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Premium ",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.normal),
                    ),
                    Text("👑",style: TextStyle(fontSize: 20),),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
