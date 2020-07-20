import 'package:flutter/material.dart';
import 'appbar.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: HelperMethod.getAppar(context, false),
        backgroundColor: Colors.teal,
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: <Widget>[
                Container(
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
                    "Contact Us",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.all(15),
                  //height: 250,
                  child: Card(
                    color: Colors.white,
                    child: Column(
                      children: <Widget>[
                        Text("""Call us or use WhatsApp at\
+01033998844
Email us at support@gammal.tech
Chat with us using the chat icon
(for signed in users)
Text("send us a message using the form.""",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20)),
                        MyCustomForm()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Define a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a `GlobalKey<FormState>`,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          // Add TextFormFields and RaisedButton here.
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              hintText: "Message us !",
              border: OutlineInputBorder(),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Name",
              border: OutlineInputBorder(),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "Phone",
              border: OutlineInputBorder(),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
          TextFormField(
            maxLines: 1,
            decoration: InputDecoration(
              hintText: "email address",
              border: OutlineInputBorder(),
            ),
            // The validator receives the text that the user has entered.
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
          ),
        ]));
  }
}
