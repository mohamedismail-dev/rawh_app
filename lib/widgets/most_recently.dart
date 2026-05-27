import 'package:flutter/material.dart';
import 'package:rawh_app/core/app_colors.dart';
import 'package:rawh_app/core/app_text_style.dart';

class MostRecently extends StatelessWidget {
  const MostRecently({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16),
      child: Container(
        height: 150,
        width: 260,
        decoration: BoxDecoration(
          color: AppColors.gold,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Column(
                crossAxisAlignment: .start,
                children: [
                  Text("Al-Fatiha", style: AppTextStyle.titelLargeBlack),
                  Text("الفاتحة", style: AppTextStyle.titelLargeBlack),
                  SizedBox(height: 20),
                  Text("7 Verses", style: AppTextStyle.bodysmallBlack),
                ],
              ),
              Expanded(child: Image.asset("assets/images/quranSura.png")),
            ],
          ),
        ),
      ),
    );
  }
}
