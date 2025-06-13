import 'package:emlaak/Utils/colors.dart';
import 'package:emlaak/Widgets/intro/custome_register_btns.dart';
import 'package:flutter/material.dart';

import '../Utils/custome_text.dart';
import '../Widgets/CustomeDailog/custome_dailog.dart';
import '../Widgets/funds_screen/fund_info_colum.dart';

class FundDetailsScreen extends StatefulWidget {
  const FundDetailsScreen({super.key});

  @override
  State<FundDetailsScreen> createState() => _FundDetailsScreenState();
}

class _FundDetailsScreenState extends State<FundDetailsScreen> {
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

            // Top Row with Fund Info Widgets
            Padding(
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

            Padding(
              padding: EdgeInsets.all(16),
              child: Divider(color: Colors.grey, thickness: 1),
            ),

            SizedBox(height: 10),

            // Fund Details Container
            Container(
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
            ),
            SizedBox(height: 20),
            Container(
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
                      child: Image.asset(
                        "assets/banks/alhabib.png",
                        height: 60,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Fund Title
                    CustomText(
                      "Al Habib Funds",
                      fontSize: 16,
                      color: Colors.blue,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 8),
                    CustomText(
                      "Al Habib Islami Cash Fund",
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
                          value: "32,428 PKR",
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
                          value: "10.00%",
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
                          title: "1.5%",
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
                          title: "Rs 5000",
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
            ),
          ],
        ),
      ),
    );
  }
}
