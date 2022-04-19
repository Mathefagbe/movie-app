import 'package:flutter/material.dart';
import 'package:movie_app/screens/welcomescreen.dart';
import 'package:movie_app/utilis/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: darktheme,
      theme: lightthemes,
      home: const WelcomeScreen(),
    );
  }
}
