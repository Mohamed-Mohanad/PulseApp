import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Shared/Cubit/cubit.dart';
import '../../Shared/Cubit/states.dart';
import '../../Shared/Style/color.dart';

class HelperMainScreen extends StatelessWidget {
  const HelperMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          body: cubit.helperBottomScreens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNav(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/home.png",
                  color: cubit.currentIndex == 0 ? primaryColor : blackColor,
                ),
                label: 'الرئيسية',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/history.png",
                  color: cubit.currentIndex == 1 ? primaryColor : blackColor,
                ),
                label: 'السجل',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/user.png",
                  color: cubit.currentIndex == 2 ? primaryColor : blackColor,
                ),
                label: 'setting',
              ),
            ],
          ),
        );
      },
    );
  }
}
