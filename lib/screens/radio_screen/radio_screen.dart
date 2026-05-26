import 'package:flutter/material.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';
import 'package:islamic_app/screens/radio_screen/tabs/radio_tab.dart';
import 'package:islamic_app/screens/radio_screen/tabs/reciters_tab.dart';

class RadioScreen extends StatefulWidget {
  RadioScreen({super.key});

  @override
  State<RadioScreen> createState() => _RadioScreenState();
}

class _RadioScreenState extends State<RadioScreen>
    with SingleTickerProviderStateMixin {
  @override
  late TabController controller;

  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

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
            "assets/images/silhouette-woman-reading-quran.jpg",
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  alignment: .center,
                  children: [
                    Container(
                      width: width * 0.9,
                      height: 49,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColors.black.withOpacity(0.7),
                      ),
                    ),
                    TabBar(
                      splashBorderRadius: BorderRadius.circular(20),

                      controller: controller,
                      indicatorColor: Colors.transparent,
                      dividerColor: Colors.transparent,
                      indicatorSize: .tab,
                      unselectedLabelColor: AppColors.white,
                      labelColor: AppColors.black,
                      labelStyle: AppTextStyle.bodysmallBlack,
                      indicator: BoxDecoration(
                        color: AppColors.gold,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      tabs: [
                        Tab(text: "Radio"),
                        Tab(text: "Reciters"),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: controller,
                  children: [RadioTab(), RecitersTab()],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
