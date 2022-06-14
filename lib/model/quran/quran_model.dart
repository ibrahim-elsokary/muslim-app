


class Surah {
  int? id;
  String? name;
  String? englishName;
  String? revelationType;
  Ayaha? ayah;


}


class Ayaha {

  int? id;
  String? text;
  String? tafsir;
  int? numberInSurah;
  int? juz;
  int? manzil;
  int? page;
  int? hizbQuarter;
  bool? sajda;
}
