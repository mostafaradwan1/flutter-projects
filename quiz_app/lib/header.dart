import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final text;
  Header(this.text);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      width: double.infinity,
      decoration: new BoxDecoration(
        color: Colors.black,
        borderRadius: new BorderRadius.circular(5),
        boxShadow: [
          new BoxShadow(
            color: Colors.grey,
            offset: new Offset(3, 3),
            blurRadius: 5.0,
            //spreadRadius: 3
          ),
        ],
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
