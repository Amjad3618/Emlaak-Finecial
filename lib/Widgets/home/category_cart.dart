import 'package:emlaak/Utils/custome_text.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CategoryCard({
    Key? key,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: ListTile(
        onTap: onTap,
        trailing: IconButton(
          onPressed: onTap,
          icon: Icon(Icons.arrow_forward_ios),
        ),
        title: CustomText(
          title,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}