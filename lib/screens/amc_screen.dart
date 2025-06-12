import 'package:flutter/material.dart';

import '../Utils/custome_text.dart';
import '../Widgets/home/category_cart.dart';

class AmcScreen extends StatefulWidget {
  const AmcScreen({super.key});

  @override
  State<AmcScreen> createState() => _AmcScreenState();
}

class _AmcScreenState extends State<AmcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            CustomText(
              "Ready to Invest Funds",
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 10,),
             CategoryCard(
                title: "Shariah Compliant Money Market",
                onTap: () {
                  // Your onTap function here
                },
              ),
          ],
        ),
      ),
    );
  }
}
