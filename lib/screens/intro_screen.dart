// main_intro_screen.dart
import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Utils/custome_text.dart';
import 'package:emlaak/Widgets/intro/about_emlaak_section.dart';
import 'package:emlaak/Widgets/intro/bank_grid.dart';
import 'package:emlaak/Widgets/intro/project_by_section.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import '../Widgets/intro/Auth_row_btns.dart';
import '../Widgets/intro/custome_drawer.dart';
import '../Widgets/intro/custome_register_btns.dart';
import '../Widgets/intro/expand_tile.dart';
import '../Widgets/intro/intro_help_section.dart';
import '../Widgets/intro/invetment_categories.dart';
import '../Widgets/intro/step_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startAutoSlide();
  }

  void _startAutoSlide() {
    _timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 50,
            child: Image.asset("assets/logo.png", fit: BoxFit.cover),
          ),
        ),
        drawer: CustomeDrawer(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              IntroSliderWidget(
                pageController: _pageController,
                currentPage: _currentPage,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
              ),
              PageIndicatorWidget(currentPage: _currentPage),
              const SizedBox(height: 10),
              const AuthButtonsWidget(),
              const SizedBox(height: 10),
              const StepsWidget(),
              const SizedBox(height: 10),
              const InvestmentCategoriesWidget(),
              SizedBox(height: 10),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(color: AppColors.primaryColor),
                child: Column(
                  children: [
                    Text(
                      "YOUR FUTUR \n NEED A  \n SOLID PLAN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomElevatedButton(
                      text: "GET STARTED",
                      onPressed: () {},
                      backgroundColor: Colors.green,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "BENEFITS OF",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "EMLAAK \n FINACIAL",
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    SizedBox(height: 10),
                    CustomExpandableTile(
                      imagePath: "assets/troly.png",
                      title: "One-Stop Shop",
                      description:
                          "A complete array of mutual funds made available on a single platform",
                    ),
                    SizedBox(height: 10),
                    CustomExpandableTile(
                      imagePath: "assets/search.png",
                      title: "Transparency",
                      description:
                          "Online tools and expert research to pick the best-suited fund",
                    ),
                    SizedBox(height: 10),
                    CustomExpandableTile(
                      imagePath: "assets/book mark.png",
                      title: "Online Investment",
                      description: "Quick and hassle-free online investment",
                    ),
                    SizedBox(height: 10),
                    CustomExpandableTile(
                      imagePath: "assets/portfolio.png",
                      title: "Portfolio Tracking & Reporting",
                      description:
                          "Ongoing Monitoring and evaluation of the entire portfolio in one place ",
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              BankGridWidget(
                imagePaths: [
                  "assets/banks/786.png",
                  "assets/banks/akd.png",
                  "assets/banks/alfalah.png",
                  "assets/banks/alhabib.png",
                  "assets/banks/allied.png",
                  "assets/banks/askari.png",
                  "assets/banks/atlas.png",
                  "assets/banks/awt.png",
                  "assets/banks/bma.png",
                  "assets/banks/fbl.png",
                  "assets/banks/js.png",
                  "assets/banks/lakson.png",
                  "assets/banks/lakson.png",
                  "assets/banks/mcbah.png",
                  "assets/banks/meezan.png",
                  "assets/banks/nift.png",
                  "assets/banks/nit.png",
                  "assets/banks/pakoman.png",
                  "assets/banks/ubl.png",
                ],
                onTap: (path) {
                  // your logic here
                  print("Tapped: $path");
                },
              ),
              SizedBox(height: 15),
              IntroHelpSection(),
              SizedBox(height: 15),
              AboutEmlaakSection(),
              SizedBox(height: 15),
              ProjectBySection(),
              SizedBox(height: 15),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.green[50]),
                child: Column(
                  children: [
                    CustomText(
                      "Stay Connected",
                      fontSize: 30,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                    CustomExpandableTile(
                      imagePath: "assets/projects/contact.png",
                      title: "Contact",
                      description:
                          "Call Center: 0800 - 23275O verseas Callers: + (9221) 34326038 WA: 03489-365225 (03489-Emlaak)info@emlaakfinancials.com ",
                    ),
                    CustomExpandableTile(
                      imagePath: "assets/projects/location.png",
                      title: "Locate Us",
                      description:
                          "CDC House, 99-B, Block 'B', S.M.C.H.S, Main Shahra-e-Faisal, Karachi-74400",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// intro_slider_widget.dart
class IntroSliderWidget extends StatelessWidget {
  final PageController pageController;
  final int currentPage;
  final Function(int) onPageChanged;

  const IntroSliderWidget({
    super.key,
    required this.pageController,
    required this.currentPage,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: [
          _buildSlideItem("assets/intro img 1.png", AppColors.primaryColor),
          _buildSlideItem("assets/intro img 2.png", AppColors.primaryColor),
          _buildSlideItem("assets/intro img 3.png", AppColors.primaryColor),
        ],
      ),
    );
  }

  Widget _buildSlideItem(String imagePath, Color shadowColor) {
    return Container(
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: shadowColor.withOpacity(0.3),
            blurRadius: 15,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(imagePath, height: 190),
      ),
    );
  }
}

// page_indicator_widget.dart
class PageIndicatorWidget extends StatelessWidget {
  final int currentPage;

  const PageIndicatorWidget({super.key, required this.currentPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 4,
            width: currentPage == index ? 24 : 8,
            decoration: BoxDecoration(
              color:
                  currentPage == index
                      ? Colors.green
                      : Colors.grey.withOpacity(0.5),
              borderRadius: BorderRadius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
