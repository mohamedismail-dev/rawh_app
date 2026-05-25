import 'package:flutter/services.dart';

class Hadith {
  final int number;
  final String title;
  final String body;

  Hadith({required this.title, required this.body, required this.number});
}

// للحديث الواحد - فضلها زي ما هي
Future<Hadith> loadHadith(int number) async {
  String response = await rootBundle.loadString(
    "assets/data/hadeeth/h$number.txt",
  );
  List<String> lines = response.split("\n");
  return Hadith(
    number: number,
    title: lines[0].trim(),
    body: lines.sublist(1).join("\n").trim(),
  );
}

// للـ 50 كلهم - ضيف دي
Future<List<Hadith>> loadAllHadiths() async {
  return await Future.wait(
    List.generate(50, (i) => loadHadith(i + 1)), // 👈 بتستخدم loadHadith نفسها
  );
}
