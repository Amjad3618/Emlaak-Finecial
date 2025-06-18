import 'package:emlaak/Utils/custome_text.dart';
import 'package:emlaak/screens/SramayaKariScreens/sarmayakari_acc_details_collection_sceen.dart';
import 'package:flutter/material.dart';

import '../../Widgets/CustomeDailog/custome_dailog.dart';
import '../../Widgets/intro/expand_tile.dart';
import '../Sahulat_Sramayakari_screen/sahulat_sarmayakari_acc_screen.dart';

class SahulatAnadSarmayakariPackagesScreen extends StatefulWidget {
  const SahulatAnadSarmayakariPackagesScreen({super.key});

  @override
  State<SahulatAnadSarmayakariPackagesScreen> createState() => _SahulatAnadSarmayakariPackagesScreenState();
}

class _SahulatAnadSarmayakariPackagesScreenState extends State<SahulatAnadSarmayakariPackagesScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _fadeAnimations;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    
    // Create staggered fade animations
    _fadeAnimations = List.generate(4, (index) {
      return Tween<double>(begin: 0.0, end: 1.0).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(index * 0.2, 0.8 + index * 0.05, curve: Curves.easeOut),
        ),
      );
    });
    
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildAnimatedWidget(Widget child, int index) {
    return FadeTransition(
      opacity: _fadeAnimations[index],
      child: SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, 0.3),
          end: Offset.zero,
        ).animate(_fadeAnimations[index]),
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
        ),
        title: SizedBox(
          height: 40,
          child: Image.asset("assets/logo.png", fit: BoxFit.contain),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Animated Header Section
              _buildAnimatedWidget(
                Center(
                  child: Column(
                    children: [
                      CustomText(
                        "Al Meezan Islamic Cash Fund",
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                      const SizedBox(height: 8),
                      Container(
                        width: 60,
                        height: 3,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                ),
                0,
              ),
              const SizedBox(height: 32),

              // Animated Select Option Section
              _buildAnimatedWidget(
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "Select Account Type",
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 8),
                    CustomText(
                      "Choose the account type that best suits your investment preferences and requirements.",
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ],
                ),
                1,
              ),
              const SizedBox(height: 24),

              // Animated First Account Card
              _buildAnimatedWidget(
                _buildAccountCard(
                  title: "Sahulat Sarmayakari Account",
                  gradient: const LinearGradient(
                    colors: [Colors.blue, Colors.blue],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  features: [
                    ("Maximum Transaction Limit", "Rs 400,000"),
                    ("Annual Investment Limit", "Rs 800,000"),
                    ("Maximum Investment Limit", "Rs 1,000,000"),
                  ],
                  documents: ["No Documents Required"],
                  buttonColor: Colors.blue,
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SahulatSarmayakariAccScreen(),
                    ),
                  ),
                ),
                2,
              ),
              const SizedBox(height: 20),

              // Animated Second Account Card
              _buildAnimatedWidget(
                _buildAccountCard(
                  title: "Sarmayakari Account",
                  gradient: const LinearGradient(
                    colors: [Color(0xFF4CAF50), Color(0xFF66BB6A)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  features: [
                    ("No Transaction Limit", ""),
                    ("No Annual Investment Limit", ""),
                    ("No Maximum Investment Limit", ""),
                  ],
                  documents: [
                    "proof of income or accupation",
                    "CZ50 zakat form if applicable",
                    "W9 form for US citizens"
                  ],
                  buttonColor: const Color(0xFF4CAF50),
                  onPressed: () => showCustomDialog(
                    context: context,
                    title: '',
                    content: 'Currently resident Pakistani can Only Invest in this account.',
                    titleColor: Colors.black,
                    primaryButtonText: 'Next',
                    secondaryButtonText: 'Cancel',
                    primaryButtonColor: Colors.green,
                    secondaryButtonColor: Colors.grey.shade300,
                    secondaryTextColor: Colors.black87,
                    onPrimaryPressed: () => 
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SarmayakariAccDetailsCollectionScreen(),
                      ),
                    ),
                  ),
                ),
                3,
              ),
              const SizedBox(height: 20),

              // Contact Section (no animation to keep it simple)
              CustomExpandableTile(
                imagePath: "assets/projects/contact.png",
                title: "Contact",
                description: "Call Center: 0800 - 23275O verseas Callers: + (9221) 34326038 WA: 03489-365225 (03489-Emlaak)info@emlaakfinancials.com ",
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountCard({
    required String title,
    required LinearGradient gradient,
    required List<(String, String)> features,
    required List<String> documents,
    required Color buttonColor,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.2), width: 5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            child: Center(
              child: CustomText(
                title,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          // Content
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionHeader("Key Features", Icons.star_outline),
                const SizedBox(height: 12),
                ...features.map((f) => _buildFeatureItem(f.$1, f.$2)),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey, thickness: 0.5),
                const SizedBox(height: 20),
                _buildSectionHeader("Payment Options", Icons.payment),
                const SizedBox(height: 12),
                _buildPaymentOption("IBFT/Raast"),
                const SizedBox(height: 20),
                const Divider(color: Colors.grey, thickness: 0.5),
                const SizedBox(height: 20),
                _buildSectionHeader("Document Requirements", Icons.description_outlined),
                const SizedBox(height: 12),
                ...documents.map((doc) => 
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: _buildDocumentItem(doc),
                  ),
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: onPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonColor,
                      foregroundColor: Colors.white,
                      elevation: 2,
                      shadowColor: buttonColor.withOpacity(0.3),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.account_balance_wallet_outlined, size: 20),
                        const SizedBox(width: 8),
                        CustomText(
                          "Open Account",
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(icon, color: Colors.green, size: 20),
        const SizedBox(width: 8),
        CustomText(title, fontSize: 16, fontWeight: FontWeight.w600, color: Colors.black87),
      ],
    );
  }

  Widget _buildFeatureItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Container(
            width: 6, height: 6,
            decoration: const BoxDecoration(color: Colors.green, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: const TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                children: [
                  TextSpan(text: "$label: "),
                  TextSpan(text: value, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.black87)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPaymentOption(String option) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.account_balance, color: Colors.green, size: 16),
        ),
        const SizedBox(width: 12),
        CustomText(option, fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
      ],
    );
  }

  Widget _buildDocumentItem(String document) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: const Icon(Icons.check_circle_outline, color: Colors.green, size: 16),
        ),
        const SizedBox(width: 12),
        CustomText(document, fontSize: 14, fontWeight: FontWeight.w500, color: Colors.black87),
      ],
    );
  }
}