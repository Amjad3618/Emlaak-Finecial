import 'package:flutter/material.dart';

import 'invest_categories_items.dart';

class InvestmentCategoriesWidget extends StatelessWidget {
  const InvestmentCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.green[100]),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "FINF THE PERFECT \n INVESTENT",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              InvestmentCategoryItem(
                imagePath: "assets/investment4.png",
                title: "Long-term Savings",

                fallbackIcon: Icons.savings,
              ),
              const SizedBox(width: 20),
              InvestmentCategoryItem(
                imagePath: "assets/investment3.png",
                title: "Children's Savings",

                fallbackIcon: Icons.child_care,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              InvestmentCategoryItem(
                imagePath: "assets/investment1.png",
                title: "Retirement Planning",

                fallbackIcon: Icons.elderly,
              ),
              const SizedBox(width: 20),
              InvestmentCategoryItem(
                imagePath: "assets/investment2.png",
                title: "Emergency Funds",

                fallbackIcon: Icons.emergency,
              ),
            ],
          ),
        ],
      ),
    );
  }
}