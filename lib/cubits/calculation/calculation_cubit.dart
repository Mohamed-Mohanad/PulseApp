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
      const DropdownMenuItem(child: Text("ذكر"), value: "ذكر"),
      const DropdownMenuItem(child: Text("انثى"), value: "انثى"),
    ];
    return menuItems;
  }

  void changeGenderValue(String newValue) {
    genderValue = newValue;
    emit(ChangeGenderState());
  }

  DateTime selectedDate = DateTime.now();
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2020),
    );

    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
      emit(ChangeDateState());
    }
  }

  String tallValue = '49';

  List<DropdownMenuItem<String>> get tallItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text('49'), value: '49'),
      for (int i = 50; i < 250; i++)
        DropdownMenuItem(child: Text('${i++}'), value: '${i++}'),
    ];
    return menuItems;
  }

  void changeTallValue(String newValue) {
    tallValue = newValue;
    emit(ChangeTallState());
  }

  String weightValue = '19';

  List<DropdownMenuItem<String>> get weightItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text('19'), value: '19'),
      for (int j = 20; j < 500; j++)
        DropdownMenuItem(child: Text('${j++}'), value: '${j++}'),
    ];
    return menuItems;
  }

  void changeWeightValue(String newValue) {
    weightValue = newValue;
    emit(ChangeWeightState());
  }
}
