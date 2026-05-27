import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:rawh_app/screens/on_bording.dart';

class RamadanSplashScreen extends StatefulWidget {
  const RamadanSplashScreen({super.key});

  @override
  State<RamadanSplashScreen> createState() => _RamadanSplashScreenState();
}

class _RamadanSplashScreenState extends State<RamadanSplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 2001), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => OnBording()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        alignment: .center,
        children: [
          Image.asset(
            "assets/images/background.png",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 57, bottom: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Image.asset(
                    "assets/images/Mosque-01.png",
                    width: width * 0.65,
                  ).animate().shimmer(duration: 2000.ms),
                ),
                Expanded(
                  child:
                      Image.asset(
                            "assets/images/logo/Logo Rawh.png",
                            width: width * 0.65,
                          )
                          .animate()
                          .scale(
                            begin: const Offset(1.3, 1.3),
                            end: const Offset(1.0, 1.0),
                            duration: 1800.ms,
                            curve: Curves.easeOutCubic,
                          )
                          .shimmer(duration: 2000.ms),
                ),
                Expanded(child: SizedBox(height: 30)),
              ],
            ),
          ),
          Positioned(
            right: 16,
            top: 0,
            child: Image.asset("assets/images/Glow.png", width: width * 0.20)
                .animate()
                .moveY(
                  begin: -200,
                  end: 0,
                  duration: 1200.ms,
                  curve: Curves.easeInOut,
                ),
          ),
          Positioned(
            right: 0,
            bottom: 90,
            child:
                Image.asset(
                  "assets/images/Shape-04.png",
                  width: width * 0.20,
                ).animate().moveX(
                  begin: 200,
                  end: 0,
                  duration: 1200.ms,
                  curve: Curves.easeInOut,
                ),
          ),
          Positioned(
            left: 0,
            top: 230,
            child:
                Image.asset(
                  "assets/images/Shape-07.png",
                  width: width * 0.20,
                ).animate().moveX(
                  begin: -200,
                  end: 0,
                  duration: 1200.ms,
                  curve: Curves.easeInOut,
                ),
          ),
        ],
      ),
    );
  }
}
