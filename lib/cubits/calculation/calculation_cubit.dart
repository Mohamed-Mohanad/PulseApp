import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculation_states.dart';

class CalculationCubit extends Cubit<CalculationStates> {
  CalculationCubit() : super(CalculationInitialState());

  static CalculationCubit get(context) => BlocProvider.of(context);

  String sleepTime = '';
  void changeSleepTime(value) {
    sleepTime = value;
    emit(ChangeSleepTimeState());
  }

  String wakeUpTime = '';
  void changeWakeUpTime(value) {
    wakeUpTime = value;
    emit(ChangeWakeUpTimeState());
  }

  String genderValue = 'النوع';
  List<DropdownMenuItem<String>> get genderItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("ذكر"), value: "ذكر" ),
      const DropdownMenuItem(child: Text("انثى"), value: "انثى"),
    ];
    return menuItems;
  }

  void changeGenderValue(String newValue) {
    genderValue = newValue;
    emit(ChangeGenderState());
  }

  String tallValue = '150سم';
  List<DropdownMenuItem<String>> get tallItems {
    List<DropdownMenuItem<String>> menuItems = [
      for (int i = 50; i < 250; i++)
        DropdownMenuItem(child: Text('${i++}سم'), value: '${i++}سم'),
    ];
    return menuItems;
  }

  void changeTallValue(String newValue) {
    genderValue = newValue;
    emit(ChangeTallState());
  }

  String weightValue = '150سم';
  List<DropdownMenuItem<String>> get weightItems {
    List<DropdownMenuItem<String>> menuItems = [
      for (int i = 20; i < 500; i++)
        DropdownMenuItem(child: Text('${i++}كجم'), value: '${i++}كجم'),
    ];
    return menuItems;
  }

  void changeWeightValue(String newValue) {
    genderValue = newValue;
    emit(ChangeWeightState());
  }
}
