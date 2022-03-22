import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class CalculationScreen extends StatelessWidget {
  late int steps;
  late TimeOfDay sleepTime, wakeUpTime;
  late String gender;
  late DateTime birthDate;
  late int height;
  late int weight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              child: Opacity(
                opacity: 0.5,
                child:  Container(
                  width: size.width,
                  height: size.height * 0.2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: const [
                        0.0,
                        0.2,
                        0.8,
                      ],
                      colors: [
                        primaryColor.withOpacity(0.9),
                        primaryColor.withOpacity(0.5),
                        Colors.white,
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Column(
                textDirection: TextDirection.rtl,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Logo(
                      height: size.height * 0.1,
                      width: size.width * 0.2,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.01,
                      horizontal: size.width * 0.15,
                    ),
                    child: Text(
                      'الحساب',
                      style: headLine(),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: size.height * 0.03,
                    ),
                    alignment: Alignment.centerRight,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                        vertical: 5,
                      ),
                      child: Text(
                        'الأهداف',
                        style: headLine().copyWith(
                          color: blackColor,
                        ),
                      ),
                    ),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          width: 1.0,
                          style: BorderStyle.solid,
                          color: blackColor,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        Text(
                          'الخطوات',
                          style: caption(),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
