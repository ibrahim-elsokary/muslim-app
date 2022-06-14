import 'package:hive/hive.dart';

part 'quran_model_data.g.dart';

@HiveType(typeId: 0)
class QuranModel extends HiveObject {
  @HiveField(0)
  late QuranData data;
  QuranModel();
  QuranModel.fromJson(Map<String, dynamic> json) {
    this.data = QuranData.fromJson(json['data']);
  }
}

@HiveType(typeId: 1)
class QuranData extends HiveObject {
  @HiveField(0)
  List<SurahData> surah = [];
  QuranData();
  QuranData.fromJson(Map<String, dynamic>? json) {
    json?['surahs'].forEach((element) {
      surah.add(SurahData.fromJson(element));
    });
  }
}

@HiveType(typeId: 2)
class SurahData extends HiveObject {
  @HiveField(0)
  late int number;
  @HiveField(1)
  late String arName;
  @HiveField(2)
  late String enName;
  @HiveField(3)
  late String enNameTranslation;
  @HiveField(4)
  late String revelationType;
  @HiveField(5)
  List<AyahData> ayah = [];
  SurahData();
  SurahData.fromJson(Map<String?, dynamic>? json) {
    number = json?['number'];
    arName = json?['name'];
    enName = json?['englishName'];
    enNameTranslation = json?['englishNameTranslation'];
    revelationType = json?['revelationType'];
    json?['ayahs'].forEach((element) {
      ayah.add(AyahData.fromJson(element));
    });
  }
}

@HiveType(typeId: 3)
class AyahData extends HiveObject {
  @HiveField(0)
  late int number;
  @HiveField(1)
  late String text;
  @HiveField(2)
  late int numberInSurah;
  @HiveField(3)
  late int juz;
  @HiveField(4)
  late int manzil;
  @HiveField(5)
  late int page;
  @HiveField(6)
  late int ruku;
  @HiveField(7)
  late int hizbQuarter;
  @HiveField(8)
  var sajda;
  AyahData();
  AyahData.fromJson(Map<String, dynamic>? json) {
    number = json?['number'];
    text = json?['text'];
    numberInSurah = json?['numberInSurah'];
    juz = json?['juz'];
    manzil = json?['manzil'];
    page = json?['page'];
    ruku = json?['ruku'];
    hizbQuarter = json?['hizbQuarter'];
    sajda = json?['sajda'];
  }
}
