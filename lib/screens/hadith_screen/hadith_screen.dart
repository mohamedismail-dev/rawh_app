import 'package:flutter/material.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:islamic_app/data/hadith.dart';
import 'package:islamic_app/screens/hadith_screen/hadith_details_screen.dart';

class HadithScreen extends StatefulWidget {
  const HadithScreen({super.key});

  @override
  State<HadithScreen> createState() => _HadithScreenState();
}

class _HadithScreenState extends State<HadithScreen> {
  @override
  List<Hadith> hadiths = [];

  void initState() {
    super.initState();
    loadAllHadiths().then((value) {
      setState(() => hadiths = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        children: [
          Image.asset(
            "assets/images/vertical-shot-hassan-ii-mosque-casablanca-morocco.jpg",
            fit: .fitWidth,
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
          Padding(
            padding: const EdgeInsets.only(top: 32),
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
          Column(
            mainAxisAlignment: .end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: true,
                      enlargeFactor: 0.15,
                      viewportFraction: 0.75,
                      height: 520.0,
                    ),
                    items: hadiths.map((hadith) {
                      return Directionality(
                        textDirection: TextDirection.ltr,
                        child: Builder(
                          builder: (BuildContext context) {
                            return InkWell(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HadithDetailsScreen(
                                    title: hadith.title,
                                    bodyText: hadith.body,
                                    hadithNumber: hadith.number,
                                  ),
                                ),
                              ),
                              child: Container(
                                height: 620,
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 6.0),
                                decoration: BoxDecoration(
                                  color: AppColors.gold,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 8,
                                      ),
                                      child: Row(
                                        crossAxisAlignment: .center,
                                        mainAxisAlignment: .spaceBetween,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              "assets/images/img_left_corner.png",
                                              color: AppColors.black,
                                              width: width * 0.20,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 4,
                                            child: Text(
                                              hadith.title,
                                              textAlign: .center,
                                              style:
                                                  AppTextStyle.titelLargeBlack,
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Image.asset(
                                              "assets/images/img_right_corner.png",
                                              color: AppColors.black,
                                              width: width * 0.20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 4,
                                      child: Stack(
                                        alignment: .center,
                                        children: [
                                          Image.asset(
                                            "assets/images/HadithCardBackGround.png",
                                            color: AppColors.black.withOpacity(
                                              0.25,
                                            ),
                                            width: width * 0.6,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 16,
                                            ),
                                            child: Text(
                                              overflow: TextOverflow.fade,
                                              hadith.body,
                                              textAlign: .center,
                                              style:
                                                  AppTextStyle.bodysmallBlack,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: .end,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadiusGeometry.only(
                                                  bottomLeft: Radius.circular(
                                                    20,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    20,
                                                  ),
                                                ),
                                            child: Image.asset(
                                              "assets/images/Mosque-02.png",
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
