
import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'auth_btn_click_box.dart';
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
            AuthDialogUtils.showSignInDialog(
             context,
             onSignIn: (email, password) {
               print('Sign In: $email, $password');
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
             },
           );
          },
          backgroundColor: AppColors.primaryColor,
        ),
        const SizedBox(width: 16),
        CustomElevatedButton(
          text: "Sign Up",
          onPressed: () {
             AuthDialogUtils.showSignUpDialog(
              context,
              onSignUp: (name, email, password) {
                print('Sign Up: $name, $email, $password');
                Navigator.pop(context); // Close dialog
                // Handle sign up logic
              },
            );
           },
          backgroundColor: Colors.green[700]!,
        ),
      ],
    );
  }
}
