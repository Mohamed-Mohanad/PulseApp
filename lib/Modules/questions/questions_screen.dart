import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../Models/questions/questions.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Cubit/cubit.dart';
import '../../Shared/Cubit/states.dart';
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
    int index = 0;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
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
                      lineHeight: size.height * 0.04,
                      animationDuration: 350,
                      animateFromLastPercent: true,
                      percent: (cubit.questionIndex + 1.0) / questions.length,
                      center: Text(
                        "${(cubit.questionIndex + 1.0) / questions.length * 100}%",
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
                      height: size.height * 0.7,
                      decoration: BoxDecoration(
                        color: greyColor2.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    questions[cubit.questionIndex].question,
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
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Column(
                              children: [
                                for (int i = 0;
                                    i <
                                        questions[cubit.questionIndex]
                                            .choices
                                            .length;
                                    i++)
                                  Expanded(
                                    child: ListTile(
                                      onTap: () {
                                        if (index < questions.length - 1) {
                                          index++;
                                          cubit.changeQuestion(index);
                                          print(index);
                                          print(cubit.questionIndex);
                                        }
                                      },
                                      title: Text(
                                        questions[cubit.questionIndex]
                                            .choices[i],
                                      ),
                                      leading: Radio(
                                        value: 1,
                                        groupValue: 0,
                                        onChanged: (var value) {
                                          val = value;
                                        },
                                      ),
                                    ),
                                  ),
                              ],
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
                            onPressed: () {
                              if (index > 0) {
                                index--;
                                cubit.changeQuestion(index);
                                print(index);
                                print(cubit.questionIndex);
                              }
                            },
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
                            onPressed: () {
                              if (index < questions.length - 1) {
                                index++;
                                cubit.changeQuestion(index);
                                print(index);
                                print(cubit.questionIndex);
                              }
                            },
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
      },
    );
  }
}
