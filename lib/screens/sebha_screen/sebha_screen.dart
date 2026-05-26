import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({super.key});

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int totalCount = 0;
  double rotation = 0;
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        alignment: .center,

        fit: .expand,
        children: [
          Image.asset(
            "assets/images/close-up-islamic-new-year-with-quran-books.jpg",
            fit: .cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.black.withOpacity(1.0),
                  AppColors.black.withOpacity(0.7),
                ],
                begin: AlignmentGeometry.bottomCenter,
                end: AlignmentGeometry.topCenter,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 0, bottom: 0),
                      child: Image.asset(
                        "assets/images/logo/Logo Rawh.png",
                        width: width * 0.65,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
                    style: TextStyle(
                      fontSize: 34,
                      color: AppColors.white,
                      fontFamily: "Janna",
                    ),
                  ),
                  SizedBox(height: hight * 0.15),
                ],
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    if (totalCount == 32 ||
                        totalCount == 65 ||
                        totalCount == 98) {
                      counter = -1;
                      rotation = rotation - 45;

                      if (totalCount == 98) {
                        totalCount = 0;
                        rotation = rotation - 90;
                      }
                    }
                    rotation += 11.52;

                    counter++;
                    totalCount++;
                  });
                },
                child: Stack(
                  alignment: .topCenter,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 44),
                      child: Image.asset(
                        "assets/images/sebha_tail.png",
                        width: width * 0.15,
                      ),
                    ),
                    Stack(
                      alignment: .center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60),
                          child: AnimatedRotation(
                            duration: Duration(milliseconds: 400),
                            turns: rotation / 360,
                            alignment: .center,
                            curve: Curves.easeOutBack,
                            child: Image.asset(
                              "assets/images/SebhaBody.png",
                              width: width * 0.85,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .center,
                          children: [
                            SizedBox(height: hight * 0.08),
                            Text(
                              totalCount <= 32
                                  ? "سبحان الله"
                                  : totalCount <= 65
                                  ? "الحمد الله"
                                  : totalCount <= 98
                                  ? "الله أكبر"
                                  : "سبحان الله",
                              style: TextStyle(
                                fontSize: 34,
                                color: AppColors.white,
                                fontFamily: "Janna",
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "$counter",
                              style: TextStyle(
                                fontSize: 34,
                                color: AppColors.white,
                                fontFamily: "Janna",
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
