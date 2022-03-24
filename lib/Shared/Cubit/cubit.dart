import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Modules/close_people/close_people_screen.dart';
import '../../Modules/help/help_screen.dart';
import '../../Modules/helper_history_screen/helper_history_screen.dart';
import '../../Modules/helper_home_screen/helper_home_screen.dart';
import '../../Modules/helper_setting/helper_setting_screen.dart';
import '../../Modules/medicine/medicine_screen.dart';
import '../../Modules/Home/home_screen.dart';
import '../Components/components.dart';
import 'states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> patientBottomScreens = [
    const HomeScreen(),
    const closePeople(),
    const helpScreen(),
    const MedicineScreen(),
  ];

  List<Widget> helperBottomScreens = [
    const HelperHomeScreen(),
    HelperHistoryScreen(),
    HelperSettingScreen(),
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
  void changeHoverScreenState() {
    showHoverScreen = !showHoverScreen;
    emit(HoverScreenChangeState());
  }

  int questionIndex = 0;
  void changeQuestion(int index) {
    questionIndex = index;
    emit(ChangeQuestionState());
  }
}
