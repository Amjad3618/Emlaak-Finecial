import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utils/custome_text.dart';
import '../Widgets/home/category_cart.dart';
import '../Widgets/intro/expand_tile.dart';

class AmcScreen extends StatefulWidget {
  const AmcScreen({super.key});

  @override
  State<AmcScreen> createState() => _AmcScreenState();
}

class _AmcScreenState extends State<AmcScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            CustomText(
              "Ready to Invest Funds",
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20),
            CategoryCard(
              title: "ABL Asset Management Comapny Limmited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "AKD Investment Management Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "AL Habib Asset Management Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "Al Meezan Management Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "Alfalah GHP Investment Management Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "Atlas Asset Management Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title:
                  "AWT Investments Limited 'Formerly Primus Investement Management  Limited'",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "Faysal Asset Management Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "HBL Asset Management Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "JS Investments Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "Lakson Investments Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "MCB Arif Habib Saving and Investment Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "National Investment Trust Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title:
                  "NBP Full Management Limited  'Formerly NBP Fullerton Asset Management Limited'",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "Pak Oman Assets Management Company Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "Pak-Qatar Asset Management Companay Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            CategoryCard(
              title: "UBL Fund Managers Limited",

              onTap: () {
                // Your onTap function here
              },
            ),
            SizedBox(height: 20),
            CustomText(
              "Sicial Links",
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CupertinoButton(
                  onPressed: () {
                    // Facebook action
                  },
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    size: 40,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    // Instagram action
                  },
                  child: Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.purple,
                    size: 40,
                  ),
                ),
                CupertinoButton(
                  onPressed: () {
                    // LinkedIn action
                  },
                  child: Icon(
                    FontAwesomeIcons.linkedin,
                    color: Colors.blue[700],
                    size: 40,
                  ),
                ),
              ],
            ),
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
