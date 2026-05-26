import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:islamic_app/core/app_colors.dart';
import 'package:islamic_app/core/app_text_style.dart';
import 'package:adhan_dart/adhan_dart.dart';
import 'package:islamic_app/screens/time_screen/azan_data.dart';
import 'package:islamic_app/screens/time_screen/prays_items.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:islamic_app/screens/time_screen/prays_slider.dart';

class TimeScreen extends StatefulWidget {
  TimeScreen({super.key});

  @override
  State<TimeScreen> createState() => _TimeScreenState();
}

class _TimeScreenState extends State<TimeScreen> {
  AzanData? azanData;
  Timer? timer;
  List<PraysItems> prays = [];
  final player = AudioPlayer();
  bool active = false;
  bool isTapped = false;
  int lastCalculatedIndex = -1;

  String countdownText = "00:00:00";

  CarouselSliderController controller = CarouselSliderController();

  void _loadPrays() {
    azanData = AzanData();
    prays = [
      PraysItems(name: "Fajr", time: azanData!.fajrTime),
      PraysItems(name: "Sun Rise", time: azanData!.sunriseTime),
      PraysItems(name: "Dhuhr", time: azanData!.dhuhrTime),
      PraysItems(name: "Asr", time: azanData!.asrTime),
      PraysItems(name: "Maghrib", time: azanData!.maghribTime),
      PraysItems(name: "Isha", time: azanData!.ishaTime),
    ];
  }

  void _goToCurrentPage() {
    final currentPray = azanData!.current;
    int index = _getIndexFromPrayer(currentPray);
    lastCalculatedIndex = index;
    controller.animateToPage(index);
  }

  Future<void> playerAudio() async {
    await player.play(AssetSource("audio/azan_audio.mp3"));
  }

  int _getIndexFromPrayer(Prayer? prayer) {
    if (prayer == Prayer.fajr) return 0;
    if (prayer == Prayer.sunrise) return 1;
    if (prayer == Prayer.dhuhr) return 2;
    if (prayer == Prayer.asr) return 3;
    if (prayer == Prayer.maghrib) return 4;
    if (prayer == Prayer.isha) return 5;
    return 0;
  }

  void _checkAndUpdateCurrentPrayerPage() {
    final currentPray = azanData!.current;
    int currentIndex = _getIndexFromPrayer(currentPray);

    if (currentIndex != lastCalculatedIndex) {
      lastCalculatedIndex = currentIndex;
      controller.animateToPage(
        currentIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void initState() {
    super.initState();
    _loadPrays();

    WidgetsBinding.instance.addPostFrameCallback((_) => _goToCurrentPage());

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      DateTime now = DateTime.now();

      azanData = AzanData();
      Duration difference = azanData!.nextPrayerTime!.difference(now);

      if (difference.inHours == 0 &&
          difference.inMinutes == 0 &&
          difference.inSeconds == 0) {
        if (!isTapped) {
          playerAudio();
        }
      }

      setState(() {
        countdownText =
            "${difference.inHours.toString().padLeft(2, '0')}:${(difference.inMinutes % 60).toString().padLeft(2, '0')}:${(difference.inSeconds % 60).toString().padLeft(2, '0')}";
      });

      _checkAndUpdateCurrentPrayerPage();
    });
  }

  @override
  void dispose() {
    player.dispose();
    timer?.cancel();
    super.dispose();
  }

  (String time, String period) formatTimeParts(DateTime time) {
    int hour = time.hour;
    int minute = time.minute;
    String period = hour >= 12 ? "PM" : "AM";
    hour = hour % 12;
    if (hour == 0) hour = 12;
    return (
      "${hour.toString().padLeft(2, '0')}:${minute.toString().padLeft(2, '0')}",
      period,
    );
  }

  @override
  Widget build(BuildContext context) {
    var hight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    //----------------------
    DateTime now = DateTime.now();
    Duration difference = azanData!.nextPrayerTime!.difference(now);
    //----------------------
    String dayName = DateFormat('EEEE').format(now);
    String melyadeDate = DateFormat('dd,MMM,yyyy').format(now);
    //----------------------
    var todayHijri = HijriCalendar.now();
    var hijriDate =
        "${todayHijri.hDay.toString().padLeft(2, '0')} ${todayHijri.getLongMonthName().substring(0, 3)}, ${todayHijri.hYear}";

    return Scaffold(
      backgroundColor: AppColors.black,
      body: Stack(
        fit: .expand,
        children: [
          Image.asset("assets/images/taj-mahal-agra-india 1.png", fit: .cover),
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: .center,
              children: [
                Expanded(
                  child: CustomScrollView(
                    scrollDirection: Axis.vertical,
                    slivers: [
                      SliverToBoxAdapter(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 32),
                          child: Row(
                            mainAxisAlignment: .center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: 0,
                                  bottom: 8,
                                ),
                                child: Image.asset(
                                  "assets/images/logo/Logo Rawh.png",
                                  width: width * 0.65,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Stack(
                          alignment: .center,
                          children: [
                            Container(
                              height: hight * 0.37,
                              width: width * 0.895,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color(0xff856B3F),
                              ),
                            ),
                            Column(
                              children: [
                                Stack(
                                  alignment: .center,
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/cust_shape.svg",
                                      color: AppColors.gold,
                                      height: hight * 0.09,
                                      fit: BoxFit.cover,
                                      width: width * 0.19,
                                    ),
                                    Row(
                                      mainAxisAlignment: .spaceAround,
                                      crossAxisAlignment: .center,
                                      children: [
                                        SizedBox(
                                          width: 50,
                                          child: Text(
                                            "$melyadeDate",
                                            style: AppTextStyle.bodysmallWhite,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 20,
                                          ),
                                          child: Column(
                                            children: [
                                              Text(
                                                "Pray Time",
                                                textAlign: .center,
                                                style: AppTextStyle
                                                    .bodyLargeBlack
                                                    .copyWith(
                                                      color: AppColors.black
                                                          .withOpacity(0.71),
                                                    ),
                                              ),
                                              Text(
                                                "$dayName",
                                                textAlign: .center,
                                                style: AppTextStyle
                                                    .bodyLargeBlack
                                                    .copyWith(
                                                      color: AppColors.black
                                                          .withOpacity(0.9),
                                                    ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 55,
                                          child: Text(
                                            "$hijriDate",
                                            style: AppTextStyle.bodysmallWhite,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),

                                Row(
                                  mainAxisAlignment: .center,

                                  children: [
                                    Container(
                                      height: hight * 0.28,
                                      width: width * 0.895,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(37),
                                        color: AppColors.gold,
                                      ),
                                      child: Column(
                                        children: [
                                          SizedBox(height: 30),
                                          CarouselSlider.builder(
                                            carouselController: controller,

                                            itemCount: prays.length,
                                            itemBuilder:
                                                (context, index, realIndex) {
                                                  final pray = prays[index];
                                                  final (
                                                    onlyTime,
                                                    onlyPeriod,
                                                  ) = formatTimeParts(
                                                    pray.time,
                                                  );
                                                  return PraysSlider(
                                                    onlyPeriod: onlyPeriod,
                                                    onlyTime: onlyTime,
                                                    pray: pray,
                                                  );
                                                },
                                            options: CarouselOptions(
                                              reverse: true,
                                              padEnds: true,
                                              height: 130,
                                              aspectRatio: 16 / 9,
                                              enlargeStrategy:
                                                  CenterPageEnlargeStrategy
                                                      .scale,
                                              enlargeCenterPage: true,
                                              enlargeFactor: 0.18,
                                              viewportFraction: 0.29,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 34,
                                            ),

                                            child: Row(
                                              mainAxisAlignment: .center,
                                              children: [
                                                Spacer(flex: 2),
                                                Text(
                                                  "Next Pray - ",
                                                  style: AppTextStyle
                                                      .titelMedBlack
                                                      .copyWith(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                      ),
                                                ),
                                                Text(
                                                  "${difference.inHours.toString().padLeft(2, '0')}:${(difference.inMinutes % 60).toString().padLeft(2, '0')}:${(difference.inSeconds % 60).toString().padLeft(2, '0')}",
                                                  style: AppTextStyle
                                                      .titelMedBlack,
                                                ),
                                                Spacer(),
                                                InkWell(
                                                  onTap: () {
                                                    playerAudio();
                                                    setState(() {
                                                      isTapped = !active;
                                                      active = isTapped;
                                                      debugPrint(
                                                        isTapped.toString(),
                                                      );
                                                    });
                                                  },
                                                  child: SvgPicture.asset(
                                                    isTapped
                                                        ? "assets/icons/iconsax-volume-slash 1.svg"
                                                        : "assets/icons/iconsax-volume-high 1.svg",
                                                    width: 28,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: .start,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 10),
                                Text(
                                  "Azkar",
                                  style: AppTextStyle.bodysmallWhite,
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SliverGrid.builder(
                        itemCount: 4,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.8,
                        ),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: hight * 0.35,
                              width: width * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: AppColors.black,
                                border: Border.all(
                                  width: 2,
                                  color: AppColors.gold,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: .center,
                                children: [
                                  Image.asset(
                                    "assets/images/azkar/Illustration_${index + 1}.png",
                                  ),
                                  Text(
                                    index == 0
                                        ? "Evening Azkar"
                                        : index == 1
                                        ? "Morning Azkar"
                                        : index == 2
                                        ? "Waking Azkar"
                                        : "Sleeping Azkar",
                                    style: AppTextStyle.bodyLargeWhite,
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
