import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Utils/custome_text.dart';
import 'package:emlaak/Widgets/AppBar/custom_appbar.dart';
import 'package:flutter/material.dart';

import '../../../Widgets/CustomeDailog/custome_dailog.dart';
import '../../packages_screen_for_both/sahulat_and_sarmayakari_pkgs_screen.dart.dart';

class AmcPackagesScreen extends StatefulWidget {
  const AmcPackagesScreen({super.key});

  @override
  State<AmcPackagesScreen> createState() => _AmcPackagesScreenState();
}

class _AmcPackagesScreenState extends State<AmcPackagesScreen>
    with TickerProviderStateMixin {
  late AnimationController _headerController;
  late List<AnimationController> _cardControllers;
  
  late Animation<double> _headerFadeAnimation;
  late List<Animation<double>> _cardFadeAnimations;
  
  late Animation<Offset> _headerSlideAnimation;
  late List<Animation<Offset>> _cardSlideAnimations;

  @override
  void initState() {
    super.initState();
    
    // Initialize header animation controller
    _headerController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    
    // Initialize card animation controllers (10 cards)
    _cardControllers = List.generate(
      10,
      (index) => AnimationController(
        duration: const Duration(milliseconds: 800),
        vsync: this,
      ),
    );
    
    // Initialize header animations
    _headerFadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeInOut,
    ));
    
    _headerSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _headerController,
      curve: Curves.easeOutBack,
    ));
    
    // Initialize card animations
    _cardFadeAnimations = _cardControllers.map((controller) {
      return Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeInOut,
      ));
    }).toList();
    
    _cardSlideAnimations = _cardControllers.map((controller) {
      return Tween<Offset>(
        begin: const Offset(0, 0.5),
        end: Offset.zero,
      ).animate(CurvedAnimation(
        parent: controller,
        curve: Curves.easeOutBack,
      ));
    }).toList();
    
    // Start animations with delays
    _startAnimations();
  }
  
  void _startAnimations() async {
    // Start header animation
    await Future.delayed(const Duration(milliseconds: 200));
    _headerController.forward();
    
    // Start card animations with staggered delays
    for (int i = 0; i < _cardControllers.length; i++) {
      await Future.delayed(const Duration(milliseconds: 150));
      _cardControllers[i].forward();
    }
  }

  @override
  void dispose() {
    _headerController.dispose();
    for (var controller in _cardControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  Widget _buildAnimatedCard({
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: CustomAppbar(),
      body: ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: 12, // 1 for header + 1 for divider + 10 fund cards
        itemBuilder: (context, index) {
          if (index == 0) {
            // Animated Header Section
            return SlideTransition(
              position: _headerSlideAnimation,
              child: FadeTransition(
                opacity: _headerFadeAnimation,
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: _buildHeaderSection(),
                ),
              ),
            );
          } else if (index == 1) {
            // Animated Divider Section
            return SlideTransition(
              position: _headerSlideAnimation,
              child: FadeTransition(
                opacity: _headerFadeAnimation,
                child: Column(
                  children: [
                    Container(
                      height: 2,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            AppColors.primaryColor.withOpacity(0.5),
                            Colors.transparent,
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            );
          } else {
            // Animated Fund Cards
            final cardIndex = index - 2;
            return _buildAnimatedCard(
              fadeAnimation: _cardFadeAnimations[cardIndex],
              slideAnimation: _cardSlideAnimations[cardIndex],
              child: Container(
                margin: const EdgeInsets.only(
                  left: 16,
                  right: 16,
                  bottom: 20,
                ),
                child: _buildFundCard(cardIndex),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildHeaderSection() {
    return Row(
      children: [
        // Bank Info Card
        Expanded(
          child: _build3DCard(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    "assets/banks/allied.png",
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
                const SizedBox(height: 16),
                CustomText(
                  "Total Assets in Millions",
                  fontSize: 12,
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w600,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor.withOpacity(0.1),
                        AppColors.primaryColor.withOpacity(0.05),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: CustomText(
                    "83,481 PKR",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        
        const SizedBox(width: 16),
        
        // Company Info Card
        Expanded(
          child: _build3DCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomText(
                  "ABL Assets Management\nCompany Limited",
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  textAlign: TextAlign.center,
                  color: Colors.grey[800],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Colors.blue.withOpacity(0.1),
                        Colors.blue.withOpacity(0.05),
                      ],
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Column(
                    children: [
                      CustomText(
                        "5",
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue[700],
                      ),
                      CustomText(
                        "Funds",
                        fontSize: 12,
                        color: Colors.blue[600],
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFundCard(int index) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.grey[50]!,
          ],
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Fund Title with badge
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryColor,
                        AppColors.primaryColor.withOpacity(0.8),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: CustomText(
                    "ABL Cash Fund",
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            
            const SizedBox(height: 24),
            
            // Fund Details Grid
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: Colors.grey[200]!,
                  width: 1,
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildInfoItem(
                          "Fund Size",
                          "69,598M",
                          Icons.account_balance_wallet,
                          Colors.blue,
                        ),
                        const SizedBox(height: 16),
                        _buildInfoItem(
                          "Front Load",
                          "0.75%",
                          Icons.trending_up,
                          Colors.orange,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    height: 60,
                    color: Colors.grey[300],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        _buildInfoItem(
                          "30 Days Return",
                          "9.93%",
                          Icons.show_chart,
                          Colors.green,
                          isReversed: true,
                        ),
                        const SizedBox(height: 16),
                        _buildInfoItem(
                          "Min Investment",
                          "Rs. 5,000",
                          Icons.savings,
                          Colors.purple,
                          isReversed: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Rating Section
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.green[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Colors.green[200]!,
                  width: 1,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/projects/good-feedback.png",
                    height: 40,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        "Risk Level",
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.green[700],
                      ),
                      CustomText(
                        "Recommended by experts",
                        fontSize: 12,
                        color: Colors.green[600],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            const SizedBox(height: 24),
            
            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: _build3DButton(
                    onPressed: () {},
                    text: "View Details",
                    backgroundColor: Colors.blue[600]!,
                    shadowColor: Colors.blue[300]!,
                    textColor: Colors.white,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _build3DButton(
                    onPressed: () {
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
                    text: "Invest Now",
                    backgroundColor: Colors.green[600]!,
                    shadowColor: Colors.green[300]!,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
    String label,
    String value,
    IconData icon,
    Color color, {
    bool isReversed = false,
  }) {
    return Column(
      crossAxisAlignment:
          isReversed ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!isReversed) ...[
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 4),
            ],
            CustomText(
              label,
              fontSize: 12,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
            if (isReversed) ...[
              const SizedBox(width: 4),
              Icon(icon, size: 16, color: color),
            ],
          ],
        ),
        const SizedBox(height: 4),
        CustomText(
          value,
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ],
    );
  }

  Widget _build3DCard({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.white,
            Colors.grey[50]!,
          ],
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  Widget _build3DButton({
    required VoidCallback onPressed,
    required String text,
    required Color backgroundColor,
    required Color shadowColor,
    required Color textColor,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.topCenter,
            colors: [
              backgroundColor,
              backgroundColor.withOpacity(0.8),
            ],
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.4),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
            BoxShadow(
              color: backgroundColor.withOpacity(0.2),
              blurRadius: 2,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Center(
          child: CustomText(
            text,
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }
}