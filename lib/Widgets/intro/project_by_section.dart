import 'package:flutter/material.dart';

import '../../Utils/custome_text.dart';

class ProjectBySection extends StatelessWidget {
  const ProjectBySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.green[50]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CustomText("A Project By"),
                              Image.asset(
                                "assets/projects/project 1.png",
                                height: 50,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CustomText("Licensed by"),
                              Image.asset(
                                "assets/projects/project2.png",
                                height: 70,
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                      SizedBox(height: 15,),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              CustomText("Supported by"),
                              Image.asset(
                                "assets/projects/project3.png",
                                height: 70,
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              CustomText("Partnered by"),
                              Image.asset(
                                "assets/projects/project 4.png",
                                height: 50,
                              ),
                            ],
                          ),
                          
                        ],
                      ),
                      
                    ],
                  ),
                ),
              );
  }
}