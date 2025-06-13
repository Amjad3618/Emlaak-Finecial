import 'package:flutter/material.dart';

import '../../Utils/colors.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _CustomeDrawerState();
}

class _CustomeDrawerState extends State<HomeDrawer> {
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
              'HOME',
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
            leading: const Icon(Icons.trending_up, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              "Fund Comparison",
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
            leading: const Icon(Icons.transcribe, color: Colors.green),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              "My Transections",
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
              "Settings",
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
            leading: const Icon(Icons.logout, color: Colors.red),
            trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),

            title: const Text(
              "Logout",
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
