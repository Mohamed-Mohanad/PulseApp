import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Shared/Cubit/cubit.dart';
import '../../Shared/Cubit/states.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';
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
            leading: AnimateIcons(
              startIcon: Icons.add,
              endIcon: Icons.close,
              size: 36,
              startIconColor: Colors.grey,
              endIconColor: Colors.white,
              onStartIconPress: () {
                cubit.changeHoverScreenState();
                return true;
              },
              onEndIconPress: () {
                cubit.changeHoverScreenState();
                return true;
              },
              controller: AnimateIconController(),
              duration: const Duration(milliseconds: 300),
              clockwise: false,
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(
                  left: 5.w,
                  right: 10.w,
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
            backgroundColor: !cubit.showHoverScreen
                ? Colors.white
                : Colors.black87.withOpacity(0.6),
          ),
          body: Stack(
            children: [
              cubit.patientBottomScreens[cubit.currentIndex],
              if (cubit.showHoverScreen)
                Container(
                  width: double.infinity,
                  height: (MediaQuery.of(context).size.height - 110).h,
                  padding: EdgeInsets.only(
                    left: 20.w,
                    right: 26.w,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black87.withOpacity(0.6),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.search,
                              color: redColor,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          Text(
                            'بحث',
                            style: headLine().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.add_circle_outline_outlined,
                              color: redColor,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          Text(
                            'اضافة جهاز جديد',
                            style: headLine().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Icon(
                              Icons.group_add_outlined,
                              color: redColor,
                              size: 30,
                            ),
                          ),
                          SizedBox(
                            width: 20.h,
                          ),
                          Text(
                            'اضافة شخص مقرب',
                            style: headLine().copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
            ],
          ),
          /*
                // if (cubit.showHoverScreen)
                //   Container(
                //     width: double.infinity,
                //     height: (MediaQuery.of(context).size.height - 110).h,
                //     padding: EdgeInsets.only(
                //       left: 20.w,
                //       right: 26.w,
                //     ),
                //     decoration: BoxDecoration(
                //       gradient: LinearGradient(
                //         begin: Alignment.topCenter,
                //         end: Alignment.bottomCenter,
                //         colors: [
                //           Colors.black87.withOpacity(0.6),
                //           Colors.transparent,
                //         ],
                //       ),
                //     ),
                //     child: Column(
                //       crossAxisAlignment: CrossAxisAlignment.start,
                //       children: [
                //         SizedBox(
                //           height: 15.h,
                //         ),
                //         Row(
                //           children: [
                //             CircleAvatar(
                //               backgroundColor: Colors.white,
                //               child: Icon(
                //                 Icons.search,
                //                 color: redColor,
                //                 size: 30,
                //               ),
                //             ),
                //             SizedBox(
                //               width: 20.h,
                //             ),
                //             Text(
                //               'بحث',
                //               style: headLine().copyWith(
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 15.h,
                //         ),
                //         Row(
                //           children: [
                //             CircleAvatar(
                //               backgroundColor: Colors.white,
                //               child: Icon(
                //                 Icons.add_circle_outline_outlined,
                //                 color: redColor,
                //                 size: 30,
                //               ),
                //             ),
                //             SizedBox(
                //               width: 20.h,
                //             ),
                //             Text(
                //               'اضافة جهاز جديد',
                //               style: headLine().copyWith(
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //         SizedBox(
                //           height: 15.h,
                //         ),
                //         Row(
                //           children: [
                //             CircleAvatar(
                //               backgroundColor: Colors.white,
                //               child: Icon(
                //                 Icons.group_add_outlined,
                //                 color: redColor,
                //                 size: 30,
                //               ),
                //             ),
                //             SizedBox(
                //               width: 20.h,
                //             ),
                //             Text(
                //               'اضافة شخص مقرب',
                //               style: headLine().copyWith(
                //                 color: Colors.white,
                //               ),
                //             ),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),*/
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
