import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import 'step_items.dart';

class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StepItem(
              imagePath: "assets/step1.png",
              title: "Create Account",
              fallbackIcon: Icons.looks_one,
            ),
            StepItem(
              imagePath: "assets/step2.png",
              title: "Pick Mutual Fund",
              fallbackIcon: Icons.looks_two,
            ),
            StepItem(
              imagePath: "assets/step3.png",
              title: "Invest Online",
              fallbackIcon: Icons.looks_3,
            ),
          ],
        ),
      ),
    );
  }
}