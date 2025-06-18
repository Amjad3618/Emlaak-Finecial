import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Widgets/home/home_drawer.dart';
import 'package:emlaak/screens/Amc_and_Category_screen/AMC/amc_screen.dart';
import 'package:emlaak/screens/Amc_and_Category_screen/category/category_screen.dart';
import 'package:flutter/material.dart';

class TapBarScreen extends StatefulWidget {
  const TapBarScreen({super.key});

  @override
  State<TapBarScreen> createState() => _TapBarScreenState();
}

class _TapBarScreenState extends State<TapBarScreen> with TickerProviderStateMixin {
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

  int _selectedTabIndex = 0;
  final PageController _pageController = PageController();

  // Tab configuration
  final List<TabItem> _tabs = [
    TabItem(title: "Category", icon: Icons.category),
    TabItem(title: "AMC", icon: Icons.business),
  ];

  void _onTabSelected(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      drawer: const HomeDrawer(),
      body: AnimatedBuilder(
        animation: _animationController,
        builder: (context, child) {
          return Transform.translate(
            offset: Offset(0, _slideAnimation.value),
            child: Opacity(
              opacity: _fadeAnimation.value,
              child: Column(
                children: [_buildTabBar(), Expanded(child: _buildPageView())],
              ),
            ),
          );
        },
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: true,
      title: SizedBox(
        height: 50,
        child: Image.asset("assets/logo.png", fit: BoxFit.contain),
      ),
      elevation: 0,
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        children:
            _tabs.asMap().entries.map((entry) {
              final index = entry.key;
              final tab = entry.value;
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                    right: index < _tabs.length - 1 ? 12 : 0,
                  ),
                  child: _buildTabButton(tab, index),
                ),
              );
            }).toList(),
      ),
    );
  }

  Widget _buildTabButton(TabItem tab, int index) {
    final isSelected = _selectedTabIndex == index;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      height: 48,
      child: ElevatedButton(
        onPressed: () => _onTabSelected(index),
        style: ElevatedButton.styleFrom(
          backgroundColor:
              isSelected
                  ? AppColors.primaryColor
                  : Colors.white, // Unselected buttons are white
          foregroundColor:
              isSelected
                  ? Colors
                      .white // White text/icon on green background
                  : Colors.black87, // Dark text/icon on white background
          elevation: isSelected ? 4 : 2,
          shadowColor:
              isSelected
                  ? AppColors.primaryColor
                  : Colors.grey.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: isSelected ? Colors.green : Colors.grey.withOpacity(0.3),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(tab.icon, size: 18),
            const SizedBox(width: 8),
            Text(
              tab.title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPageView() {
    return PageView(
      controller: _pageController,
      onPageChanged: _onPageChanged,
      children: const [CategoryScreen(), AmcScreen()],
    );
  }
}

// Supporting Classes
class TabItem {
  final String title;
  final IconData icon;

  const TabItem({required this.title, required this.icon});
}
