import 'package:flutter/material.dart';

class CustomExpandableTile extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;

  const CustomExpandableTile({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      leading: CircleAvatar(backgroundImage: AssetImage(imagePath)),
      title: Text(title, style: TextStyle(fontSize: 20)),
      children: [ListTile(title: Text(description))],
    );
  }
}
