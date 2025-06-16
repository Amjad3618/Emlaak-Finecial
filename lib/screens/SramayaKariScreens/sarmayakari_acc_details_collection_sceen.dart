import 'package:emlaak/Utils/custome_text.dart';
import 'package:flutter/material.dart';

import 'sarmayakari_acc_creation_phonenum_screen.dart';

class SarmayakariAccDetailsCollectionScreen extends StatefulWidget {
  const SarmayakariAccDetailsCollectionScreen({super.key});

  @override
  State<SarmayakariAccDetailsCollectionScreen> createState() =>
      _SarmayakariAccDetailsCollectionScreenState();
}

class _SarmayakariAccDetailsCollectionScreenState
    extends State<SarmayakariAccDetailsCollectionScreen> {
  
  // State variables for each selection
  String? selectedAge;
  String? selectedKnowledge;
  String? selectedSavings;
  String? selectedTimeHorizon;
  String? selectedObjective;
  String? selectedRiskLevel; // Added for risk level selection

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Enter Your Age Please"),
            const SizedBox(height: 24),
            _buildAgeSection(),
            _buildSectionDivider(),
            _buildSectionTitle("Investment Knowledge Level"),
            const SizedBox(height: 24),
            _buildKnowledgeSection(),
            _buildSectionDivider(),
            _buildSectionTitle("What portion of your Monthly Income do\nyou generally save?"),
            const SizedBox(height: 24),
            _buildSavingsSection(),
            _buildSectionDivider(),
            _buildSectionTitle("What is the time horizon of your\nInvestment?"),
            const SizedBox(height: 24),
            _buildTimeHorizonSection(),
            _buildSectionDivider(),
            _buildSectionTitle("What is your investment objective?"),
            const SizedBox(height: 24),
            _buildObjectiveSection(),
            _buildSectionDivider(),
            _buildSectionTitle("What is your risk tolerance?"),
            const SizedBox(height: 24),
            _buildRiskLevelSection(),
            const SizedBox(height: 32),
            _buildContinueButton(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
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
    );
  }

  Widget _buildSectionTitle(String title) {
    return CustomText(
      title,
      fontSize: 20,
      fontWeight: FontWeight.w600,
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSectionDivider() {
    return Column(
      children: [
        const SizedBox(height: 32),
        Divider(color: Colors.grey[300], thickness: 1),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildAgeSection() {
    final ageOptions = [
      {'value': '18-30', 'icon': Icons.person_outline},
      {'value': '31-40', 'icon': Icons.person},
      {'value': '41-50', 'icon': Icons.person_2},
      {'value': '60+', 'icon': Icons.elderly},
    ];

    return _buildOptionsRow(
      options: ageOptions,
      selectedValue: selectedAge,
      onChanged: (value) => setState(() => selectedAge = value),
    );
  }

  Widget _buildKnowledgeSection() {
    final knowledgeOptions = [
      {'value': 'No\nKnowledge', 'icon': Icons.help_outline},
      {'value': 'Limited\nKnowledge', 'icon': Icons.school_outlined},
      {'value': 'Average\nKnowledge', 'icon': Icons.psychology_outlined},
      {'value': 'Strong\nKnowledge', 'icon': Icons.engineering},
    ];

    return _buildOptionsRow(
      options: knowledgeOptions,
      selectedValue: selectedKnowledge,
      onChanged: (value) => setState(() => selectedKnowledge = value),
    );
  }

  Widget _buildSavingsSection() {
    final savingsOptions = [
      {'value': 'Below\n10%', 'icon': Icons.trending_down},
      {'value': '10%-20%', 'icon': Icons.trending_flat},
      {'value': '21%-30%', 'icon': Icons.trending_up},
      {'value': '31%-40%', 'icon': Icons.show_chart},
      {'value': 'Above 41%', 'icon': Icons.north},
    ];

    return _buildOptionsGrid(
      options: savingsOptions,
      selectedValue: selectedSavings,
      onChanged: (value) => setState(() => selectedSavings = value),
    );
  }

  Widget _buildTimeHorizonSection() {
    final timeOptions = [
      {'value': 'Less than\n6 months', 'icon': Icons.schedule},
      {'value': 'Less than\n1 year', 'icon': Icons.calendar_month},
      {'value': 'Less than\n2 years', 'icon': Icons.calendar_today},
      {'value': '3-5 years', 'icon': Icons.date_range},
      {'value': 'Over\n5 years', 'icon': Icons.timeline},
    ];

    return _buildOptionsGrid(
      options: timeOptions,
      selectedValue: selectedTimeHorizon,
      onChanged: (value) => setState(() => selectedTimeHorizon = value),
    );
  }

  Widget _buildRiskLevelSection() {
    final riskOptions = [
      {'value': 'Very Low Risk\nVery Low Return', 'icon': Icons.shield_outlined},
      {'value': 'Low Risk\nLow Return', 'icon': Icons.trending_down},
      {'value': 'Medium Risk\nMedium Return', 'icon': Icons.trending_flat},
      {'value': 'High Risk\nHigh Return', 'icon': Icons.trending_up},
    ];

    return _buildOptionsRow(
      options: riskOptions,
      selectedValue: selectedRiskLevel,
      onChanged: (value) => setState(() => selectedRiskLevel = value),
    );
  }

  Widget _buildObjectiveSection() {
    final objectiveOptions = [
      {'value': 'Capital\nProtected', 'icon': Icons.security},
      {'value': 'Income\nOriented', 'icon': Icons.attach_money},
      {'value': 'Income Plus\nGrowth', 'icon': Icons.trending_up},
      {'value': 'Growth\nFocused', 'icon': Icons.rocket_launch},
    ];

    return _buildOptionsRow(
      options: objectiveOptions,
      selectedValue: selectedObjective,
      onChanged: (value) => setState(() => selectedObjective = value),
    );
  }

  Widget _buildOptionsRow({
    required List<Map<String, dynamic>> options,
    required String? selectedValue,
    required Function(String) onChanged,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: options.map((option) => 
        _buildOptionCard(
          value: option['value'],
          icon: option['icon'],
          isSelected: selectedValue == option['value'],
          onTap: () => onChanged(option['value']),
        )
      ).toList(),
    );
  }

  Widget _buildOptionsGrid({
    required List<Map<String, dynamic>> options,
    required String? selectedValue,
    required Function(String) onChanged,
  }) {
    return Wrap(
      spacing: 12,
      runSpacing: 16,
      alignment: WrapAlignment.spaceEvenly,
      children: options.map((option) => 
        _buildOptionCard(
          value: option['value'],
          icon: option['icon'],
          isSelected: selectedValue == option['value'],
          onTap: () => onChanged(option['value']),
          width: 90,
        )
      ).toList(),
    );
  }

  Widget _buildOptionCard({
    required String value,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    double? width,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: width ?? 80,
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green.shade50 : Colors.white,
          border: Border.all(
            color: isSelected ? Colors.green : Colors.grey.shade300,
            width: isSelected ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 32,
              color: isSelected ? Colors.green : Colors.grey[600],
            ),
            const SizedBox(height: 8),
            CustomText(
              value,
              fontSize: 12,
              fontWeight: FontWeight.w500,
              textAlign: TextAlign.center,
              color: isSelected ? Colors.green.shade700 : Colors.grey[700],
            ),
            const SizedBox(height: 8),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: isSelected ? Colors.green : Colors.transparent,
                border: Border.all(
                  color: isSelected ? Colors.green : Colors.grey.shade400,
                  width: 2,
                ),
              ),
              child: isSelected
                  ? const Icon(
                      Icons.check,
                      size: 12,
                      color: Colors.white,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    final bool isFormComplete = selectedAge != null &&
        selectedKnowledge != null &&
        selectedSavings != null &&
        selectedTimeHorizon != null &&
        selectedObjective != null &&
        selectedRiskLevel != null;

    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: isFormComplete ? _handleContinue : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          disabledBackgroundColor: Colors.grey[300],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: isFormComplete ? 2 : 0,
        ),
        child: Text(
          'Continue',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isFormComplete ? Colors.white : Colors.grey[600],
          ),
        ),
      ),
    );
  }

  void _handleContinue() {
    // Handle form submission
    // ignore: unused_local_variable
    final profileData = {
      'age': selectedAge,
      'knowledge': selectedKnowledge,
      'savings': selectedSavings,
      'timeHorizon': selectedTimeHorizon,
      'objective': selectedObjective,
      'riskLevel': selectedRiskLevel,
    };
    
    // You can navigate to next screen or process the data
Navigator.push(context, MaterialPageRoute(builder: (_)=> SarmayakariAccCreationphoneNumberScreen()))   ;
    // Example: Navigate to next screen
    // Navigator.pushNamed(context, '/next-screen', arguments: profileData);
  }
}