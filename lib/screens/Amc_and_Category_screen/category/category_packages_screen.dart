import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Widgets/intro/custome_register_btns.dart';
import 'package:flutter/material.dart';

import '../../../Utils/custome_text.dart';
import '../../../Widgets/CustomeDailog/custome_dailog.dart';
import '../../../Widgets/funds_screen/fund_info_colum.dart';
import '../../packages_screen_for_both/sahulat_and_sarmayakari_pkgs_screen.dart.dart';

class CategoryPackagesScreen extends StatefulWidget {
  const CategoryPackagesScreen({super.key});

  @override
  State<CategoryPackagesScreen> createState() =>
      _CategoryPackagesScreenState();
}

class _CategoryPackagesScreenState
    extends State<CategoryPackagesScreen>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late AnimationController _fundController1;
  late AnimationController _fundController2;
  late AnimationController _fundController3;
  
  late Animation<double> _headerFadeAnimation;
  late Animation<double> _fund1FadeAnimation;
  late Animation<double> _fund2FadeAnimation;
  late Animation<double> _fund3FadeAnimation;
  
  late Animation<Offset> _headerSlideAnimation;
  late Animation<Offset> _fund1SlideAnimation;
  late Animation<Offset> _fund2SlideAnimation;
  late Animation<Offset> _fund3SlideAnimation;

  @override
  void initState() {
    super.initState();
    
    // Initialize animation controllers
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fundController1 = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fundController2 = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    _fundController3 = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    // Initialize fade animations
    _headerFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeInOut,
    ));
    
    _fund1FadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fundController1,
      curve: Curves.easeInOut,
    ));
    
    _fund2FadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fundController2,
      curve: Curves.easeInOut,
    ));
    
    _fund3FadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fundController3,
      curve: Curves.easeInOut,
    ));
    
    // Initialize slide animations
    _headerSlideAnimation = Tween<Offset>(
      begin: const Offset(0, -0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeOutBack,
    ));
    
    _fund1SlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fundController1,
      curve: Curves.easeOutBack,
    ));
    
    _fund2SlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fundController2,
      curve: Curves.easeOutBack,
    ));
    
    _fund3SlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _fundController3,
      curve: Curves.easeOutBack,
    ));
    
    // Start animations with delays
    _startAnimations();
  }
  
  void _startAnimations() async {
    await Future.delayed(const Duration(milliseconds: 200));
    _headerController.forward();
    
    await Future.delayed(const Duration(milliseconds: 300));
    _fundController1.forward();
    
    await Future.delayed(const Duration(milliseconds: 400));
    _fundController2.forward();
    
    await Future.delayed(const Duration(milliseconds: 500));
    _fundController3.forward();
  }

  @override
  void dispose() {
    _headerController.dispose();
    _fundController1.dispose();
    _fundController2.dispose();
    _fundController3.dispose();
    super.dispose();
  }

  Widget _buildAnimatedFundCard({
    required Animation<double> fadeAnimation,
    required Animation<Offset> slideAnimation,
    required Widget child,
  }) {
    return SlideTransition(
      position: slideAnimation,
      child: FadeTransition(
        opacity: fadeAnimation,
        child: child,
      ),
    );
  }

  Widget _buildFundCard() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            // Bank Logo
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Image.asset("assets/banks/ubl.png", height: 60),
            ),
            SizedBox(height: 16),

            // Fund Title
            CustomText(
              "UBL FUNDS",
              fontSize: 16,
              color: Colors.blue,
              fontWeight: FontWeight.w600,
            ),
            SizedBox(height: 8),
            CustomText(
              "Al Meezan Islamic Cash Fund",
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
            SizedBox(height: 20),

            // Fund Info Widgets in Column
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFundInfoWidget(
                  title: "Fund Size in Millions",
                  value: "30,656 PKR",
                  titleColor: AppColors.primaryColor,
                  valueColor: Colors.black87,
                  backgroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                CustomFundInfoWidget(
                  title: "30 Days Return",
                  value: "9.89%",
                  titleColor: Colors.green.shade700,
                  valueColor: Colors.green.shade800,
                  backgroundColor: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  border: Border.all(color: Colors.green.shade200),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomFundInfoWidget(
                  title: "0%",
                  value: "Fund Load",
                  titleColor: AppColors.primaryColor,
                  valueColor: Colors.black87,
                  backgroundColor: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                CustomFundInfoWidget(
                  title: "Rs 500",
                  value: "Min. Investment",
                  titleColor: Colors.green.shade700,
                  valueColor: Colors.green.shade800,
                  backgroundColor: Colors.green.shade50,
                  borderRadius: BorderRadius.circular(8),
                  margin: EdgeInsets.symmetric(vertical: 4),
                  border: Border.all(color: Colors.green.shade200),
                ),
              ],
            ),
            SizedBox(height: 10),
            Center(
              child: Image.asset(
                "assets/projects/good-feedback.png",
                height: 50,
              ),
            ),
            CustomText(
              "Low Risk",
              fontSize: 14,
              color: Colors.black54,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomElevatedButton(
                  text: "View Details",
                  onPressed: () {},
                  backgroundColor: AppColors.bluecolor,
                ),
                CustomElevatedButton(
                  text: "Invest",
                  onPressed: () {
                    showCustomDialog(
                      context: context,
                      title: 'Invest',
                      content:
                          'ABL Cash Fund has a risk profile of Low. Further, the fund has a front end load of 0.75%. Kindly confirm if you want to continue with the investment.',
                      titleColor: Colors.black,
                      primaryButtonText: 'Next',
                      secondaryButtonText: 'Cancel',
                      primaryButtonColor: Colors.green,
                      secondaryButtonColor: Colors.grey.shade300,
                      secondaryTextColor: Colors.black87,
                      onPrimaryPressed: () {
                        Navigator.of(context).pop();
                        showCustomDialog(
                          context: context,
                          title: '',
                          content:
                              'Have you invested previously with ABL Asset Management Company Limited',
                          titleColor: Colors.black,
                          primaryButtonText: 'Yes',
                          secondaryButtonText: 'Not',
                          primaryButtonColor: Colors.green,
                          secondaryButtonColor: Colors.grey.shade300,
                          secondaryTextColor: Colors.black87,
                          onPrimaryPressed: () {},
                          onSecondaryPressed: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) =>
                                        SahulatAnadSarmayakariPackagesScreen(),
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                  backgroundColor: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new),
        ),
        title: SizedBox(
          height: 50,
          child: Image.asset("assets/logo.png", fit: BoxFit.cover),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),

            // Animated Top Row with Fund Info Widgets
            SlideTransition(
              position: _headerSlideAnimation,
              child: FadeTransition(
                opacity: _headerFadeAnimation,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: CustomFundInfoWidget(
                          title: "Total Assets in Millions",
                          value: "715,677 PKR",
                          titleColor: AppColors.primaryColor,
                          valueColor: Colors.black,
                          backgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: CustomFundInfoWidget(
                          title: "NO. of Funds",
                          value: "15",
                          titleColor: AppColors.primaryColor,
                          valueColor: Colors.black,
                          backgroundColor: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.2),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            FadeTransition(
              opacity: _headerFadeAnimation,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Divider(color: Colors.grey, thickness: 1),
              ),
            ),

            SizedBox(height: 10),

            // First Fund Card
            _buildAnimatedFundCard(
              fadeAnimation: _fund1FadeAnimation,
              slideAnimation: _fund1SlideAnimation,
              child: _buildFundCard(),
            ),
            
            SizedBox(height: 20),
            
            // Second Fund Card
            _buildAnimatedFundCard(
              fadeAnimation: _fund2FadeAnimation,
              slideAnimation: _fund2SlideAnimation,
              child: _buildFundCard(),
            ),
            
            SizedBox(height: 20),
            
            // Third Fund Card
            _buildAnimatedFundCard(
              fadeAnimation: _fund3FadeAnimation,
              slideAnimation: _fund3SlideAnimation,
              child: _buildFundCard(),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}