import 'package:flutter/material.dart';
import 'package:rawh_app/core/app_colors.dart';
import 'package:rawh_app/core/app_text_style.dart';
import 'package:rawh_app/screens/home_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBording extends StatefulWidget {
  const OnBording({super.key});

  @override
  State<OnBording> createState() => _OnBordingState();
}

final PageController _pageController = PageController();
int pageNum = 0;

class _OnBordingState extends State<OnBording> {
  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: .center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 28, bottom: 48),
                child: Image.asset(
                  "assets/images/logo/Logo Rawh.png",
                  width: width * 0.65,
                ),
              ),
            ],
          ),

          SizedBox(
            height: hight * 0.44,
            child: PageView.builder(
              controller: _pageController,
              itemCount: 5,
              onPageChanged: (index) {
                setState(() {
                  pageNum = index;
                });
              },
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/onbording/welcome_$index.png",

                        width: index == 0 || index == 1
                            ? width * 0.85
                            : index == 4
                            ? width * 0.50
                            : width * 0.65,

                        fit: .cover,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          pageNum == 0
              ? Column(
                  children: [
                    SizedBox(height: hight * 0.065),
                    Text(
                      textAlign: .center,

                      "Welcome To Rawh App",
                      style: AppTextStyle.titelLarge,
                    ),
                  ],
                )
              : pageNum == 1
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text("Welcome To Rawh", style: AppTextStyle.titelLarge),
                      SizedBox(height: hight * 0.04),
                      Text(
                        textAlign: .center,

                        "We Are Very Excited To Have You In Our Community",
                        style: AppTextStyle.bodyLargeGold,
                      ),
                    ],
                  ),
                )
              : pageNum == 2
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  child: Column(
                    children: [
                      Text("Reading the Quran", style: AppTextStyle.titelLarge),
                      SizedBox(height: hight * 0.04),
                      Text(
                        textAlign: .center,

                        "Read, and your Lord is the Most Generous",
                        style: AppTextStyle.bodyLargeGold,
                      ),
                    ],
                  ),
                )
              : pageNum == 3
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text("Bearish", style: AppTextStyle.titelLarge),
                      SizedBox(height: hight * 0.04),
                      Text(
                        textAlign: .center,

                        "Praise the name of your Lord, the Most High",
                        style: AppTextStyle.bodyLargeGold,
                      ),
                    ],
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      Text("Holy Quran Radio", style: AppTextStyle.titelLarge),
                      SizedBox(height: hight * 0.04),
                      Text(
                        textAlign: .center,

                        "You can listen to the Holy Quran Radio through the application for free and easily",
                        style: AppTextStyle.bodyLargeGold,
                      ),
                    ],
                  ),
                ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Stack(
                alignment: .center,
                fit: .expand,
                children: [
                  Positioned(
                    left: 0,
                    bottom: 0,

                    child: TextButton(
                      style: TextButton.styleFrom(
                        overlayColor: pageNum >= 1
                            ? AppColors.gray.withAlpha(125)
                            : Colors.transparent,
                      ),
                      onPressed: () {
                        if (pageNum >= 1) {
                          _pageController.previousPage(
                            duration: Duration(milliseconds: 800),
                            curve: Curves.decelerate,
                          );
                        }
                      },
                      child: Text(
                        "Back",
                        style: pageNum > 0
                            ? AppTextStyle.bodyLargeGold.copyWith(fontSize: 16)
                            : TextStyle(color: AppColors.black),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: 5,
                      axisDirection: .horizontal,

                      effect: ExpandingDotsEffect(
                        dotColor: AppColors.gray,
                        activeDotColor: AppColors.gold,
                        dotHeight: 8,
                        dotWidth: 8,
                        expansionFactor: 2.5,
                      ),
                    ),
                  ),
                  pageNum < 4
                      ? Positioned(
                          bottom: 0,
                          right: 4,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: AppColors.gray.withAlpha(125),
                            ),
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 800),
                                curve: Curves.decelerate,
                              );
                            },
                            child: Text(
                              "Next",
                              style: AppTextStyle.bodyLargeGold.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        )
                      : Positioned(
                          bottom: 0,
                          right: 4,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              overlayColor: AppColors.gray.withAlpha(125),
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            },
                            child: Text(
                              "Finish",
                              style: AppTextStyle.bodyLargeGold.copyWith(
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
