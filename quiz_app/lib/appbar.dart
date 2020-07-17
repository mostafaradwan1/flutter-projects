import 'package:flutter/material.dart';

AppBar defualtAppBar = AppBar(
  leading: IconButton(
    padding: EdgeInsets.all(5.0),
    icon: Image.asset('images/logo.png'),
    onPressed: null,
  ),
  title: Text(
    'Gammal Tech',
    style: TextStyle(
      fontFamily: 'Montserrat-Regular',
      color: Colors.teal,
    ),
  ),
  actions: [
    InkWell(
        onTap: () {
          print('Click Profile Pic');
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: Image.asset(
            'images/profilePic.png',
          ),
        ))
  ],
  backgroundColor: Colors.white,
);
