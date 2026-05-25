import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/core/app_text_style.dart';
import 'package:islamic_app/data/surah.dart';
import 'package:islamic_app/screens/quran%20_screen/surah_details_screen.dart';

class SurasList extends StatefulWidget {
  final int index;

  final int num;

  const SurasList(this.index, {super.key, required this.num});

  @override
  State<SurasList> createState() => _SurasListState();
}

class _SurasListState extends State<SurasList> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SurahDetailsScreen(num: widget.num),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 23),
        child: Row(
          children: [
            Stack(
              alignment: .center,
              children: [
                SvgPicture.asset("assets/icons/img_sur_number_frame.svg"),
                Text(
                  "${SurasInfo.allSurahs[widget.num].number}",
                  style: AppTextStyle.bodysmallWhite,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: .start,
                children: [
                  Text(
                    SurasInfo.allSurahs[widget.num].englishName,
                    style: AppTextStyle.bodyLargeWhite,
                  ),
                  Text(
                    "${SurasInfo.allSurahs[widget.num].ayatCount} Verses",
                    style: AppTextStyle.bodysmallWhite,
                  ),
                ],
              ),
            ),
            Spacer(),
            Row(
              children: [
                Text(
                  SurasInfo.allSurahs[widget.num].name,
                  style: AppTextStyle.bodyLargeWhite,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
