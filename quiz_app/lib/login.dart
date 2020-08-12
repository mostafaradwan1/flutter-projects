import 'package:flutter/material.dart';
import 'header.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {
  
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();

  String _message = '';
  String _verificationId;
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
                    onPressed: () async {
                      _verifyPhoneNumber();
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

  void _verifyPhoneNumber() async {
    setState(() {
      _message = '';
    });
    final PhoneVerificationCompleted verificationCompleted =
        (AuthCredential phoneAuthCredential) {
      _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        _message = 'Received phone auth credential: $phoneAuthCredential';
      });
    };

    final PhoneVerificationFailed verificationFailed =
        (AuthException authException) {
      setState(() {
        _message =
            'Phone number verification failed. Code: ${authException.code}. Message: ${authException.message}';
      });
    };

    final PhoneCodeSent codeSent =
        (String verificationId, [int forceResendingToken]) async {
      // widget._scaffold.showSnackBar(const SnackBar(
      //   content: Text('Please check your phone for the verification code.'),
      // ));
      _verificationId = verificationId;
    };

    final PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout =
        (String verificationId) {
      _verificationId = verificationId;
    };

    await _auth.verifyPhoneNumber(
        phoneNumber: _phoneNumberController.text,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  // Example code of how to sign in with phone.
  void _signInWithPhoneNumber() async {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
      verificationId: _verificationId,
      smsCode: _smsController.text,
    );
    final FirebaseUser user =
        (await _auth.signInWithCredential(credential)).user;
    final FirebaseUser currentUser = await _auth.currentUser();
    assert(user.uid == currentUser.uid);
    setState(() {
      if (user != null) {
        _message = 'Successfully signed in, uid: ' + user.uid;
      } else {
        _message = 'Sign in failed';
      }
    });
  }
}
