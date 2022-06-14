import 'package:adhan/adhan.dart';


class Adhan {
  late PrayerTimes prayerTimes;
  CalculationParameters? params;
  late DateTime fajr;
  late DateTime sunrise;
  late DateTime dhuhr;
  late DateTime asr;
  late DateTime maghrib;
  late DateTime isha;
  late String nextPray;
  late String currentPray;
  late Duration dif;
  late Qibla qibla;


  Map arabicNames = {
    'fajr': 'صلاة الفجر',
    'dhuhr': 'صلاة الظهر',
    'sunrise': 'صلاة الشروق',
    'asr': 'صلاة العصر',
    'maghrib': 'صلاة المغرب',
    'isha': 'صلاة العشاء'
  };
  List<String> pray = ['fajr', 'sunrise', 'dhuhr', 'asr', 'maghrib', 'isha'];
  DateTime getTimes(String pray) {
    Map times = {
      'fajr': fajr,
      'dhuhr': dhuhr,
      'asr': asr,
      'maghrib': maghrib,
      'isha': isha,
      'sunrise': sunrise
    };

    return times[pray];
  }

  Adhan(Coordinates myCoordinates) {
    params = CalculationMethod.muslim_world_league.getParameters();
    params?.madhab = Madhab.shafi;
    prayerTimes = PrayerTimes.today(myCoordinates, params!);
    fajr = prayerTimes.fajr; //prayerTimes.fajr;
    sunrise = prayerTimes.sunrise;
    dhuhr = prayerTimes.dhuhr;
    asr = prayerTimes.asr;
    maghrib = prayerTimes.maghrib;
    isha = prayerTimes.isha;
    qibla = Qibla(myCoordinates);

    if (PrayerTimes.today(myCoordinates, params!).nextPrayer().name.isEmpty ||
        PrayerTimes.today(myCoordinates, params!).nextPrayer().name == 'none') {
      nextPray = 'fajr';

      dif = prayerTimes.fajr.add(Duration(days: 1)).difference(DateTime.now());
    } else {
      nextPray = PrayerTimes.today(myCoordinates, params!).nextPrayer().name;
      dif = getTimes(nextPray).difference(DateTime.now());
    }

    if (PrayerTimes.today(myCoordinates, params!)
            .currentPrayer()
            .name
            .isEmpty ||
        PrayerTimes.today(myCoordinates, params!).currentPrayer().name ==
            'none') {
      currentPray = 'isha';
    } else {
      currentPray =
          PrayerTimes.today(myCoordinates, params!).currentPrayer().name;
    }
  }
}
