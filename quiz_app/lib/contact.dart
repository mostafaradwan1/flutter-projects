import 'package:flutter/material.dart';
import 'appbar.dart';
import 'header.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar2(),
      backgroundColor: Colors.teal,
      body: Builder(
        builder: (context) => SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Header('Contact Us'),
              Container(
                width: double.infinity,
                margin: EdgeInsets.all(15),
                //height: 250,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Text(
                        """Call us or use WhatsApp at
+01033998844
Email us at support@gammal.tech
Chat with us using the chat icon
for signed in users
send us a message using the form.""",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 2.2,
                        ),
                      ),
                      MyCustomForm(),
                      RaisedButton(
                        child: Text('Send'),
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: Text('your message was sent!'),
                            action: SnackBarAction(
                              label: 'Undo',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );

                          // Find the Scaffold in the widget tree and use
                          // it to show a SnackBar.
                          Scaffold.of(context).showSnackBar(snackBar);
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
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
          Text("data",style: TextStyle(fontSize: 22),),
          TextFormField(
            minLines: 1,
            maxLines: 3,
            decoration: InputDecoration(
              labelText: "Message",
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
              labelText: "Name",
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
              labelText: "Phone",
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
              labelText: "Email",
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
