import 'package:flutter/material.dart';
import 'header.dart';

class TermsAndConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          children: <Widget>[
            Header("Terms and conditions"),
            Card(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  child: Text(
                    "Terms And Conditions",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                    "Welcome to Gammal Tech!\nThese terms and conditions outline the rules and regulations for the use of Gammal Tech's Website, located at\n ")
              ],
            )),
          ],
        ));
  }
}
