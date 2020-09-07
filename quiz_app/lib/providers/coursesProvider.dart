import 'package:flutter/material.dart';
import 'package:quiz_app/error.dart';
// Import the firebase_core and cloud_firestore plugin
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: GetCourseName('C')));
}

class GetCourseName extends StatelessWidget {
  final String documentId;

  GetCourseName(this.documentId);

  @override
  Widget build(BuildContext context) {
    var coursesIds = [];
    CollectionReference courses =
        FirebaseFirestore.instance.collection('C12345');
    FirebaseFirestore.instance
        .collection('C12345')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                coursesIds.add(doc.id);
              })
            });
    return FutureBuilder<DocumentSnapshot>(
      future: courses.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Error();
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text(
              "course Name: ${data['name']} number ${data['eposides']}");
        }

        return Text("loading");
      },
    );
  }
}

class CourseInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('C12345');

    return StreamBuilder<QuerySnapshot>(
      stream: users.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Text("Loading");
        }

        return new ListView(
          children: snapshot.data.documents.map((DocumentSnapshot document) {
            return new ListTile(
              title: new Text(document.data()['full_name']),
              subtitle: new Text(document.data()['company']),
            );
          }).toList(),
        );
      },
    );
  }
}
