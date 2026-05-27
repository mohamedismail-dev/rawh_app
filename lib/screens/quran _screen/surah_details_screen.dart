import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rawh_app/core/app_colors.dart';
import 'package:rawh_app/core/app_text_style.dart';
import 'package:rawh_app/data/surah.dart';

class SurahDetailsScreen extends StatefulWidget {
  final int num;

  const SurahDetailsScreen({super.key, required this.num});

  @override
  State<SurahDetailsScreen> createState() => _SurahDetailsScreenState();
}

class _SurahDetailsScreenState extends State<SurahDetailsScreen> {
  String surahText = "";
  Future getData() async {
    String response;
    response = await rootBundle.loadString(
      "assets/data/suras/${SurasInfo.allSurahs[widget.num].number}.txt",
    );
    List<String> lines = response.split("\n");
    String result = "";
    int versesNum = 1;

    for (String line in lines) {
      if (line.trim().isNotEmpty) {
        result += "${line.trim()} [$versesNum] ";
        versesNum++;
      }
    }

    setState(() {
      surahText = result;
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
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
          SurasInfo.allSurahs[widget.num].englishName,
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
                Image.asset(
                  "assets/images/img_left_corner.png",
                  width: width * 0.20,
                ),
                Text(
                  SurasInfo.allSurahs[widget.num].name,

                  style: AppTextStyle.titelLarge,
                ),
                Image.asset(
                  "assets/images/img_right_corner.png",
                  width: width * 0.20,
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
                  surahText,
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
