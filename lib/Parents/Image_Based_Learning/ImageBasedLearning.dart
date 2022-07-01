import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/Home_Page/screens/base_screen.dart';

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
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Image Based Learning'),
                    backgroundColor: Color.fromARGB(255, 35, 116, 39),
                    leading: GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BaseScreen(),
                            ));
                      },
                      child:
                          const Icon(Icons.arrow_back // add custom icons also
                              ),
                    ),
                  ),
                  backgroundColor: Color.fromARGB(255, 2, 23, 55),
                )));
  }
}
