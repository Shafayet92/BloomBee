import 'package:flutter/material.dart';

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'home.dart';
import 'login.dart';

// class EditProfilePage extends StatelessWidget {
//   const EditProfilePage({Key? key}) : super(key: key);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(EditProfilePage());
}

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  // final controller = TextEditingController();
  final controllerPName = TextEditingController();
  final controllerPAge = TextEditingController();
  final controllerChildName = TextEditingController();
  final controllerChildAge = TextEditingController();
  final controllerChildGender = TextEditingController();

  // InputDecoration decoration(String label) =>
  //     InputDecoration(labelText: label, border: const OutlineInputBorder();
  // Future GetUser() async {
  //    final userdata = FirebaseAuth.instance.currentUser?.uid;
  //   final docUser = FirebaseFirestore.instance.collection('users').parent. .doc(userdata).;

  //   user.id = userdata.toString();
  //   final json = user.toJson();
  //   docUser.doc(userdata).get(json);
  // }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        body: SingleChildScrollView(
            child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    width: w,
                    height: h * 0.13,
                    child: Stack(
                      fit: StackFit.expand,
                      children: <Widget>[
                        Container(
                          height: 200.0,
                          decoration: new BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.bottomLeft,
                              stops: [
                                0.1,
                                0.4,
                                0.6,
                                0.9,
                              ],
                              colors: [
                                Color.fromARGB(175, 7, 81, 0),
                                Color.fromARGB(255, 65, 14, 120),
                                Colors.indigo,
                                Color.fromARGB(255, 5, 78, 71),
                              ],
                            ),
                            borderRadius: BorderRadius.vertical(
                                bottom: Radius.elliptical(
                                    MediaQuery.of(context).size.width, 100.0)),
                          ),
                        ),
                        Positioned(
                          bottom: w * 0.09,
                          left: w * 0.35,
                          child: Center(
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "BloomBee",
                                  style: TextStyle(
                                      fontFamily: 'Lobster',
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromARGB(255, 11, 237, 3)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Profile",
                      style: TextStyle(
                          color: Color.fromARGB(255, 15, 13, 8),
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    SizedBox(
                      height: 20,
                    ),

//Parent name
                    TextFormField(
                      controller: controllerPName,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.text_fields),
                        hintText: 'Enter Parent name',
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//Parent Age
                    TextFormField(
                      controller: controllerPAge,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_month_outlined),
                        hintText: 'Enter Parent Age',
                        labelText: 'Age',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

//Child Name
                    TextFormField(
                      controller: controllerChildName,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.child_care_sharp),
                        hintText: 'Enter your Child Name',
                        labelText: 'Child Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//Child Age
                    TextFormField(
                      controller: controllerChildAge,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_month_outlined),
                        hintText: 'Enter your Child Age',
                        labelText: 'Child Age',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//ChildGender
                    TextFormField(
                      controller: controllerChildGender,
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.girl_outlined),
                        hintText: 'Enter your Child Gender',
                        labelText: 'Child Gender',
                      ),
                    ),
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            MaterialButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20.0),
                ),
              ),
              elevation: 5.0,
              height: 40,
              onPressed: () {
                final user = User(
                  PName: controllerPName.text,
                  PAge: double.parse(controllerPAge.text),
                  ChildName: controllerChildName.text,
                  ChildAge: double.parse(controllerChildAge.text),
                  ChildGender: controllerChildGender.text,
                );
                createUser(user);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                );
              },
              color: Colors.white,
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        )));
  }

  InputDecoration decoration(String label) =>
      InputDecoration(labelText: label, border: const OutlineInputBorder());
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users');

    final userdata = FirebaseAuth.instance.currentUser?.uid;
    user.id = userdata.toString();
    final json = user.toJson();
    await docUser.doc(userdata).set(json);
  }
}

class User {
  String id;
  String PName;
  double PAge;
  String ChildName;
  double ChildAge;
  String ChildGender;

  User({
    this.id = '',
    required this.PName,
    required this.PAge,
    required this.ChildName,
    required this.ChildAge,
    required this.ChildGender,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'Parent Name': PName,
        'Parent Age': PAge,
        'Child Name': ChildName,
        'Child Age': ChildAge,
        'Child Gender': ChildGender,
      };
}
