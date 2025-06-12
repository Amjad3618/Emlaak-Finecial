import 'package:flutter/material.dart';

import '../Utils/custome_text.dart';
import '../Widgets/home/category_cart.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomText(
                "Money Market",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              
              CategoryCard(
                title: "Shariah Compliant Money Market",
                onTap: () {
                  // Your onTap function here
                },
              ),
              
              CategoryCard(
                title: "Income",
                onTap: () {
                  // Your onTap function here
                },
              ),
              
              CategoryCard(
                title: "Shariah Compliant Income",
                onTap: () {
                  // Your onTap function here
                },
              ),
              
              CategoryCard(
                title: "Shariah Compliant Aggressive Fixed Income",
                onTap: () {
                  // Your onTap function here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}