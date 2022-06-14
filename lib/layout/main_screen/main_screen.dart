import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:hive/hive.dart';
import 'package:muslim_app/cubit/cubit.dart';
import 'package:muslim_app/cubit/states.dart';

import 'package:muslim_app/style/my_icons_icons.dart';
import 'package:muslim_app/style/style.dart';


class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget bottomNav(context) {
      return BottomNavigationBar(
          iconSize: 32,
          currentIndex: AppCubit.get(context).index,
          onTap: (value) {
            print(value);
            AppCubit.get(context).changBottomNav(value);
          },
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          selectedItemColor: primaryColor,
          unselectedItemColor: additionalColor,
          items: [
            const BottomNavigationBarItem(
              icon: const Icon(
                MyIcons.home,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Icon(
                    MyIcons.quran,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(icon: Container(), label: ''),
            BottomNavigationBarItem(
                icon: const Padding(
                  padding: EdgeInsets.only(right: 0),
                  child: Icon(
                    MyIcons.seabha,
                  ),
                ),
                label: ''),
            const BottomNavigationBarItem(
                icon: const Icon(
                  MyIcons.quibla,
                ),
                label: ''),
          ]);
    }

    Widget fab(context) {
      return Container(
        decoration: BoxDecoration(
            color: primaryColor, borderRadius: BorderRadius.circular(15)),
        child: IconButton(
          onPressed: () async {
            
          },
          icon: const Icon(
            MyIcons.apps,
            color: Colors.white,
          ),
        ),
      );
    }

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: fab(context),
            bottomNavigationBar: bottomNav(context),
            body: AppCubit.get(context).screens[AppCubit.get(context).index]);
      },
    );
  }
}
