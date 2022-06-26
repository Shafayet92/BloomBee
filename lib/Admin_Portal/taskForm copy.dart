import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class InsertContactPage extends StatefulWidget {
  const InsertContactPage({Key? key}) //key:key is used
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _InsertContactPageState createState() => _InsertContactPageState();
}

class _InsertContactPageState extends State<InsertContactPage> {
  final myControllerTname = TextEditingController();
  final myControllerTdes = TextEditingController();
  final myControllerNotes = TextEditingController();
  final myControllerSdate = TextEditingController();
  final myControllerEdate = TextEditingController();

  //make sure to inittialize this outside of build method

  @override
  void initState() {
    myControllerSdate.text = "";
    myControllerEdate.text = ""; //set the initial value of text field
    super.initState();
  }

  bool changes = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Add New Task'),
            //back button disabled
            //automaticallyImplyLeading: false,
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: myControllerTname,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Task Tname',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: myControllerTdes,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Task Description',
                    ),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.all(15),
                    // height: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: TextField(
                      controller: myControllerSdate,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "Start Date" //label text of field
                          ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedStartDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedStartDate != null) {
                          print(
                              pickedStartDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedStartDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            myControllerSdate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ))),
                Padding(
                    padding: EdgeInsets.all(15),
                    // height: MediaQuery.of(context).size.width / 3,
                    child: Center(
                        child: TextField(
                      controller: myControllerEdate,
                      //editing controller of this TextField
                      decoration: InputDecoration(
                          icon: Icon(Icons.calendar_today), //icon of text field
                          labelText: "End Date" //label text of field
                          ),
                      readOnly: true,
                      //set it true, so that user will not able to edit text
                      onTap: () async {
                        DateTime? pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1950),
                            //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime(2100));

                        if (pickedDate != null) {
                          print(
                              pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                          String formattedDate =
                              DateFormat('yyyy-MM-dd').format(pickedDate);
                          print(
                              formattedDate); //formatted date output using intl package =>  2021-03-16
                          setState(() {
                            myControllerEdate.text =
                                formattedDate; //set output date to TextField value.
                          });
                        } else {}
                      },
                    ))),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: myControllerNotes,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Notes',
                    ),
                  ),
                ),
                ListTile(
                  //contentPadding: EdgeInsets.all(<some value here>),//change for side padding
                  title: Row(
                    children: <Widget>[
                      Expanded(
                          child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () {
                          if (changes) {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop(1);
                          } else {
                            // ignore: use_build_context_synchronously
                            Navigator.of(context).pop(0);
                          }
                        },
                        child: const Text('Back'),
                      )),
                      Expanded(
                          child: TextButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                        ),
                        onPressed: () async {
                          String Tname = myControllerTname.text;
                          String Sdate = myControllerSdate.text;
                          String Edate = myControllerEdate.text;
                          String Tdes = myControllerTdes.text;
                          String Notes = myControllerNotes.text;

                          // Add a new document with a generated id.
                          final data = {
                            "Tname": Tname,
                            "Task Description": Tdes,
                            "Sdate": Sdate,
                            "Edate": Edate,
                            "Notes": Notes,
                          };

                          final CollectionReference contacts =
                              FirebaseFirestore.instance.collection('contacts');
                          contacts.add(data).then((documentSnapshot) =>
                              // ignore: avoid_print
                              print(
                                  "Added Data with ID: ${documentSnapshot.id}"));
                        },
                        child: const Text('Submit'),
                      )),
                    ],
                  ),
                )
              ],
            ),
          )),
    );
  }
}

showAlertDialogOk(BuildContext context, String alertText) {
  // Create button
  Widget okButton = ElevatedButton(
    child: const Text("OK"),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("App Alert"),
    content: Text(alertText),
    actions: [
      okButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

// Future<bool> showAlertDialogYesNo(BuildContext context) async {
//   // Create button
//   Widget noButton = ElevatedButton(
//     child: const Text("No"),
//     onPressed: () {
//       Navigator.of(context).pop(false);
//     },
//   );

//   Widget yesButton = ElevatedButton(
//     child: const Text("Yes"),
//     onPressed: () {
//       Navigator.of(context).pop(true);
//     },
//   );

//   // Create AlertDialog
//   AlertDialog alert = AlertDialog(
//     title: const Text("App Alert"),
//     content: const Text("Are you sure you want to change the gender?"),
//     actions: [noButton, yesButton],
//   );

//   // show the dialog
//   return await showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return alert;
//     },
 // );
//}
