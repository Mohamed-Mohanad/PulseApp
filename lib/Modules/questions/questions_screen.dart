import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pulse_app/Models/questions/questions.dart';
import 'package:pulse_app/Shared/Components/components.dart';

import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({Key? key}) : super(key: key);

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var val;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.1,
                ),
                child: LinearPercentIndicator(
                  width: size.width * 0.8,
                  barRadius: const Radius.circular(
                    15.0,
                  ),
                  animation: true,
                  lineHeight: 25.0,
                  animationDuration: 1000,
                  percent: 0.65,
                  center: Text(
                    "${0.65 * 100}%",
                    style: bodyText().copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  progressColor: greenColor,
                  backgroundColor: redColor.withOpacity(0.7),
                  isRTL: true,
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                child: Container(
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: greyColor2.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      Container(
                        child: Text(
                          normalQuestions[0].question,
                          style: headLine().copyWith(
                            fontSize: 30.0.sp,
                          ),
                        ),
                      ),
                      VerticalSpace(
                        height: 15.0.h,
                      ),
                      Container(
                        width: size.width * 0.8,
                        height: 1.0,
                        color: Colors.grey,
                      ),
                      VerticalSpace(
                        height: size.height * 0.05,
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            normalQuestions[0].choices[0],
                          ),
                          leading: Radio(
                            value: 1,
                            groupValue: 0,
                            onChanged: (var value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            normalQuestions[0].choices[1],
                          ),
                          leading: Radio(
                            value: 1,
                            groupValue: 0,
                            onChanged: (var value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            normalQuestions[0].choices[2],
                          ),
                          leading: Radio(
                            value: 1,
                            groupValue: 0,
                            onChanged: (var value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListTile(
                          title: Text(
                            normalQuestions[0].choices[3],
                          ),
                          leading: Radio(
                            value: 1,
                            groupValue: 0,
                            onChanged: (var value) {
                              setState(() {
                                val = value;
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: TextButton(
                        child: Text(
                          'السابق',
                          style: bodyText().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                        color: greenColor,
                        borderRadius: BorderRadius.circular(
                          10.0,
                        ),
                      ),
                      child: TextButton(
                        child: Text(
                          'التالي',
                          style: bodyText().copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
