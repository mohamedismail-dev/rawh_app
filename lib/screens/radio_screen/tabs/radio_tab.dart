import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';

class RadioTab extends StatelessWidget {
  const RadioTab({super.key});

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(top: 1),
      itemBuilder: (context, index) {
        return Container(
          alignment: .center,
          margin: EdgeInsets.only(top: 16, left: 20, right: 20),
          height: 133,
          width: 390,
          child: Stack(
            alignment: .center,
            children: [
              Positioned(
                bottom: 0,
                child: ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(20),
                  child: Image.asset(
                    "assets/images/Mosque-02.png",
                    color: AppColors.black.withOpacity(0.2),
                    width: width * 0.9,
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: .center,
                children: [
                  Text(
                    "texttttt",
                    textAlign: .center,
                    style: AppTextStyle.bodyLargeBlack,
                  ),
                  SizedBox(height: 32),
                  Row(
                    mainAxisAlignment: .center,
                    children: [
                      Expanded(child: SizedBox(width: 15)),

                      Expanded(
                        flex: 5,
                        child: Row(
                          mainAxisAlignment: .center,
                          children: [
                            SvgPicture.asset("assets/icons/Polygon.svg"),
                            SizedBox(width: 20),
                            SvgPicture.asset("assets/icons/Volume High.svg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
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
