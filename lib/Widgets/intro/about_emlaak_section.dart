import 'package:flutter/material.dart';

import '../../Utils/colors.dart';
import '../../Utils/custome_text.dart';

class AboutEmlaakSection extends StatelessWidget {
  const AboutEmlaakSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.green[50]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      CustomText(
                        "ABOUT EMLAAK FINACIAL",
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColor,
                      ),
                      CustomText(
                        "Emlaak Financials is a venture of ITMinds Limited, a wholly-owned subsidiary of the Central Depository Company of Pakistan (CDC). Since ITMinds' inception in 2009, it has been actively involved in the development and implementation of state of the art business automation systems for both the local and international Capital Markets. In 2013, ITMinds also added a Business Process Outsourcing unit in its service portfolio and has been actively providing Back Office Services to the Mutual Funds as well as Retirement Benefit Schemes of various Corporate Companies of Pakistan. Research and state of the art technology are the hallmarks of its commitment to service, par excellence.",fontSize: 16,fontWeight: FontWeight.bold,
                      ),
                    ],
                  ),
                ),
              );
  }
}