import 'package:emlaak/screens/Amc_and_Category_screen/category/category_packages_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Utils/custome_text.dart';
import '../../../Widgets/home/custom_list_tiles.dart';
import '../../../Widgets/intro/expand_tile.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _slideAnimation;
  late Animation<double> _fadeAnimation;
  
  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _slideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeOutCubic),
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: child,
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10), // Add top padding for status bar
              CustomText(
                "Money Market",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return CustomLitTiles(
                      title: "Shariah Compliant Money Market",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CategoryPackagesScreen(),
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
                      child: const Icon(
                        FontAwesomeIcons.facebook,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                    CupertinoButton(
                      onPressed: () {
                        // Instagram action
                      },
                      child: const Icon(
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
              const SizedBox(height: 10),
              CustomExpandableTile(
                imagePath: "assets/projects/contact.png",
                title: "Contact",
                description:
                    "Call Center: 0800 - 23275O verseas Callers: + (9221) 34326038 WA: 03489-365225 (03489-Emlaak)info@emlaakfinancials.com ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}