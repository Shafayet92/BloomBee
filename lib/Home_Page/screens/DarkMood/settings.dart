import 'package:flutter/material.dart';
import 'package:register/Home_Page/screens/DarkMood/settings_theme.dart';

final darkNotifier = ValueNotifier<bool>(false);

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
