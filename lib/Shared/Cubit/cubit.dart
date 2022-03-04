import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_app/Shared/Cubit/states.dart';

import '../../Modules/Home/home_screen.dart';
import '../Components/components.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<Widget> bottomScreens = [
    const HomeScreen(),
    Container(),
    Container(),
    Container(),
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
