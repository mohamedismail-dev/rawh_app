import 'package:flutter/material.dart';
//import 'package:timezone/data/latest.dart' as tzdata;

import 'package:rawh_app/events_screens/ramadan_splash_screen.dart';
import 'package:timezone/data/latest.dart' as tz;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RamadanSplashScreen(),
    );
  }
}
