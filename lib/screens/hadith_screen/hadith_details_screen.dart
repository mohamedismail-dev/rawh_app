import 'package:flutter/material.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';
import 'package:islamic_app/data/hadith.dart';

class HadithDetailsScreen extends StatefulWidget {
  final String title;
  final String bodyText;
  final int hadithNumber;

  const HadithDetailsScreen({
    super.key,
    required this.title,
    required this.bodyText,
    required this.hadithNumber,
  });

  @override
  State<HadithDetailsScreen> createState() => _HadithDetailsScreenState();
}

class _HadithDetailsScreenState extends State<HadithDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        foregroundColor: AppColors.gold,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
        centerTitle: true,
        title: Text(
          "Hadith ${widget.hadithNumber}",
          style: AppTextStyle.bodyLargeGold,
        ),
      ),
      body: Column(
        mainAxisAlignment: .center,
        crossAxisAlignment: .center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/img_left_corner.png",
                    width: width * 0.20,
                  ),
                ),
                Text("${widget.title}", style: AppTextStyle.titelLarge),
                Expanded(
                  child: Image.asset(
                    "assets/images/img_right_corner.png",
                    width: width * 0.20,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.5),
                child: Text(
                  textAlign: .center,
                  "${widget.bodyText}",
                  style: AppTextStyle.bodyLargeGold,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 0,
            child: Image.asset("assets/images/Mosque-02.png", fit: .fitWidth),
          ),
        ],
      ),
    );
  }
}
