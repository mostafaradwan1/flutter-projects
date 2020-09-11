import 'package:flutter/material.dart';
import 'package:quiz_app/homePage.dart';
import 'package:quiz_app/otpScreen.dart';
import 'header.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
  static var login = 'login';
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNumberController = TextEditingController();
  String _message='';
  int _resendingToken;
  String _verificationId;
  verifyPhoneNumber() async {
    await auth.verifyPhoneNumber(
      phoneNumber: _phoneNumberController.text,
      verificationCompleted: (PhoneAuthCredential credential) {
        // auth.signInWithCredential(credential);
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OTPScreen(
                verificationId: credential.smsCode,
                mobileNumber: _phoneNumberController.text,
              ),
            ));
        print("verifyPhoneNumber from login" + credential.smsCode);
      },
      verificationFailed: (FirebaseAuthException e) {
        if (e.code == 'invalid-phone-number') {
          print('The provided phone number is not valid.');
          print(e.phoneNumber);
        }
      },
      codeSent: (String verificationId, int resendToken) {
        setState(() {
          _verificationId = verificationId;
          _resendingToken = resendToken;
        });
        print("codesent ${_verificationId}");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => OTPScreen(
                      mobileNumber: _phoneNumberController.text,
                      verificationId: verificationId,
                    )));
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        this._verificationId = verificationId;
      },
    );
  }

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
                    controller: _phoneNumberController,
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
                    onPressed: () async {
                      verifyPhoneNumber();
                    },
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
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _message,
                      style: TextStyle(color: Colors.red),
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
