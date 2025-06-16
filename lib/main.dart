import 'package:emlaak/screens/Amc_and_Category_screen/category_screen.dart';
import 'package:emlaak/screens/intro_and_home_screen/intro_screen.dart';
import 'package:flutter/material.dart';

import 'screens/SramayaKariScreens/sarmayakari_acc_creation_phonenum_screen.dart';

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
