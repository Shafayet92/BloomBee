import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:register/Home_Page/screens/base_screen.dart';
// import 'package:restful5/screens/insert_contact_page.dart';
// import 'package:restful5/screens/view_contact_page.dart';
// import 'package:restful5/utils/pallete.dart';

class VideoBaseLearning extends StatefulWidget {
  const VideoBaseLearning({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _VideoBaseLearning createState() => _VideoBaseLearning();
}

class _VideoBaseLearning extends State<VideoBaseLearning> {
  final CollectionReference contacts =
      FirebaseFirestore.instance.collection('tasks');

  // Deleteing a product by id
  Future<void> _deleteContact(String contactId) async {
    await contacts.doc(contactId).delete();

    // Show a snackbar
    // ignore: use_build_context_synchronously
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('You have successfully deleted a contact')));
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        home: Builder(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Video Based Learning'),
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
