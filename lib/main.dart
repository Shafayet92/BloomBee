// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'register.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) => Scaffold(
//         backgroundColor: Colors.amber,
//         appBar: AppBar(
//           title: TextField(controller: controller),
//           actions: [
//             IconButton(
//               icon: const Icon(Icons.add),
//               //  color: selection =Colors.green[400]!,
//               onPressed: () {
//                 // final name = controller.text;
//                 // createUser(name: name);
//               },
//             )
//           ],
//         ),
//       );
//   // Future createUser({required String name}) async {
//   //   final docUser = FirebaseFirestore.instance.collection('users').doc('my-id');

//   //   final json = {
//   //     'name': name,
//   //     'age': 21,
//   //     'birthday': DateTime(2001, 7, 28),
//   //   };
//   //   await docUser.set(json);
//   // }
// }

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'register.dart';
import 'write.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue[900],
      ),
      home: Write(),
    );
  }
}









// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// import 'register.dart';

// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await Firebase.initializeApp();
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primaryColor: Colors.blue[900],
//       ),
//       home: Register(),
//     );
//   }
// }
