

import 'package:hive_flutter/adapters.dart';
@HiveType(typeId: 4)
class User extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late List<FavSurah> favSurah=[];
  @HiveField(2)
  late List<FavAzkar> favAzkar=[];
  @HiveField(3)
  late List<BookMarks> bookMarks=[];
}

@HiveType(typeId: 5)
class FavSurah extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;

  
}


@HiveType(typeId: 5)
class FavAzkar extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;

  
}


@HiveType(typeId: 6)
class BookMarks extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}


@HiveType(typeId: 7)
class Takhteem extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}


@HiveType(typeId: 8)
class ByManzil extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}

@HiveType(typeId: 9)
class Manzil extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}

@HiveType(typeId: 10)
class ByJuz extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}

@HiveType(typeId: 11)
class Juz extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}

@HiveType(typeId: 12)
class ByHizp extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}

@HiveType(typeId: 13)
class Hizp extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}


@HiveType(typeId: 14)
class PrayingTracking extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}

@HiveType(typeId: 15)
class Pray extends HiveObject{
  @HiveField(0)
  late String name;
  @HiveField(1)
  late int page;
  @HiveField(2)
  late int numOfSurah ;
  @HiveField(3)
  late double position;
  
}