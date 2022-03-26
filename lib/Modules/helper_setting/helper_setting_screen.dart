import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pulse_app/Shared/Components/components.dart';
import 'package:pulse_app/Shared/Style/color.dart';
import 'package:pulse_app/Shared/Style/theme.dart';
import 'package:pulse_app/cubits/authintication/auth_cubit.dart';
import 'package:pulse_app/cubits/authintication/auth_states.dart';

class HelperSettingScreen extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _HelperSettingScreenState createState() => _HelperSettingScreenState();
}

class _HelperSettingScreenState extends State<HelperSettingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                color: whiteColor,
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.04,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(
                            Icons.search,
                            size: size.width * 0.1,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: size.width * 0.1,
                          ),
                        ],
                      ),
                    ),
                    GetHeader(),
                    Text(
                      'اسماء خالد',
                      style: headLine(),
                    ),
                    const ProfileName(
                      name: 'assmaakhaled609@gmail.com',
                    ),
                    const VerticalSpace(
                      height: 14,
                    ),
                    const Heading(
                      heading: "الانقاذ",
                    ),
                    _helpMode(),
                    const VerticalSpace(
                      height: 6,
                    ),
                    const Heading(
                      heading: "الاعدادت",
                    ),
                    const VerticalSpace(
                      height: 6,
                    ),
                    DetailsCard(),
                    const VerticalSpace(
                      height: 10,
                    ),
                    const Heading(
                      heading: "عن التطبيق",
                    ),
                    const VerticalSpace(
                      height: 6,
                    ),
                    SettingCard(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _helpMode() {
    bool status1 = false;
    bool isSwitchOn = false;
    [
      FlutterSwitch(
        value: isSwitchOn,
        onToggle: (value) {
          setState(() {
            isSwitchOn = value;
          });
        },
      ),
    ];
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.03,
        ),
        color: Colors.white,
        height: 60.h,
        width: 400.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              Icons.person_outline,
              color: Colors.black,
              size: MediaQuery.of(context).size.width * 0.07,
            ),
            Text(
              "تفعيل الانقاذ",
              style: bodyText().copyWith(
                fontSize: 23.0.sp,
              ),
            ),
            HorizontalSpace(
              width: MediaQuery.of(context).size.width * 0.1,
            ),
            FlutterSwitch(
              value: status1,
              onToggle: (val) {
                setState(() {
                  status1 = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
