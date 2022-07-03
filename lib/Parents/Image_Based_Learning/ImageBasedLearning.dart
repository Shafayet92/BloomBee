import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:register/Home_Page/screens/DarkMood/settings.dart';
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

// class _ImageBasedLearningState extends State<ImageBasedLearning> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//         home: Builder(
//             builder: (context) => Scaffold(
//                   appBar: AppBar(
//                     title: const Text('Image Based Learning'),
//                     backgroundColor: Color.fromARGB(255, 35, 116, 39),
//                     leading: GestureDetector(
//                       onTap: () {
//                         Navigator.pushReplacement(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => BaseScreen(),
//                             ));
//                       },
//                       child:
//                           const Icon(Icons.arrow_back // add custom icons also
//                               ),
//                     ),
//                   ),
//                   backgroundColor: Color.fromARGB(255, 2, 23, 55),
//                 )));
//   }
// }

class _ImageBasedLearningState extends State<ImageBasedLearning> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
        valueListenable: darkNotifier,
        builder: (BuildContext context, bool isDark, Widget? child) {
          return MaterialApp(
            title: 'Dark Theme',
            themeMode: isDark ? ThemeMode.dark : ThemeMode.light,
            theme: ThemeData(primaryColor: Colors.green),
            darkTheme: ThemeData.dark(),
            home: SettingsPages(
              title: 'Theme',
            ),
          );
        });

    // Scaffold(
    //     appBar: new AppBar(
    //       title: new Text("Settings"),
    //     ),
    //     body: new Center(
    //       child: new Text("This is Settings Add night mode here"),
    //     ));
  }
}

class SettingsPages extends StatefulWidget {
  SettingsPages({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _SettingsPagesState createState() => _SettingsPagesState();
}

class _SettingsPagesState extends State<SettingsPages> {
  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   darkNotifier.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    bool isDark = darkNotifier.value;
    return Scaffold(
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
          child: const Icon(Icons.arrow_back // add custom icons also
              ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isDark = !isDark;
          darkNotifier.value = isDark;
        },
        tooltip: 'Increment',
        child: Icon(isDark ? Icons.wb_sunny_outlined : Icons.bubble_chart),
      ),
    );
  }
}
