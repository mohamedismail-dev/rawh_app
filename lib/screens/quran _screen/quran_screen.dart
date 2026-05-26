import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';
import 'package:islamic_app/data/surah.dart';
import 'package:islamic_app/widgets/most_recently.dart';
import 'package:islamic_app/widgets/suras_list.dart';

class QuranScreen extends StatefulWidget {
  const QuranScreen({super.key});

  @override
  State<QuranScreen> createState() => _QuranScreenState();
}

class _QuranScreenState extends State<QuranScreen> {
  TextEditingController controller = TextEditingController();
  List filteredSurahs = SurasInfo.allSurahs;
  bool isSearching = false;
  void filterSurahs(String query) {
    setState(() {
      isSearching = query.isNotEmpty;
      if (query.isEmpty) {
        filteredSurahs = SurasInfo.allSurahs; // لو الـ search فاضي رجع الكل
      } else {
        filteredSurahs = SurasInfo.allSurahs.where((surah) {
          String surahName = surah.englishName.toLowerCase().replaceAll(
            "-",
            "",
          );
          String searchQuery = query.toLowerCase().replaceAll("-", "");

          return surahName.contains(searchQuery) // انجليزي
              ||
              surah.name.contains(query); // عربي
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        fit: .expand,
        children: [
          Image.asset("assets/images/taj-mahal-agra-india.jpg", fit: .cover),
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
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: .center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 28, bottom: 28),
                      child: Image.asset(
                        "assets/images/logo/Logo Rawh.png",
                        width: width * 0.65,
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                    controller: controller,
                    onChanged: (value) {
                      filterSurahs(value);
                    },

                    style: TextStyle(color: AppColors.offWhite),
                    cursorColor: AppColors.gold,
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: SvgPicture.asset(
                          "assets/icons/quran-svgrepo-com.svg",
                          width: 28,
                          color: AppColors.gold,
                        ),
                      ),
                      hintText: "Sura Name",
                      hintStyle: AppTextStyle.titelMedOff,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: AppColors.gold),
                      ),
                      fillColor: AppColors.black.withOpacity(0.7),
                      filled: true,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(width: 1, color: AppColors.gold),
                      ),
                    ),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: isSearching
                      ? EdgeInsets.symmetric(vertical: 0, horizontal: 16)
                      : EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: .start,
                    children: [
                      isSearching
                          ? SizedBox(height: 0.1)
                          : Text(
                              "Most Recently",
                              style: AppTextStyle.titelMedOff,
                            ),
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: isSearching
                    ? SizedBox(height: 0.1)
                    : SizedBox(
                        height: hight * 0.18,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,

                          itemBuilder: (context, index) {
                            return MostRecently();
                          },
                        ),
                      ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: .start,
                    children: [
                      isSearching
                          ? SizedBox(height: 0.1)
                          : Text("Suras List", style: AppTextStyle.titelMedOff),
                    ],
                  ),
                ),
              ),
              SliverList.separated(
                itemCount: filteredSurahs.length,
                itemBuilder: (context, index) {
                  int num = SurasInfo.allSurahs.indexOf(filteredSurahs[index]);
                  return SurasList(num: num, index);
                },
                separatorBuilder: (context, index) {
                  return Divider(
                    color: AppColors.gray,
                    height: 16,
                    indent: 66,
                    thickness: 1,
                    endIndent: 66,
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
