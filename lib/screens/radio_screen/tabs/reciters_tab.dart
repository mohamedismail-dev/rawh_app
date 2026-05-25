import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';

class RecitersTab extends StatelessWidget {
  const RecitersTab({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      padding: EdgeInsets.only(top: 1),
      itemBuilder: (context, index) {
        return Container(
          alignment: .center,
          margin: EdgeInsets.only(top: 16, left: 20, right: 20),
          height: 133,
          width: 390,
          child: Column(
            mainAxisAlignment: .center,
            children: [
              Text(
                "texttttt",
                textAlign: .center,
                style: AppTextStyle.bodyLargeBlack,
              ),
              SizedBox(height: 24),
              Row(
                mainAxisAlignment: .center,
                children: [SvgPicture.asset("assets/icons/Polygon.svg")],
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColors.gold,
          ),
        );
      },
    );
  }
}
