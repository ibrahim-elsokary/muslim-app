import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/cubit/cubit.dart';
import 'package:muslim_app/cubit/states.dart';
import 'package:muslim_app/model/quran/quran_model.dart';
import 'package:muslim_app/model/quran/quran_model_data.dart';
import 'package:muslim_app/shared/components/components.dart';
import 'package:muslim_app/style/style.dart';


class QuranPage extends StatelessWidget {
  static int? s;

  @override
  Widget build(BuildContext context) {
    QuranModel? model = AppCubit.get(context).quranModel;
    QuranModel? tafseer = AppCubit.get(context).tafsirModel;
    List<InlineSpan> ayahs = [];
    ScrollController scroll = ScrollController();
    double? p;

    TapGestureRecognizer menu(element) {
      return TapGestureRecognizer()
        ..onTapUp = (t) {
          showMenu(
              context: context,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              position: RelativeRect.fromLTRB(
                t.globalPosition.dx,
                t.globalPosition.dy + 20,
                t.globalPosition.dx,
                t.globalPosition.dy,
              ),
              items: [
                PopupMenuItem(
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      child: Text(
                        tafseer!.data.surah[s!].ayah[element.numberInSurah - 1]
                            .text.toString(),
                      ),
                    ),
                  ),
                ),
                PopupMenuItem(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          p = t.localPosition.dy + 50;
                        },
                        icon: Icon(Icons.bookmark)),
                    IconButton(
                        onPressed: () {
                          scroll.animateTo(p!,
                              duration: Duration(seconds: 1),
                              curve: Curves.easeInOut);
                        },
                        icon: Icon(Icons.multitrack_audio))
                  ],
                ))
              ]);
        };
    }

    model?.data.surah[s!].ayah.forEach((element) {
      ayahs.add(TextSpan(
        children: [
          element.numberInSurah == 1 && model.data.surah[s!].number != 9
              ? TextSpan(
                  text: element.text.substring(38), recognizer: menu(element))
              : TextSpan(text: element.text, recognizer: menu(element)),
          if (element.sajda == true)
            TextSpan(
                text: ' \u06e9',
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Uthmanic', color: primaryColor)),
          TextSpan(children: [
            TextSpan(
                text: ' \ufd7b',
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Uthmanic', color: primaryColor)),
            TextSpan(
                text: '${element.numberInSurah}',
                style: TextStyle(
                    fontSize: 22,
                    fontFamily: 'MADDINA',
                    fontWeight: FontWeight.bold,
                    color: primaryColor)),
            TextSpan(
                text: '\ufd7a ',
                style: TextStyle(
                    fontSize: 22, fontFamily: 'Uthmanic', color: primaryColor))
          ])
        ],
      ));
    });
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            top: true,
            child: Column(
              children: [
                appBar(
                  context,
                  firstIcon: Icons.arrow_back_ios_new_rounded,
                  textColor: Colors.grey.shade600,
                  seconedIcon: Icons.menu,
                  iconColor: primaryColor,
                  onPressedFirstIcon: () {
                    Navigator.pop(context);
                  },
                  onPressedSeconedIcon: () {},
                ),
                Expanded(
                  child: SingleChildScrollView(
                    controller: scroll,
                    physics: BouncingScrollPhysics(),
                    child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          children: [
                            Text(
                              'بِسْمِ ٱللّٰهِ ٱلرَّحْمٰنِ ٱلرَّحِيمِ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: primaryColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  height: 3),
                            ),
                            Text.rich(
                              TextSpan(children: ayahs),
                              key: key,

                              softWrap: true,
                              textAlign: TextAlign.start,
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  height: 2,
                                  fontSize: 22,
                                  fontFamily: 'MADDINA'),
                              //   locale: Locale('ar'),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
