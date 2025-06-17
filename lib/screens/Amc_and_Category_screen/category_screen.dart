import 'package:emlaak/screens/packages_screen_for_both/both_packages_details_bank_name_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../Utils/custome_text.dart';
import '../../Widgets/home/category_cart.dart';
import '../../Widgets/intro/expand_tile.dart';

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
        child: Column(
          children: [
            CustomText(
              "Money Market",
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return CategoryCard(
                    title: "Shariah Compliant Money Market",
                    onTap: () {
                      // Your onTap function here
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => BothPackagesDetailsBankNamesScreen(),
                        ),
                      );
                    },
                  );
                },
              ),
            ),

            SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      // Facebook action
                    },
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      // Instagram action
                    },
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color: Colors.purple,
                      size: 30,
                    ),
                  ),
                  CupertinoButton(
                    onPressed: () {
                      // LinkedIn action
                    },
                    child: Icon(
                      FontAwesomeIcons.linkedin,
                      color: Colors.blue[700],
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10,),
            CustomExpandableTile(
              imagePath: "assets/projects/contact.png",
              title: "Contact",
              description:
                  "Call Center: 0800 - 23275O verseas Callers: + (9221) 34326038 WA: 03489-365225 (03489-Emlaak)info@emlaakfinancials.com ",
            ),
          ],
        ),
      ),
    );
  }
}
