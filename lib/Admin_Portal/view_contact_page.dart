import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ViewContactPage extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  const ViewContactPage(
      {Key? key, required this.documentSnapshot}) //key:key is used
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ViewContactPageState createState() => _ViewContactPageState();
}

class _ViewContactPageState extends State<ViewContactPage> {
  final CollectionReference contacts =
      FirebaseFirestore.instance.collection('contacts');

  final myControllerName = TextEditingController();
  final myControllerAge = TextEditingController();
  final myControllerPhone = TextEditingController();
  final myControllerId = TextEditingController();

  //make sure to inittialize this outside of build method
  late String dropdownValue = widget.documentSnapshot['gender'];

  bool changes = false;

  @override
  Widget build(BuildContext context) {
    myControllerName.text = widget.documentSnapshot['name'];
    myControllerAge.text = widget.documentSnapshot['age'].toString();
    myControllerPhone.text = widget.documentSnapshot['phone'];
    myControllerId.text = widget.documentSnapshot.id;

    return MaterialApp(
      title: 'Welcome to Flutter',
      home: Scaffold(
          appBar: AppBar(
            title: const Text('View/Edit Contact'),
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
                    controller: myControllerId,
                    readOnly: true,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Contact Id',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: myControllerName,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Edit contact name',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: myControllerAge,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Edit contact age',
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String? newValue) async {
                      dropdownValue = newValue!;

                      if (newValue == 'Please Choose Gender') {
                        setState(() {
                          dropdownValue = widget.documentSnapshot['gender'];
                        });
                        showAlertDialogOk(
                            context, 'Please select male or female!');
                      } else {
                        final returnData = await showAlertDialogYesNo(context);

                        if (returnData) {
                          setState(() {
                            dropdownValue = newValue;
                          });
                        }
                      }
                    },
                    items: <String>['Please Choose Gender', 'male', 'female']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: TextFormField(
                    controller: myControllerPhone,
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Edit phone',
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
                          String name = myControllerName.text;
                          String gender = dropdownValue;
                          int age = int.parse(myControllerAge.text);
                          String phone = myControllerPhone.text;

                          await contacts
                              .doc(widget.documentSnapshot.id)
                              .update({
                            "name": name,
                            "gender": gender,
                            "age": age,
                            "phone": phone
                          });
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

Future<bool> showAlertDialogYesNo(BuildContext context) async {
  // Create button
  Widget noButton = ElevatedButton(
    child: const Text("No"),
    onPressed: () {
      Navigator.of(context).pop(false);
    },
  );

  Widget yesButton = ElevatedButton(
    child: const Text("Yes"),
    onPressed: () {
      Navigator.of(context).pop(true);
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: const Text("App Alert"),
    content: const Text("Are you sure you want to change the gender?"),
    actions: [noButton, yesButton],
  );

  // show the dialog
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
