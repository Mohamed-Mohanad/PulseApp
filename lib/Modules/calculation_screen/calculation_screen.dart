import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/theme.dart';
import '../../cubits/calculation/calculation_cubit.dart';
import '../../cubits/calculation/calculation_states.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  var stepsController = TextEditingController();
  var dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<CalculationCubit, CalculationStates>(
      listener: (context, state) => {},
      builder: (context, state) {
        var cubit = CalculationCubit.get(context);
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              child: Stack(
                children: [
                  TopBlur(),
                  SafeArea(
                    child: Column(
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
                          header: 'الخطوات',
                          child: Container(
                            child: Center(
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                controller: stepsController,
                                keyboardType: TextInputType.number,
                                decoration: const InputDecoration(
                                  hintText: '5000',
                                  enabledBorder: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const Header(
                          title: 'وقت النوم',
                        ),
                        Row(
                          children: [
                            CalculateBox(
                              width: size.width * 0.32,
                              header: 'موعد النوم',
                              child: MyTimer(
                                timer: cubit.sleepTime,
                                cubit: cubit,
                                function: (dateTime) {
                                  cubit.changeSleepTime(
                                      dateTime.hour.toString() +
                                          ':' +
                                          dateTime.minute.toString());
                                  print(cubit.sleepTime);
                                },
                              ),
                            ),
                            CalculateBox(
                              width: size.width * 0.35,
                              header: 'موعد الاستيقاظ',
                              child: MyTimer(
                                timer: cubit.wakeUpTime,
                                cubit: cubit,
                                function: (dateTime) {
                                  cubit.changeWakeUpTime(
                                      dateTime.hour.toString() +
                                          ':' +
                                          dateTime.minute.toString());
                                  print(cubit.wakeUpTime);
                                },
                              ),
                            ),
                          ],
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
                                    header: 'النوع',
                                    child: DropdownButton(
                                      value: cubit.genderValue,
                                      icon: const Icon(Icons.keyboard_arrow_down),
                                      items: cubit.genderItems,
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          cubit.changeGenderValue(newValue);
                                        }
                                      },
                                    ),
                                  ),
                                  CalculateBox(
                                    width: size.width * 0.38,
                                    header: 'تاريخ الميلاد',
                                    child: InkWell(
                                      onTap: () {
                                        cubit.selectDate(context);
                                      },
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  CalculateBox(
                                    width: size.width * 0.32,
                                    header: 'الطول',
                                    child: DropdownButton(
                                      items: cubit.tallItems,
                                      value: cubit.tallValue,
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          cubit.changeTallValue(newValue);
                                        }
                                      },
                                    ),
                                  ),
                                  CalculateBox(
                                    width: size.width * 0.32,
                                    header: 'الوزن',
                                    child: DropdownButton(
                                      items: cubit.weightItems,
                                      value: cubit.weightValue,
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          cubit.changeWeightValue(newValue);
                                        }
                                      },
                                    ),
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
      },
    );
  }
}
