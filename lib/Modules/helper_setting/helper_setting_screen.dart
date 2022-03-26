import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Components/components.dart';
import 'package:pulse_app/Shared/Style/color.dart';
import 'package:pulse_app/Shared/Style/theme.dart';

class HelperSettingScreen extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _HelperSettingScreenState createState() => _HelperSettingScreenState();
}

class _HelperSettingScreenState extends State<HelperSettingScreen> {
  final _controller = ValueNotifier<bool>(false);
  bool _checked = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      setState(() {
        if (_controller.value) {
          _checked = true;
        } else {
          _checked = false;
        }
      });
    });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

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
                Container(
                  child: Text(
                    'اسماء خالد',
                    style: headLine(),
                  ),
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
  }

  Widget _helpMode() {
    bool status1 = false;
    bool isSwitchOn = false;
    [
      AdvancedSwitch(
        controller: _controller,
        thumb: ValueListenableBuilder<bool>(
          valueListenable: _controller,
          builder: (_, value, __) {
            return Icon(value
                ? Icons.sports_basketball_outlined
                : Icons.sports_basketball_outlined);
          },
        ),
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
            AdvancedSwitch(
              controller: _controller,
              thumb: ValueListenableBuilder<bool>(
                valueListenable: _controller,
                builder: (_, value, __) {
                  return Icon(value
                      ? Icons.sports_basketball_outlined
                      : Icons.sports_basketball_outlined);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
