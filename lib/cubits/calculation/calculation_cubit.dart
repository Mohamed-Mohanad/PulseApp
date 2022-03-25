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

  String genderValue = 'ذكر';
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

  // int i = 50;
  // String tallValue = '$i';
  // List<DropdownMenuItem<String>> get tallItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     for (i = 50; i < 250; i++)
  //       DropdownMenuItem(child: Text('${i++}'), value: '${i++}'),
  //   ];
  //   return menuItems;
  // }
  //
  // void changeTallValue(String newValue) {
  //   genderValue = newValue;
  //   emit(ChangeTallState());
  // }
  //
  // int j = 20;
  // String weightValue = '$j';
  // List<DropdownMenuItem<String>> get weightItems {
  //   List<DropdownMenuItem<String>> menuItems = [
  //     for (j = 20; j < 500; j++)
  //       DropdownMenuItem(child: Text('${j++}'), value: '${j++}'),
  //   ];
  //   return menuItems;
  // }
  //
  // void changeWeightValue(String newValue) {
  //   genderValue = newValue;
  //   emit(ChangeWeightState());
  // }
}
