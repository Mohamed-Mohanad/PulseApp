import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Modules/settings/settin_profile_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Modules/add_person/add_person_screen.dart';
import '../../Modules/add_search/add_search_screen.dart';
import '../../Modules/basic_treatment/screen/screen.dart';
import '../../Modules/device_add/add_device_screen.dart';
import '../../Shared/Cubit/cubit.dart';
import '../../Shared/Cubit/states.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';
import '../../Shared/Components/components.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                ),
                child: InkWell(
                  onTap: () {
                    Alert(
                        context: context,
                        content: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const VerticalSpace(height: 10.0),
                              Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      child: ClipOval(
                                        child: CustomCachedNetworkImage(
                                          imageHeight: 50.h,
                                          imageWidth: 50.w,
                                          imageUrl:
                                              "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                                          imageFit: BoxFit.cover,
                                        ),
                                      ),
                                      radius: 25.0.r,
                                    ),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.0.w,
                                            ),
                                            child: Text(
                                              'اسماء خالد',
                                              style: bodyText().copyWith(
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          const VerticalSpace(height: 5.0),
                                          Container(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 10.0.w,
                                            ),
                                            child: Text(
                                              'assmaakhaled609@gmail.com',
                                              style: subTitle(),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          const VerticalSpace(height: 15.0),
                                          Container(
                                            width: 180.0.w,
                                            height: 40.0.h,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(20.0.r),
                                              border: Border.all(
                                                color: Colors.grey,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                            ),
                                            child: TextButton(
                                              child: Text(
                                                'قم بادارة حسابك',
                                                style: bodyText().copyWith(
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              onPressed: () {
                                                navigateTo(context, Profile());
                                              },
                                            ),
                                          ),
                                          const VerticalSpace(height: 10.0),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: size.width,
                                height: 1.0,
                                color: Colors.grey,
                              ),
                              const Content(
                                  text: 'تسجيل الخروج', icon: Icons.logout),
                              const Content(
                                  text: 'البيانات والخصوصية',
                                  icon: Icons.privacy_tip_outlined),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1.0,
                                color: Colors.grey,
                              ),
                              const Content(
                                  text: 'المساعدة والاراء',
                                  icon: Icons.help_outline_rounded),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 1.0,
                                color: Colors.grey,
                              ),
                              const VerticalSpace(height: 10.0),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: size.width * 0.05,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'حقوق الاستخدام',
                                        style: caption(),
                                      ),
                                    ),
                                    Container(
                                      child: Text(
                                        '.',
                                        style: caption().copyWith(
                                          fontSize: 30.0.sp,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'سياسة الخصوصية',
                                        style: caption(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        closeIcon: const Icon(
                          Icons.close,
                          size: 40.0,
                        ),
                        type: AlertType.none,
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "خروج",
                              style: bodyText().copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          )
                        ]).show();
                  },
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
                      const VerticalSpace(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(context, SearchScreen());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.search,
                                color: redColor,
                                size: 30,
                              ),
                            ),
                            const HorizontalSpace(
                              width: 20,
                            ),
                            Text(
                              'بحث',
                              style: headLine().copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpace(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(context, AddDeviceScreen());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.add_circle_outline_outlined,
                                color: redColor,
                                size: 30,
                              ),
                            ),
                            const HorizontalSpace(
                              width: 20,
                            ),
                            Text(
                              'اضافة جهاز جديد',
                              style: headLine().copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpace(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(context, AddPersonScreen());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.group_add_outlined,
                                color: redColor,
                                size: 30,
                              ),
                            ),
                            const HorizontalSpace(
                              width: 20,
                            ),
                            Text(
                              'اضافة شخص مقرب',
                              style: headLine().copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const VerticalSpace(
                        height: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          navigateTo(context, Screen());
                        },
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.article_outlined,
                                color: redColor,
                                size: 30,
                              ),
                            ),
                            const HorizontalSpace(
                              width: 20,
                            ),
                            Text(
                              'نصائح الاسعافات الاولية',
                              style: headLine().copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),
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
