// main_intro_screen.dart
import 'package:flutter/material.dart';
import 'dart:async';

import '../Widgets/Auth_btns_row.dart';
import '../Widgets/custom_register_btns.dart';
import '../Widgets/invest_categories.dart';
import '../Widgets/step_item.dart';

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
        drawer: const Drawer(),
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
                decoration: BoxDecoration(color: Colors.green),
                child: Column(
                  children: [
                    Text(
                      "FINF THE PERFECT \n INVESTENT",
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
          _buildSlideItem("assets/intro img 1.png", Colors.green),
          _buildSlideItem("assets/intro img 2.png", Colors.green),
          _buildSlideItem("assets/intro img 3.png", Colors.greenAccent),
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
        child: Image.asset(imagePath, height: 190, fit: BoxFit.cover),
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

// auth_buttons_widget.dart

// custom_elevated_button.dart

// steps_widget.dart
class StepsWidget extends StatelessWidget {
  const StepsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.green.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StepItem(
              imagePath: "assets/step1.png",
              title: "Create Account",
              fallbackIcon: Icons.looks_one,
            ),
            StepItem(
              imagePath: "assets/step2.png",
              title: "Pick Mutual Fund",
              fallbackIcon: Icons.looks_two,
            ),
            StepItem(
              imagePath: "assets/step3.png",
              title: "Invest Online",
              fallbackIcon: Icons.looks_3,
            ),
          ],
        ),
      ),
    );
  }
}

// step_item.dart

// investment_categories_widget.dart
class InvestmentCategoriesWidget extends StatelessWidget {
  const InvestmentCategoriesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Colors.green[100]),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "FINF THE PERFECT \n INVESTENT",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.blue,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              InvestmentCategoryItem(
                imagePath: "assets/investment4.png",
                title: "Long-term Savings",

                fallbackIcon: Icons.savings,
              ),
              const SizedBox(width: 20),
              InvestmentCategoryItem(
                imagePath: "assets/investment3.png",
                title: "Children's Savings",

                fallbackIcon: Icons.child_care,
              ),
            ],
          ),
          const SizedBox(height: 40),
          Row(
            children: [
              InvestmentCategoryItem(
                imagePath: "assets/investment1.png",
                title: "Retirement Planning",

                fallbackIcon: Icons.elderly,
              ),
              const SizedBox(width: 20),
              InvestmentCategoryItem(
                imagePath: "assets/investment2.png",
                title: "Emergency Funds",

                fallbackIcon: Icons.emergency,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// investment_category_item.dart
