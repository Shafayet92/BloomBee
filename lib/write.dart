import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.amber,
        appBar: AppBar(
          title: TextField(controller: controller),
          actions: [
            IconButton(
              icon: const Icon(Icons.add),
              //  color: selection =Colors.green[400]!,
              onPressed: () {
                // final name = controller.text;
                // createUser(name: name);
              },
            )
          ],
        ),
      );
  // Future createUser({required String name}) async {
  //   final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

  //   final json = {
  //     'name': name,
  //     'age': 21,
  //     'birthday': DateTime(2001, 7, 28),
  //   };
  //   await docUser.set(json);
  // }
}
