import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:register/viewAllUsers.dart';

import '../Home_Page/screens/details_screen.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final email = FirebaseAuth.instance.currentUser?.email;

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .7,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/images02.jpg'),
                  alignment: Alignment.topCenter),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 64,
                    margin: EdgeInsets.only(bottom: 20),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              'https://picsum.photos/seed/picsum/200/300'),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Welcome Admin, ',
                              style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 3, 19, 237)),
                            ),
                            Text(
                              '\n        Email: ' + email!,
                              style: TextStyle(
                                  fontFamily: 'Lobster',
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 21, 2, 121)),
                            ),
                          ],
                        ),
                        // child: Column(
                        //   mainAxisAlignment: MainAxisAlignment.center,
                        //    crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: <Widget>[
                        //   Text('John Rick')
                      ],
                      // )
                    ),
                    // ]
                  ),
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      primary: false,
                      crossAxisCount: 2,
                      children: <Widget>[
                        Card(
                          //shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                              TextButton(
                                  child: const Text('All Parents'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewAllUser(),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Card(
                          // shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                              TextButton(
                                  child: const Text('Set Daily Activity'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewAllUser(),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Card(
                          // shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              // SvgPicture.network(
                              //   'https://image.flaticon.com/icons/svg/1994/1904425.svg',
                              //   height: 128,
                              // ),

                              TextButton(
                                  child: const Text('Set Lessons'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewAllUser(),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Card(
                          //shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                              TextButton(
                                  child: const Text('Check Learning Materials'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewAllUser(),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                        Card(
                          //shape: RoundedRectangleBorder(8),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
// SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// , height: 128, ),

                              TextButton(
                                  child: const Text('Update Admin Profile'),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => ViewAllUser(),
                                      ),
                                    );
                                  }),
                            ],
                          ),
                        ),
                      ],

                      // crossAxisCount: 2)),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
