import 'package:emlaak/screens/Amc_and_Category_screen/AMC/amc_packages_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../Utils/custome_text.dart';
import '../../../Widgets/home/custom_list_tiles.dart';
import '../../../Widgets/intro/expand_tile.dart';

class AmcScreen extends StatefulWidget {
  const AmcScreen({super.key});

  @override
  State<AmcScreen> createState() => _AmcScreenState();
}

class _AmcScreenState extends State<AmcScreen> with TickerProviderStateMixin {
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
            child: Opacity(opacity: _fadeAnimation.value, child: child),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 10), // Fixed header area
              CustomText(
                "Ready to Invest Funds",
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),

              // Only the ListView will scroll
              Expanded(
                child: ListView.builder(
                  itemCount: 10, // Increased count to see scrolling
                  itemBuilder: (context, index) {
                    return CustomLitTiles(
                      title: "ABL Asset Management Company Limited",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AmcPackagesScreen(),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              // Fixed footer area
              const SizedBox(height: 20),
              CustomText(
                "Social Links",
                fontSize: 15,
                fontWeight: FontWeight.bold,
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
