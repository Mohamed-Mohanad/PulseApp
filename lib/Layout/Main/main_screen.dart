import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Cubit/cubit.dart';
import 'package:pulse_app/Shared/Cubit/states.dart';
import 'package:pulse_app/Shared/Style/color.dart';

import '../../Shared/Components/components.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0.w,
                ),
                child: CircleAvatar(
                  child: ClipOval(
                    child: CustomCachedNetworkImage(
                      imageHeight: 45.h,
                      imageWidth: 60.w,
                      imageUrl:
                          "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                      imageFit: BoxFit.cover,
                    ),
                  ),
                  radius: 23.0.r,
                ),
              ),
            ],
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 36,
              ),
            ),
          ),
          body: cubit.bottomScreens[cubit.currentIndex],
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
                  "assets/icons/users.png",
                  color: cubit.currentIndex == 1 ? primaryColor : blackColor,
                ),
                label: 'المقربون',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/life-buoy.png",
                  color: cubit.currentIndex == 2 ? primaryColor : blackColor,
                ),
                label: 'المساعدة',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  "assets/icons/droplet.png",
                  color: cubit.currentIndex == 3 ? primaryColor : blackColor,
                ),
                label: 'الدواء',
              ),
            ],
          ),
        );
      },
    );
  }
}
