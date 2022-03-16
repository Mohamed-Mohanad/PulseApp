import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'states.dart';

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
  int currentHistoryIndex = 0;
  List<Widget> tabHeartHistoryScreens = [
    const DayTab(),
    const WeekTab(),
    const MonthTab(),
  ];

  void changeTabHeartHistoryScreens(int index) {
    currentTabIndex = index;
    emit(AppTabState());
  }


  bool showHoverScreen = false;
  void changeHoverScreenState(){
    showHoverScreen = !showHoverScreen;
    emit(HoverScreenChangeState());
  }

}
