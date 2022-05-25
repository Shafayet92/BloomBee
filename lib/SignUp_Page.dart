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
        body: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: <Widget>[
                  Container(
                    width: w,
                    height: h * 0.1,
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
                          left: w * 0.3,
                          child: Column(
                            children: <Widget>[
                              Text(
                                "BloomBee",
                                style: TextStyle(
                                    fontFamily: 'AirbnbCerealBold',
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 242, 0)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                width: w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Color.fromARGB(255, 15, 13, 8),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),

                    SizedBox(
                      height: 20,
                    ),

//email
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.text_fields),
                        hintText: 'Enter your name',
                        labelText: 'Name',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//email
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.email_sharp),
                        hintText: 'Enter your email',
                        labelText: 'Email',
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
//Password
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.password_rounded),
                        hintText: 'Enter your password',
                        labelText: 'Password',
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
                  ],
                )),
            SizedBox(
              height: 20,
            ),
            Container(
                width: w * 0.8,
                height: h * 0.08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: const DecorationImage(
                        image: AssetImage("img/d.png"), fit: BoxFit.cover)),
                child: Center(
                  child: Text("Continue",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: w * .05,
                          fontWeight: FontWeight.bold)),
                )),
            SizedBox(
              height: w * 0.08,
            ),
            RichText(
                text: TextSpan(
                    text: "Have an account?",
                    style: TextStyle(color: Colors.grey[500], fontSize: 20),
                    children: [
                  TextSpan(
                      text: " Sign In",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 0, 0),
                          fontSize: 20,
                          fontWeight: FontWeight.bold))
                ]))
          ],
        ));
  }
}
