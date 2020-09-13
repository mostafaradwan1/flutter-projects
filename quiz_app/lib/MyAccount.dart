import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/loading.dart';
import 'appbar.dart';
import 'header.dart';

String userPhoneNumber = FirebaseAuth.instance.currentUser.phoneNumber;
FirebaseAuth auth = FirebaseAuth.instance;
final userId = auth.currentUser.uid;
FirebaseFirestore firestore = FirebaseFirestore.instance;

class MyAccount extends StatefulWidget {
  static var routeName = '/myaccount';

  @override
  _MyAccountState createState() => _MyAccountState();
}

class _MyAccountState extends State<MyAccount> {
  static var name;
  static var email;
  static var gender;
  static var tshirtSize;
  @override
  void initState() {
    firestore.collection('users').doc(userId).get().then((value) {
      print(userId);
      name = value.data()['name'];
      email = value.data()['email'];
      gender = value.data()['gender'];
      tshirtSize = value.data()['tshirtSize'];
    });
    super.initState();
  }

  final TextEditingController _emailController =
      TextEditingController(text: email);

  final TextEditingController _nameController =
      TextEditingController(text: name);

  final TextEditingController _genderController =
      TextEditingController(text: gender);

  final TextEditingController _tshirtSizeController =
      TextEditingController(text: tshirtSize);

  final shadows = <Shadow>[
    Shadow(
      offset: Offset(1.0, 2.0),
      blurRadius: 3.0,
      color: Color.fromARGB(255, 0, 0, 0),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<DocumentSnapshot>(
      future: firestore.collection('users').doc(userId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
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
                          controller: _nameController,
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
                          controller: _emailController,
                         
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
                          initialValue: userPhoneNumber,
                          readOnly: true,
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
                          controller: _tshirtSizeController,
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
                          controller: _genderController,
                        ),
                      ),
                      RaisedButton(
                          child: Text(
                            "Save Changes",
                            style: TextStyle(color: Colors.green, fontSize: 20),
                          ),
                          color: Colors.white,
                          onPressed: () {
                            firestore
                                .collection('users')
                                .doc(userId)
                                .update({
                                  'name': _nameController.text,
                                  'gender': _genderController.text,
                                  'email': _emailController.text,
                                  'tshirtSize': _tshirtSizeController.text,
                                })
                                .then((value) => print("User Updated"))
                                .catchError((error) =>
                                    print("Failed to update user: $error"));

                            Navigator.pop(context);
                          }),
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
                          Text(
                            "👑",
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        }

        return Loading();
      },
    );
  }
}
