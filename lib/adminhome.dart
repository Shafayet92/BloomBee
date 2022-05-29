import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
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
                          children: <Widget>[Text('John Rick')],
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
                              Text('User Data'),
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
                              Text('Set Daily Activity'),
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
                              Text('Set Lessons')
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
                              Text('Check Learning Materials')
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
                              Text('Update Admin Profile')
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
