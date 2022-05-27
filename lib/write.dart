import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(Write());
}

class Write extends StatefulWidget {
  @override
  _WriteState createState() => _WriteState();
}

class _WriteState extends State<Write> {
  final controller = TextEditingController();
  final controllerName = TextEditingController();
  final controllerAge = TextEditingController();
  final controllerDate = TextEditingController();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Color.fromARGB(255, 201, 130, 7),
        // appBar: AppBar(
        //   title: TextField(controller: controller),
        // ),
          body: ListView(
            padding: EdgeInsets.all(16),
            children: <Widget>[
              TextField(
                controller:  controllerName,
                decoration: decoration('Name'),
              ),
              const SizedBox(height: 24,),
              TextField(
                controller: controllerAge,
                decoration:  decoration('Age'),
                keyboardType: TextInputType.number,
              ),
              // const SizedBox(height:24), 
              // DateTimeField(
              //   controller: controllerDate,
              //   decoration: decoration('Birthday'),
              //   format: dateFormat('yyy-MM-dd'),
              //   onShowPicker: (context, currentValue)=>
              //   context: context,
              //   firstDate: DateTime(1900),
              //   lastDate: DateTime(2100),
              //   initialDate: currentValue ?? DateTime.n
                 
              //    const SizeBox(height:32);
                 ElevatedButton(
                   child: Text('Create'),
                   onPressed: (){
                //      final name = controller.text;
                //  createUser(name: name);
                     final user = User (
                       name: controllerName.text,
                       age: int.parse(controllerAge.text),
                       birthday: DateTime.parse(controllerDate.text),
                     );
                     createUser(user);
                     Navigator.pop(context);
                   }, 
              ),
            ],
          ),
          // actions: [
          //   IconButton(
          //     icon: const Icon(Icons.add),
          //     onPressed: () {
          //       final name = controller.text;
          //       createUser(name: name);
          //     },
          //   )
          // ],
        // ),
      );
      InputDecoration decoration(String label)=> InputDecoration(
      labelText: label,
      border: const OutlineInputBorder()
      );
  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();
    user.id = docUser.id; 
    user.name  = docUser.get();
    // final user = User(
    //   id: docUser.id,
    //   name: name,
    //   age: 21,
    //   birthday: DateTime(2001, 7, 28),
    // );

    // final json = user.toJson();

    // final json = {
    //   'name': name,
    //   'age': 21,
    //   'birthday': DateTime(2001, 7, 28),
    // };
    // await docUser.set(json);
    final json = user.toJson();
    await docUser.set(json);
  }
}

class User {
  String id;
   String name;
   int age;
   DateTime birthday;

  User({
    this.id = '',
    required this.name,
    required this.age,
    required this.birthday,
  });
  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'age': age,
        'birthday': birthday,
      };
}
