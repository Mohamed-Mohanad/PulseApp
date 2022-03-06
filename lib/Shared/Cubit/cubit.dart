import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_app/Modules/close_people/close_people_screen.dart';
import 'package:pulse_app/Modules/help_screen.dart';
import 'package:pulse_app/Modules/medicine_screen.dart';
import 'package:pulse_app/Shared/Cubit/states.dart';

import '../../Modules/Home/home_screen.dart';
import '../Components/components.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    const closePeople(),
    const helpScreen(),
     MedicineScreen(),
  ];

  void changeBottomNav(int index) {
    currentIndex = index;
    emit(AppBottomNavState());
  }

  int currentTabIndex = 0;
  List<Widget> tabScreens = [
    const HeartTab(),
    const OxygenTab(),
    const TempTab(),
  ];

  void changeTabScreen(int index) {
    currentTabIndex = index;
    emit(AppTabState());
  }



}
