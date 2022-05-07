import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Example Nav bar animations. By Leonardo Serrano',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        textTheme: const TextTheme(
          subtitle1: TextStyle(color: Colors.white),
        ),
      ),
      themeMode: ThemeMode.dark,
      home: const HomePage(),
    );
  }
}
