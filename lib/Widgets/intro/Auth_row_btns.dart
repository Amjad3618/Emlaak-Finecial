
import 'package:emlaak/Utils/colors.dart';
import 'package:flutter/material.dart';

import 'custome_register_btns.dart';

class AuthButtonsWidget extends StatelessWidget {
  const AuthButtonsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomElevatedButton(
          text: "Sign In",
          onPressed: () {
            // Handle sign in
          },
          backgroundColor: AppColors.primaryColor,
        ),
        const SizedBox(width: 16),
        CustomElevatedButton(
          text: "Sign Up",
          onPressed: () {
            // Handle sign up
          },
          backgroundColor: Colors.green[700]!,
        ),
      ],
    );
  }
}
