import 'package:flutter/material.dart';

import '../Utils/custome_text.dart';

class FundDetailsScreen extends StatefulWidget {
  const FundDetailsScreen({super.key});

  @override
  State<FundDetailsScreen> createState() => _FundDetailsScreenState();
}

class _FundDetailsScreenState extends State<FundDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: SizedBox(
          height: 50,
          child: Image.asset("assets/logo.png", fit: BoxFit.cover),
        ),
      ),
      body: Column(children: [Row(children: [
  Column(children: [ 
    CustomText(
      "Total Assets in Millions",
      fontSize: 23,
      fontWeight: FontWeight.bold,
    ),
  ],)
],)]),
    );
  }
}
