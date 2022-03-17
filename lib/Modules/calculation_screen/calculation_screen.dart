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
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Positioned(
                child: Opacity(
                  opacity: 0.5,
                  child: Container(
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
                    const Header(
                      title: 'الأهداف',
                    ),
                    CalculateBox(
                      width: size.width * 0.32,
                      textWidth: size.width * 0.15,
                      header: 'الخطوات',
                      text: '5000',
                      function: () {},
                    ),
                    const Header(
                      title: 'وقت النوم',
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: Row(
                        children: [
                          CalculateBox(
                            width: size.width * 0.32,
                            textWidth: size.width * 0.15,
                            header: 'موعد النوم',
                            text: 'م11:00',
                            function: () {},
                          ),
                          CalculateBox(
                            width: size.width * 0.32,
                            textWidth: size.width * 0.15,
                            header: 'موعد الأستيقاذ',
                            text: 'ص7:00',
                            function: () {},
                          ),
                        ],
                      ),
                    ),
                    const Header(
                      title: 'معلومات عنك',
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              CalculateBox(
                                width: size.width * 0.32,
                                textWidth: size.width * 0.15,
                                header: 'النوع',
                                text: 'ذكر',
                                function: () {},
                              ),
                              CalculateBox(
                                width: size.width * 0.38,
                                textWidth: size.width * 0.25,
                                header: 'تاريخ الميلاد',
                                text: '32 مايو, 2000',
                                function: () {},
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CalculateBox(
                                width: size.width * 0.32,
                                textWidth: size.width * 0.15,
                                header: 'الطول',
                                text: '371 سم',
                                function: () {},
                              ),
                              CalculateBox(
                                width: size.width * 0.32,
                                textWidth: size.width * 0.15,
                                header: 'الوزن',
                                text: '56 كجم',
                                function: () {},
                              ),
                            ],
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
      ),
    );
  }
}
