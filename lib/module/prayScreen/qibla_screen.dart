import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:muslim_app/cubit/cubit.dart';
import 'package:muslim_app/shared/components/adhan.dart';
import 'package:muslim_app/shared/components/constance.dart';
import 'dart:math' as math;



class QiblaScreen extends StatefulWidget {
  const QiblaScreen({Key? key}) : super(key: key);

  @override
  State<QiblaScreen> createState() => _QiblaScreenState();
}

class _QiblaScreenState extends State<QiblaScreen>
    with SingleTickerProviderStateMixin {
  double x = 1.0;
  double y = 5.0;
  late AnimationController controller;
  late Animation animation;
  List list = [];
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    animation = Tween(begin: y, end: x).animate(controller)..addListener(() {});
    
    controller.forward();
    setState(() {
       AppCubit.get(context).getLocation();
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    FlutterCompass.events?.listen((event) {}).cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
   
    animation = Tween(begin: y, end: x).animate(controller);
    controller.forward();
    FlutterCompass.events?.listen((event) {
      if (list.length == 10) {
        list.clear();
      }
      list.add(event.heading?.toInt().toDouble());

      if (list.length > 1) {
        x = list[list.length - 1] ?? 10;
        y = list[list.length - 2] ?? 0;
      }

      
      Future.delayed(Duration(milliseconds: 1), () {
        setState(() {});
      });
    });


    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Transform.rotate(
              alignment: Alignment.center,
              angle: 3.14 / 180 * (animation.value),
              child: SvgPicture.asset(
                'assets/svg/compass.svg',
              ),
            ),
            SvgPicture.asset(
              'assets/svg/icon.svg',
            ),
            Transform.rotate(
                angle:
                    ((Adhan(myCoordinates).qibla.direction) - animation.value) *
                        (math.pi / -180),
                child: SvgPicture.asset(
                  'assets/svg/outter frame.svg',
                )),
            Text('${animation.value}'),
          ],
        ),
      ),
    );

    //**************************************** */
  }
}

