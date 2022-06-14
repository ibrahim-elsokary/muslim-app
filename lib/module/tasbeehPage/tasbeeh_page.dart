import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:muslim_app/cubit/cubit.dart';
import 'package:muslim_app/cubit/states.dart';
import 'package:muslim_app/model/quran/azkar_model.dart';

import 'package:muslim_app/shared/components/components.dart';
import 'package:muslim_app/style/style.dart';

class TasbeehPage extends StatelessWidget {
  static String? s;
  
  Widget item(
    context, {
    required int index,
    required List<Zekr> azkar,
    
  }) {
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: InkWell(
            onTap: () {
              
              
              AppCubit.get(context).moredetail();
              
            },
            child: Column(
              children: [
                Text(
                  azkar[index].zekr.toString(),
                  style: TextStyle(fontSize: 18, height: 2),
                ),
                if (AppCubit.get(context).moreInfo)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      azkar[index].description.toString(),
                      style: TextStyle(
                          fontSize: 18, height: 2, color: primaryColor),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var model = AppCubit.get(context).azkar;
    List<Zekr> azakr = AppCubit.get(context).subAzker(s.toString());
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
                  child: Padding(
                    
                      padding: const EdgeInsets.all(15.0),
                      child: ListView.separated(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) => item(context,azkar: azakr,index: index,),
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10,
                              ),
                              
                          itemCount: azakr.length)),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
