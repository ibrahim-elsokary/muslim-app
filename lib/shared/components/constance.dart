import 'package:adhan/adhan.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_app/cubit/cubit.dart';

HijriCalendar today = HijriCalendar.now();

 Coordinates myCoordinates = Coordinates(Hive.box('myBox').get('latitude')??1, Hive.box('myBox').get('longitude')??2);
