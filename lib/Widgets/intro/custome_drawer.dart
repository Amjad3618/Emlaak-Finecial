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
            leading: const Icon(Icons.home, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              'Home',
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
            leading: const Icon(Icons.foundation_outlined, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              'Fund Comparison',
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
            leading: const Icon(Icons.transform, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              'My Transactions',
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
            leading: const Icon(Icons.settings, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
            title: const Text(
              'Settings',
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
          Padding(padding: EdgeInsets.all(20), child: Divider()),
          ListTile(
            leading: const Icon(Icons.logout, color: Colors.green),
            trailing: Icon(Icons.arrow_back_ios, color: Colors.black),
            title: const Text(
              'Logout',
              style: TextStyle(
                color: AppColors.errorColor,
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
