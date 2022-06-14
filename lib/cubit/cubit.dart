import 'dart:convert';


import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_compass/flutter_compass.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:muslim_app/cubit/states.dart';
import 'package:muslim_app/model/quran/azkar_model.dart';
import 'package:muslim_app/model/quran/quran_model_data.dart';
import 'package:muslim_app/module/homeScreen/home_screen.dart';
import 'package:muslim_app/module/prayScreen/qibla_screen.dart';
import 'package:muslim_app/module/quranPage/quran_page.dart';
import 'package:muslim_app/module/quranScreen/quran_screen.dart';
import 'package:muslim_app/module/tasbeehScreen/tasbeeh_screen.dart';
import 'package:muslim_app/network/remote/dio_helper.dart';
import 'package:muslim_app/shared/components/adhan.dart';
import 'package:location/location.dart';
import 'package:muslim_app/shared/components/constance.dart';


class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitState());
  static AppCubit get(context) => BlocProvider.of(context);
  //////
  QuranModel? quranModel;
  QuranModel? tafsirModel;

  Azkar? azkar;
  List<String>? azkarCategory;
  List<Widget> screens = [
    HomeScreen(),
    QuranScreen(),
    QuranPage(),
    TasbeehScreen(),
    QiblaScreen()
  ];
  late Box myBox = Hive.box('myBox');
  int index = 0;
  bool moreInfo = false;
  double indecatorValue = 0;
  Adhan adhan = Adhan(myCoordinates);
  //----locatoin variabels
  Location location = Location();
  bool? serviceEnabled;
  PermissionStatus? permissionGranted;
  LocationData? locationData;

//***** ************ */

  Stream<double?> getCompass() async* {
    double? x;
    await FlutterCompass.events?.single.then((value) {
      x = value.heading;
    });
    //return Future.delayed(Duration(seconds: 1),()=>x);
  }

  void getLocation() async {
    emit(AppGetLocationLoadingState());
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled!) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled!) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    await location.getLocation().then((value) {
      locationData = value;

      myBox.put('latitude', value.latitude);
      myBox.put('longitude', value.longitude);
      emit(AppGetLocationSuccessState());
    }).catchError((error) {
      AppGetLocationErrorState(error);
    });
  }

  void moredetail() {
    moreInfo = !moreInfo;
    emit(AppMoreInfoState());
  }

  String timer() {
    var x = Adhan(myCoordinates);
    Future.delayed(Duration(seconds: 1), () {
      Adhan _adhan = Adhan(myCoordinates);
      int _timerMax = _adhan
          .getTimes(_adhan.currentPray)
          .difference(_adhan.getTimes(_adhan.nextPray))
          .inSeconds
          .abs();

      //******مشكل كبير */
      int _timerCurrnt = _adhan.dif.inSeconds.abs();

      indecatorValue = 1 - (_timerCurrnt / _timerMax);
      emit(AppTimerState());
    });
    return '${Adhan(myCoordinates).dif.toString().split('.').first.padLeft(8, "0")}';
  }

  void changBottomNav(
    int cuurntIndex,
  ) {
    if (cuurntIndex == 2) {
      index = index;
    } else {
      index = cuurntIndex;
    }

    emit(AppCahngeBottomNavState());
  }

  void getquran() async {
    emit(AppGetQuranLoadingState());
    if (myBox.get('quran1') != null || myBox.get('tafseer') != null) {
      quranModel = myBox.get('quran1');
      tafsirModel = myBox.get('tafseer');
      emit(AppGetQuranSuccessState());
    } else {
      await DioHelper.getData(
        url: 'v1/quran/quran-uthmani',
      ).then((value) {
        quranModel = QuranModel.fromJson(value.data);
        DioHelper.getData(url: 'v1/quran/ar.muyassar').then((value) {
          emit(AppGetQuranSuccessState());

          tafsirModel = QuranModel.fromJson(value.data);
          myBox.put('quran1', quranModel);
          myBox.put('tafseer', tafsirModel);
        }).catchError((error) {
          emit(AppGetQuranErrorState(error.toString()));
          print(error);
        });
        if (kDebugMode) {
          print(tafsirModel?.data.surah[1].ayah[1]);
        }
        emit(AppGetQuranSuccessState());
      }).catchError((error) {
        emit(AppGetQuranErrorState(error.toString()));
      });
    }
  }

  Future<void> gatAzkar() async {
    final dynamic response = await rootBundle.loadString('assets/azkar.json');
    //print(response);
    final data = await json.decode(response);

    azkar = Azkar.fromJson(data);
    azkarCategory = azkar?.azkarCategory.toSet().toList();
  }

  List<Zekr> subAzker(String category) {
    List<Zekr> subAzker = [];
    azkar?.zekr.forEach((element) {
      if (element.category.toString() == category) {
        subAzker.add(element);
      }
    });

    return subAzker;
  }
}
