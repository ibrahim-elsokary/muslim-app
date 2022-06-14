import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:muslim_app/cubit/cubit.dart';
import 'package:muslim_app/cubit/states.dart';
import 'package:muslim_app/shared/components/adhan.dart';
import 'package:muslim_app/shared/components/components.dart';
import 'package:muslim_app/shared/components/constance.dart';
import 'package:muslim_app/style/my_icons_icons.dart';
import 'package:muslim_app/style/style.dart';



class HomeScreen extends StatelessWidget {
  Widget item(context,
      {String? text,
      IconData? icon,
      Function()? onTap,
      required Color? color}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: primaryColor,
                size: 50,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(text.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .headline6
                        ?.copyWith(color: Colors.grey.shade600)),
              )
            ],
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30), color: color),
        ),
      ),
    );
  }

  Widget listItem({String text1 = 'text1', String text2 = 'text2'}) {
    return Container(
      width: 100,
      height: 80,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(15),
        color: seconderyColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            MyIcons.pray,
            color: primaryColor,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(text1),
          Text(text2),
        ],
      ),
    );
  }

  Widget imageLayer() {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 6,
              child: Container(
                width: double.infinity,
                child: ClipRRect(
                  child: ImageFiltered(
                    imageFilter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                    child: Image.asset(
                      'assets/images/10.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              )),
          Expanded(flex: 5, child: Container()),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        Adhan _adhan = AppCubit.get(context).adhan;
        return Stack(
          children: [
            //--------- image layer
            imageLayer(),
            Column(children: [
              //---------top section
              Expanded(
                flex: 5,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //******app bar */
                      SafeArea(
                        top: true,
                        child: appBar(context,
                            firstIcon: Icons.favorite,
                            seconedIcon: Icons.menu_rounded,
                            iconColor: primaryColor,
                            textColor: Colors.white,
                            shadow: true,
                            onPressedFirstIcon: () {},
                            onPressedSeconedIcon: () {}),
                      ),

                      //******top section elements */
                      Padding(
                        padding: const EdgeInsets.all(25.0),
                        child: StreamBuilder(
                            stream:
                                Stream.periodic(const Duration(seconds: 10)),
                            builder: (context, snapshot) {
                              
                              //AppCubit.get(context).getCompass().listen((event) {print(event);});
                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        decoration: const BoxDecoration(
                                          shape: BoxShape.circle,
                                        ),
                                        height: 120,
                                        width: 120,
                                        child: CircularProgressIndicator(
                                          value: AppCubit.get(context)
                                              .indecatorValue
                                              .abs(),
                                          strokeWidth: 8,
                                          backgroundColor: Colors.white,
                                          color: primaryColor,
                                        ),
                                      ),
                                      Text(
                                        AppCubit.get(context).timer(),
                                        style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            shadows: [
                                               Shadow(
                                                blurRadius: 20.0,
                                                color: Colors.black26,
                                                offset: Offset(0, 4.0),
                                              )
                                            ]),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      Text(
                                          Adhan(myCoordinates).arabicNames[
                                              Adhan(myCoordinates).nextPray],
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 30,
                                            shadows: [
                                              const Shadow(
                                                blurRadius: 20.0,
                                                color: Colors.black26,
                                                offset: const Offset(0, 4.0),
                                              ),
                                            ],
                                          )),
                                      Text(
                                          DateFormat('jm').format(
                                              Adhan(myCoordinates).getTimes(
                                                  Adhan(myCoordinates)
                                                      .nextPray)), //
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 30,
                                            shadows: [
                                              const Shadow(
                                                blurRadius: 20.0,
                                                color: Colors.black26,
                                                offset:  Offset(0, 4.0),
                                              ),
                                            ],
                                          )),
                                      Text('مكة المكرمة',
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3
                                              ?.copyWith(
                                            color: Colors.white,
                                            fontSize: 30,
                                            shadows: [
                                              const Shadow(
                                                blurRadius: 20.0,
                                                color: Colors.black26,
                                                offset:  Offset(0, 4.0),
                                              ),
                                            ],
                                          )),
                                    ],
                                  ),
                                ],
                              );
                            }),
                      ),
                      //--------list
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 0, vertical: 15),
                          child: ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => listItem(
                                  text1: _adhan.arabicNames[_adhan.pray[index]],
                                  text2: DateFormat('Hm').format(
                                      _adhan.getTimes(_adhan.pray[index]))),
                              separatorBuilder: (context, index) => const SizedBox(
                                    width: 10,
                                  ),
                              itemCount: 6),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              //--------bottom section
              Expanded(
                flex: 5,
                child: Container(
                  width: width,
                  decoration: const BoxDecoration(
                    borderRadius:
                         BorderRadius.vertical(top: Radius.circular(40)),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    reverse: false,
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 10,
                          margin: const EdgeInsets.symmetric(vertical: 25),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey.shade300),
                        ),
                        SizedBox(
                          height: height / 2.3,
                          child: Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Column(
                              children: [
                                Expanded(
                                  child: Row(
                                    children: [
                                      item(
                                        context,
                                        color: seconderyColor,
                                        icon: MyIcons.quran,
                                        text: 'القران الكريم',
                                        onTap: () {
                                          AppCubit.get(context)
                                              .changBottomNav(1);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      item(
                                        context,
                                        color: seconderyColor,
                                        icon: MyIcons.pray,
                                        text: 'الصلاة',
                                        onTap: () {

                                        },
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Expanded(
                                  child: Row(
                                    children: [
                                      item(
                                        context,
                                        color: seconderyColor,
                                        icon: MyIcons.quibla,
                                        text: 'القبلة',
                                        onTap: () {
                                          AppCubit.get(context)
                                              .changBottomNav(4);
                                        },
                                      ),
                                      const SizedBox(
                                        width: 30,
                                      ),
                                      item(
                                        context,
                                        color: seconderyColor,
                                        icon: MyIcons.seabha,
                                        text: 'الأذكار',
                                        onTap: () {
                                          AppCubit.get(context)
                                              .changBottomNav(3);
                                        },
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ])
          ],
        );
      },
    );
  }
}
