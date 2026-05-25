import 'package:timezone/timezone.dart' as tz;
import 'package:adhan_dart/adhan_dart.dart';

class AzanData {
  late DateTime date;
  late Coordinates coordinates;
  late CalculationParameters params;
  late PrayerTimes prayerTimes;
  late SunnahTimes sunnahTimes;

  late DateTime fajrTime;
  late DateTime sunriseTime;
  late DateTime dhuhrTime;
  late DateTime asrTime;
  late DateTime maghribTime;
  late DateTime ishaTime;

  late Prayer current;
  late Prayer next;

  late DateTime? currentPrayerTime;
  late DateTime? nextPrayerTime;

  late DateTime middleOfTheNight;
  late DateTime lastThirdOfTheNight;
  late double qiblaDirection;

  AzanData() {
    final location = tz.getLocation('Africa/Cairo');

    date = tz.TZDateTime.now(location);

    coordinates = const Coordinates(30.0444, 31.2357);

    params = CalculationMethodParameters.egyptian();
    params.madhab = Madhab.shafi;
    //----تم تقليل لكل صلاه 1 دقيقه لتتناسب مع المعاد الحقيقي لكل صلاه -----
    params.adjustments[Prayer.fajr] = -1;
    params.adjustments[Prayer.sunrise] = -1;
    params.adjustments[Prayer.dhuhr] = -1;
    params.adjustments[Prayer.asr] = -1;
    params.adjustments[Prayer.maghrib] = -1;
    params.adjustments[Prayer.isha] = -1;

    prayerTimes = PrayerTimes(
      coordinates: coordinates,
      date: date,
      calculationParameters: params,
      precision: true,
    );

    fajrTime = tz.TZDateTime.from(prayerTimes.fajr, location);
    sunriseTime = tz.TZDateTime.from(prayerTimes.sunrise, location);
    dhuhrTime = tz.TZDateTime.from(prayerTimes.dhuhr, location);
    asrTime = tz.TZDateTime.from(prayerTimes.asr, location);
    maghribTime = tz.TZDateTime.from(prayerTimes.maghrib, location);
    ishaTime = tz.TZDateTime.from(prayerTimes.isha, location);

    current = prayerTimes.currentPrayer(date: DateTime.now());
    next = prayerTimes.nextPrayer();

    currentPrayerTime = prayerTimes.timeForPrayer(current);
    nextPrayerTime = prayerTimes.timeForPrayer(next);

    sunnahTimes = SunnahTimes(prayerTimes);

    middleOfTheNight = tz.TZDateTime.from(
      sunnahTimes.middleOfTheNight,
      location,
    );
    lastThirdOfTheNight = tz.TZDateTime.from(
      sunnahTimes.lastThirdOfTheNight,
      location,
    );

    qiblaDirection = Qibla.qibla(coordinates);
  }
}
