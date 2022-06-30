import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:register/Home_Page/screens/base_screen.dart';
import 'package:register/Home_Page/screens/details_screen.dart';
import 'package:register/login.dart';
import 'package:register/parentsTaskPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(ImageBasedLearning());
}

class ImageBasedLearning extends StatefulWidget {
  @override
  _ImageBasedLearningState createState() => _ImageBasedLearningState();
}

class _ImageBasedLearningState extends State<ImageBasedLearning> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: CustomIconButton(
        child: const Icon(Icons.arrow_back),
        height: 35,
        width: 35,
        onTap: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) {
                return BaseScreen();
              },
            ),
          );
        },
      ),
    );
  }
}
