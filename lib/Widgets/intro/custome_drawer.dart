import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

class CustomeDrawer extends StatefulWidget {
  const CustomeDrawer({super.key});

  @override
  State<CustomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<CustomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          SizedBox(height: 30),
          ListTile(
            leading: const Icon(Icons.person_pin, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              'About Us',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to home screen
            },
          ),
          ListTile(
            leading: const Icon(Icons.question_answer, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              "FAQ'S",
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: () {
              Navigator.pop(context); // Close the drawer
              // Navigate to home screen
            },
          ),
          
        ],
      ),
    );
  }
}
