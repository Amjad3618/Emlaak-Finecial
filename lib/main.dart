import 'package:emlaak/screens/intro_and_tapbar_screen/intro_screen.dart';
import 'package:flutter/material.dart';




void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Emlaak Finacial',
      
      home: IntroScreen()
    );
  }
}
