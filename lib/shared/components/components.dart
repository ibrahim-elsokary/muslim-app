import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:muslim_app/style/my_icons_icons.dart';
import 'package:muslim_app/style/style.dart';

import 'constance.dart';

Widget appBar(context,
    {required IconData firstIcon,
    required IconData seconedIcon,
    required Color iconColor,
    required Color textColor,
    bool shadow = false,
    required void Function()? onPressedFirstIcon,
    required void Function()? onPressedSeconedIcon}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  if (shadow)
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.black26,
                      offset: Offset(0, 4.0),
                    )
                ]),
            child: IconButton(
                onPressed: onPressedFirstIcon,
                icon: Icon(
                  firstIcon,
                  color: Colors.white,
                ))),
        Text('${today.toFormat('dd / MMMM / yyyy')}',
            style: Theme.of(context)
                .textTheme
                .headline6
                ?.copyWith(fontSize: 24, color: textColor, shadows: [
              if (shadow)
                Shadow(
                  blurRadius: 10.0,
                  color: Colors.black45,
                  offset: Offset(0, 4.0),
                )
            ])),
        Container(
            decoration: BoxDecoration(
                color: iconColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  if (shadow)
                    BoxShadow(
                      blurRadius: 20.0,
                      color: Colors.black26,
                      offset: Offset(0, 4.0),
                    )
                ]),
            child: IconButton(
                onPressed: onPressedSeconedIcon,
                icon: Icon(
                  seconedIcon,
                  color: Colors.white,
                ))),
      ],
    ),
  );
}

Widget listItem(context,
    {required String text1,
    String? text2,
    String? text3,
    void Function()? onTap,
    bool additionalText = false,
    required IconData icon}) {
  return InkWell(
    onTap: onTap,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(20),
        shadowColor: Colors.grey.shade100,
        elevation: 1,
        child: Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: seconderyColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  icon,
                  color: primaryColor,
                  size: 50,
                ),
                SizedBox(
                  width: 30,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          //Expanded(flex: 1,child: Container()),
                          IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: additionalColor,
                            ),
                            onPressed: () {},
                          ),
                          Expanded(
                            flex: 5,
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                text1,
                                textAlign: TextAlign.start,
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.grey.shade600),
                              ),
                            ),
                          ),
                        ],
                      ),
                      if (additionalText == true)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              text3.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6
                                  ?.copyWith(color: Colors.grey.shade600),
                            ),
                            Directionality(
                              textDirection: TextDirection.rtl,
                              child: Text(
                                'عدد الايات $text2',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    ?.copyWith(color: Colors.grey.shade600),
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}

const Map<String, String> revelationType = {
  'Meccan': 'مكية',
  'Medinan': 'مدنية'
};
