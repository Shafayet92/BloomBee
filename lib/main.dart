import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/Home_Page/screens/base_screen.dart';
import 'package:register/viewAllUsers.dart';
import 'package:register/write.dart';

import 'adminhome.dart';
import 'home.dart';
import 'login.dart';
import 'login_page.dart';
import 'register.dart';

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
      home: HomeScreen(),
    );
  }
}
