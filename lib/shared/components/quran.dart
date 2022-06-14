import 'dart:math';

import 'package:muslim_app/model/quran/quran_model_data.dart';

class QuranDetail {
  List<Page> pages = [];
  QuranDetail(QuranModel quran) {
    quran.data.surah.forEach((element1) {
      List<int> list = [];

      element1.ayah.forEach((element) {
        list.add(element.page.toInt());
      });
      list.toSet().forEach((element) {
        pages.add(Page(element, element1));
      });
    });
  }
}

class Page {
  late String name;
  late int surahNum;
  late int pageNum;
  late int hizpNum;
  late int juz;
  late int manzil;
  List<AyahData> ayah = [];
  Page(int pageNum, SurahData surah) {
    pageNum = pageNum;
    name = surah.arName.toString();
    surahNum = surah.number.toInt();
    
    surah.ayah.forEach((element) {
      if (element.page == pageNum) {
        hizpNum = element.hizbQuarter.toInt();
        juz = element.juz.toInt();
        manzil=element.manzil.toInt();
       
        ayah.add(element);
      }
    });
  }
}
