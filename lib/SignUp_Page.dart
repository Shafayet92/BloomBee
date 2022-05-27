import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
                            color: Colors.red,
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
                                      color: Color.fromARGB(255, 255, 242, 0)),
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
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.calendar_month_outlined),
                        hintText: 'Enter your Child Age',
                        labelText: 'Child Age',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    //Gender
                    TextFormField(
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
                // Navigator.pushReplacement(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => Register(),
                //   ),
                // );
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
}
