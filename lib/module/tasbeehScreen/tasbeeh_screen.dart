import 'dart:ui';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:muslim_app/cubit/cubit.dart';
import 'package:muslim_app/model/quran/quran_model_data.dart';
import 'package:muslim_app/module/tasbeehPage/tasbeeh_page.dart';
import 'package:muslim_app/shared/components/components.dart';
import 'package:muslim_app/style/my_icons_icons.dart';
import 'package:muslim_app/style/style.dart';

class TasbeehScreen extends StatelessWidget {
  const TasbeehScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List? azkarCategory = AppCubit.get(context).azkarCategory;
    return Column(
      children: [
        SafeArea(
          top: true,
          child: appBar(context,
              textColor: Colors.grey.shade600,
              firstIcon: Icons.favorite,
              seconedIcon: Icons.menu_rounded,
              iconColor: primaryColor,
              onPressedFirstIcon: () {},
              onPressedSeconedIcon: () {}),
        ),
        Stack(
          alignment: Alignment.centerRight,
          //#49C5AA
          //#3E917E
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  
                ),
                width: double.infinity,
                height: 180,
                child: ClipRRect(
                      child: ImageFiltered(
                        imageFilter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                        child: Image.asset(
                          'assets/images/2.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              width: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'مساعد التختيم',
                    style: Theme.of(context).textTheme.headline5?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 20.0,
                            color: Colors.black38,
                            offset: Offset(0, 4.0),
                          ),
                        ]),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '75%',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 20.0,
                                color: Colors.black38,
                                offset: Offset(0, 4.0),
                              ),
                            ]),
                      ),
                      Text(
                        'باقي 44 سوة',
                        style: Theme.of(context).textTheme.subtitle1?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            shadows: [
                              Shadow(
                                blurRadius: 20.0,
                                color: Colors.black38,
                                offset: Offset(0, 4.0),
                              ),
                            ]),
                      )
                    ],
                  ),
                  Container(
                      height: 20,
                      width: 200,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: LinearProgressIndicator(
                        value: 0.75,
                        backgroundColor: Colors.white,
                        color: Colors.blue.shade100,
                      )),
                ],
              ),
            ),
          ],
        ),
        ConditionalBuilder(
          condition: azkarCategory!=null,
          builder: (context) => Expanded(
            child: ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => listItem(
                      context,
                      text1: azkarCategory?[index],
                      icon: MyIcons.seabha,
                      onTap: () {
                        TasbeehPage.s = azkarCategory?[index];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => TasbeehPage(),
                            ));
                      },
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemCount: azkarCategory!.length),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator(color: primaryColor,)),
        )
      ],
    );
  }
}
