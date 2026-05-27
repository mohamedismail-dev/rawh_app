import 'package:flutter/material.dart';
import 'package:rawh_app/core/app_colors.dart';
import 'package:rawh_app/core/app_text_style.dart';

class PraysSlider extends StatelessWidget {
  final dynamic pray;
  final String onlyTime;
  final String onlyPeriod;

  const PraysSlider({
    super.key,
    required this.pray,
    required this.onlyTime,
    required this.onlyPeriod,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1.0),
      child: Container(
        width: 138,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [AppColors.black, Color(0xffB19768)],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: .center,
          children: [
            Text("${pray.name}", style: AppTextStyle.bodysmallWhite),
            Text(
              "$onlyTime",
              style: AppTextStyle.bodysmallWhite.copyWith(fontSize: 31),
            ),
            Text("$onlyPeriod", style: AppTextStyle.bodysmallWhite),
          ],
        ),
      ),
    );
  }
}
