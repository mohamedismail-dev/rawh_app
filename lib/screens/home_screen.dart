import 'package:flutter/material.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/screens/hadith_screen/hadith_screen.dart';
import 'package:islamic_app/screens/quran%20_screen/quran_screen.dart';
import 'package:islamic_app/screens/radio_screen/radio_screen.dart';
import 'package:islamic_app/screens/sebha_screen/sebha_screen.dart';
import 'package:islamic_app/screens/time_screen/time_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0;

  late PageController _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
      AssetImage("assets/images/taj-mahal-agra-india.jpg"),
      context,
    );
  }

  final List<Widget> screens = [
    QuranScreen(),
    HadithScreen(),
    SebhaScreen(),
    RadioScreen(),
    TimeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: PageView(
        controller: _pageController,
        children: screens,
        onPageChanged: (value) => setState(() {
          index = value;
        }),
      ),

      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          overlayColor: WidgetStateColor.resolveWith((states) {
            return Colors.transparent;
          }),
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            return AppTextStyle.bodysmallWhite;
          }),
        ),
        child: NavigationBar(
          selectedIndex: index,
          onDestinationSelected: (value) {
            setState(() {
              index = value;
            });
            _pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 800),
              curve: Curves.decelerate,
            );
          },

          height: 70,
          backgroundColor: AppColors.gold,

          // ignore: deprecated_member_use
          indicatorColor: AppColors.black.withOpacity(0.6),
          destinations: [
            NavigationDestination(
              icon: Padding(
                padding: index != 0
                    ? const EdgeInsets.only(top: 28)
                    : const EdgeInsets.only(top: 6),
                child: SvgPicture.asset(
                  "assets/icons/quran-svgrepo-com.svg",
                  width: 24,
                ),
              ),

              label: index == 0 ? "Quran" : "",

              selectedIcon: SvgPicture.asset(
                "assets/icons/quran-svgrepo-com.svg",
                color: AppColors.white,
                width: 24,
              ),
            ),
            NavigationDestination(
              icon: Padding(
                padding: index != 1
                    ? const EdgeInsets.only(top: 28)
                    : EdgeInsets.only(top: 6),
                child: SvgPicture.asset(
                  "assets/icons/ic_hadeth.svg",
                  width: 24,
                ),
              ),
              label: index == 1 ? "Hadith" : "",
              selectedIcon: SvgPicture.asset(
                "assets/icons/ic_hadeth.svg",
                color: AppColors.white,
                width: 24,
              ),
            ),
            NavigationDestination(
              icon: Padding(
                padding: index != 2
                    ? const EdgeInsets.only(top: 28)
                    : EdgeInsets.only(top: 6),
                child: SvgPicture.asset("assets/icons/ic_sebha.svg", width: 24),
              ),
              label: index == 2 ? "Sebha" : "",
              selectedIcon: SvgPicture.asset(
                "assets/icons/ic_sebha.svg",
                color: AppColors.white,
                width: 24,
              ),
            ),
            NavigationDestination(
              icon: Padding(
                padding: index != 3
                    ? const EdgeInsets.only(top: 28)
                    : EdgeInsets.only(top: 6),
                child: SvgPicture.asset("assets/icons/ic_radio.svg", width: 30),
              ),
              label: index == 3 ? "Radio" : "",
              selectedIcon: SvgPicture.asset(
                "assets/icons/ic_radio.svg",
                color: AppColors.white,
                width: 30,
              ),
            ),
            NavigationDestination(
              icon: Padding(
                padding: index != 4
                    ? const EdgeInsets.only(top: 28)
                    : EdgeInsets.only(top: 6),
                child: SvgPicture.asset("assets/icons/ic_time.svg", width: 24),
              ),
              label: index == 4 ? "Time" : "",
              selectedIcon: SvgPicture.asset(
                "assets/icons/ic_time.svg",
                color: AppColors.white,
                width: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
