import 'package:flutter/material.dart';
import 'header.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'homePage.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: ListView(
        children: <Widget>[
          Header("Sign In"),
          Text(
            "Enter Your Mobile Number to \nSign In or to sign up ",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w400,
                shadows: [
                  Shadow(
                    offset: Offset(3.0, 3.0),
                    blurRadius: 3.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  ),
                ]),
            textAlign: TextAlign.center,
          ),
          Card(
            margin: EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "Enter Your phone number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      Expanded(
                        child: CountryCodePicker(
                          onChanged: print,
                          // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                          initialSelection: 'Eg',
                          favorite: ['+20', 'Eg'],
                          // optional. Shows only country name and flag
                          showCountryOnly: false,
                          // optional. Shows only country name and flag when popup is closed.
                          showOnlyCountryWhenClosed: false,
                          // optional. aligns the flag and the Text left
                          alignLeft: true,
                        ),
                      ),
                    ],
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Phone Number',
                      icon: Icon(Icons.phone),
                    ),
                  ),
                  RaisedButton(
                    child: Text(
                      'verify',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {},
                    color: Colors.teal,
                    padding: EdgeInsets.all(10),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Text(
                      "By tapping verify,you are indicating that you accept our\n terms of service and Privacy Policy. An SMS may \n be sent . message and date rates may apply ",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
