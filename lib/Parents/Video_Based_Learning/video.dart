import 'dart:async';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Butterfly Video'),
        ),
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: MaterialButton(
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
          child: FutureBuilder(
            future: _initializeVideoPlayerFuture,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                // If the VideoPlayerController has finished initialization, use
                // the data it provides to limit the aspect ratio of the video.
                return AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  // Use the VideoPlayer widget to display the video.
                  child: VideoPlayer(_controller),
                );
              } else {
                // If the VideoPlayerController is still initializing, show a
                // loading spinner.
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            },
          ),
        ));
  }
}



// class VideoBaseLearning extends StatefulWidget {
//   @override
//   VideoPlayerScreen createState() => VideoPlayerScreen();
// }

// // class VideoPlayerScreen extends State<VideoBaseLearning> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //         home: Builder(
// //             builder: (context) => Scaffold(
// //                   appBar: AppBar(
// //                     title: const Text('Image Based Learning'),
// //                     backgroundColor: Color.fromARGB(255, 35, 116, 39),
// //                     leading: GestureDetector(
// //                       onTap: () {
// //                         Navigator.pushReplacement(
// //                             context,
// //                             MaterialPageRoute(
// //                               builder: (context) => BaseScreen(),
// //                             ));
// //                       },
// //                       child:
// //                           const Icon(Icons.arrow_back // add custom icons also
// //                               ),
// //                     ),
// //                   ),
// //                   backgroundColor: Color.fromARGB(255, 2, 23, 55),
// //                 )));
// //   }
// // }

// class VideoPlayerScreen extends State<VideoBaseLearning> {
//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<bool>(
//         valueListenable: darkNotifier,
//         builder: (BuildContext context, bool isDark, Widget? child) {
//           return MaterialApp(
//             title: 'Dark Theme',
//             themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
//             theme: ThemeData(primaryColor: Colors.green),
//             darkTheme: ThemeData.dark(),
//             home: SettingsPages(
//               title: 'Theme',
//             ),
//           );
//         });

//     // Scaffold(
//     //     appBar: new AppBar(

//     //       title: new Text("Settings"),
//     //     ),
//     //     body: new Center(
//     //       child: new Text("This is Settings Add night mode here"),
//     //     ));
//   }
// }

// class SettingsPages extends StatefulWidget {
//   SettingsPages({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _SettingsPagesState createState() => _SettingsPagesState();
// }

// class _SettingsPagesState extends State<SettingsPages> {
//   // @override
//   // void dispose() {
//   //   // TODO: implement dispose
//   //   darkNotifier.dispose();
//   //   super.dispose();
//   // }
//   // Future<AudioPlayer> playLocalAsset() async {
//   //   AudioCache cache = new AudioCache();
//   //   //At the next line, DO NOT pass the entire reference such as assets/yes.mp3. This will not work.
//   //   //Just pass the file name only.
//   //   return await cache.play("assets/pronunciation_en_papa.mp3");
//   // }

//   @override
//   Widget build(BuildContext context) {
//     bool isDark = darkNotifier.value;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Video Based Learning'),
//         backgroundColor: Color.fromARGB(255, 35, 116, 39),
//         leading: GestureDetector(
//           onTap: () {
//             Navigator.pushReplacement(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => BaseScreen(),
//                 ));
//           },
//           child: const Icon(Icons.arrow_back // add custom icons also
//               ),
//         ),
//       ),
//       body: Container(
//         padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Expanded(
//               child: GridView.count(
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//                 primary: false,
//                 crossAxisCount: 2,
//                 children: <Widget>[
//                   Card(
//                     //shape: RoundedRectangleBorder(8),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
//                         MaterialButton(
//                           onPressed: () async {
//                             // await player.setAsset(
//                             //     'assets/audio/pronunciation_en_papa.mp3');
//                             // player.play();
//                           },
//                           child: Image.asset(
//                             'img/FATHER.png', //1
//                             fit: BoxFit.scaleDown,
//                             height: 130,
//                           ),
//                         ),

//                         // TextButton(
//                         //     child: const Text('All Parents'),
//                         //     onPressed: () {
//                         //       Navigator.push(
//                         //         context,
//                         //         MaterialPageRoute(
//                         //           builder: (context) => ViewAllUser(),
//                         //         ),
//                         //       );
//                         //     }),
//                       ],
//                     ),
//                   ),
//                   Card(
//                     // shape: RoundedRectangleBorder(8),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: <Widget>[
// // SvgPicture.network('https://image.flaticon.com/icons/svg/1994/1904425.svg'
// // , height: 128, ),
//                         MaterialButton(
//                           onPressed: () async {
//                             // await player.setAsset(
//                             //     'assets/audio/pronunciation_en_papa.mp3');
//                             // player.play();
//                           },
//                           child: Image.asset(
//                             'img/mother.jpg', //2
//                             fit: BoxFit.scaleDown,
//                             height: 130,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ]))]))
  
//     );
//   }
// }
