import 'package:animated_rotation/animated_rotation.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_app/cubit/cubit.dart';

import 'package:muslim_app/layout/main_screen/main_screen.dart';
import 'package:muslim_app/model/quran/quran_model_data.dart';
import 'package:muslim_app/network/remote/dio_helper.dart';
import 'package:muslim_app/shared/components/adhan.dart';
import 'package:muslim_app/shared/components/quran.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:flutter/services.dart';
import 'network/local/bloc_observer.dart';
import 'package:adhan/adhan.dart';




void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 // print(Adhan(Coordinates(29.986386, 31.177973)).qibla.direction );
  // FlutterCompass.events?.listen((event){print(event);});
    
  
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(QuranModelAdapter());
  Hive.registerAdapter(QuranDataAdapter());
  Hive.registerAdapter(SurahDataAdapter());
  Hive.registerAdapter(AyahDataAdapter());
  HijriCalendar.setLocal('ar');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  DioHelper.init();
  await Hive.openBox('myBox');
  //print(QuranDetail(Hive.box('myBox').get('quran1')).pages[659].juz);
 
 
 // print(Hive.box('myBox').get('latitude'));
  Bloc.observer = MyBlocObserver();
  runApp(const MuslimApp());
}

class MuslimApp extends StatelessWidget {
  const MuslimApp({Key? key}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        if (Hive.box('myBox').isNotEmpty) {
          return AppCubit()..gatAzkar()..getquran();
        } else {
          return AppCubit()..getquran()..getLocation()..gatAzkar();
        }
      },
      child: MaterialApp(
        theme: ThemeData(
            fontFamily: 'Tajawal',
            splashColor: Colors.transparent,
            textTheme:
                TextTheme(headline3: TextStyle(fontWeight: FontWeight.w600))),
        debugShowCheckedModeBanner: false,
        title: 'Muslim App',
        home: MainScreen(),
      ),
    );
  }
}
