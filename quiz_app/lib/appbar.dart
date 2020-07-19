import 'package:flutter/material.dart';

class HelperMethod {
  static AppBar getAppar(BuildContext context, bool isHomePage) {
    return AppBar(
      leading: IconButton(
        padding: EdgeInsets.all(5.0),
        icon: Image.asset('images/logo.png'),
        onPressed: () {},
      ),
      title: Text(
        'Gammal Tech',
        style: TextStyle(
          fontFamily: 'Montserrat-Regular',
          color: Colors.teal,
        ),
      ),
      actions: [
        !isHomePage
            ? GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.teal,
                ))
            : Icon(
                Icons.home,
                color: Colors.teal,
              )
      ],
      backgroundColor: Colors.white,
    );
  }
}
