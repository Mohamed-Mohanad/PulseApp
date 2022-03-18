import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pulse_app/Shared/Components/components.dart';
import 'package:pulse_app/Shared/Style/color.dart';
import 'package:pulse_app/Shared/Style/theme.dart';

class HelperSettingScreen extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _HelperSettingScreenState createState() => _HelperSettingScreenState();
}

class _HelperSettingScreenState extends State<HelperSettingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: whitColor,
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
                _getHeader(),
                Container(
                  child: Text(
                    'اسماء خالد',
                    style: headLine(),
                  ),
                ),
                _profileName("assmaakhaled609@gmail.com"),
                const VerticalSpace(
                  height: 14,
                ),
                const VerticalSpace(
                  height: 6,
                ),
                _heading("الانقاذ"),
                _helpMode(),
                const VerticalSpace(
                  height: 6,
                ),
                _heading("الاعدادت"),
                const VerticalSpace(
                  height: 6,
                ),
                _detailsCard(),
                const VerticalSpace(
                  height: 10,
                ),
                _heading("عن التطبيق"),
                const VerticalSpace(
                  height: 6,
                ),
                _settingsCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _getHeader() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                    "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _profileName(String name) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80, //80% of width,
        child: Center(
          child: Text(
            name,
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Text(
        heading,
        style: subTitle().copyWith(
          fontSize: 23.0.sp,
        ),
      ),
    );
  }

  Widget _detailsCard() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        child: Column(
          children: const [
            //row for each deatails
            MyListTile(
              icon: Icons.account_circle_outlined,
              text: 'الملف الشخصي',
            ),
            MyListTile(
              icon: Icons.settings_outlined,
              text: "اعدادت الصفحة",
            ),
            MyListTile(
              icon: Icons.assignment_outlined,
              text: "اعداد التقرير",
            ),
            MyListTile(
              icon: Icons.notifications_outlined,
              text: "الاشعارات",
            ),
          ],
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return SingleChildScrollView(
      child: Card(
        child: Column(
          children: const [
            MyListTile(
              icon: Icons.book_outlined,
              text: "طريقة الاستخدام",
            ),
            MyListTile(
              icon: Icons.privacy_tip_outlined,
              text: "البيانات والخصوصية",
            ),
            MyListTile(
              icon: Icons.error_outline_outlined,
              text: "الاصدار",
            ),
          ],
        ),
      ),
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
