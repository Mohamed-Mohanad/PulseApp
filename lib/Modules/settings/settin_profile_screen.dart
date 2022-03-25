import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pulse_app/Shared/Components/components.dart';
import 'package:pulse_app/Shared/Style/theme.dart';

import '../../Shared/Style/color.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(15.0),
          color: whiteColor,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.search,
                    size: 35.sp,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 35.sp,
                  ),
                ],
              ),
              // for circle avatar image
              GetHeader(),
              const ProfileName(
                name: 'assmaakhaled609@gmail.com',
              ),
              const VerticalSpace(
                height: 15,
              ),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 40.0.h,
                        right: 5.0.w,
                        left: 5.0.w,
                        bottom: 12.0.h,
                      ),
                      child: Column(
                        children: [
                          Text(
                            'بطاريتك منخفضة 25%',
                            style: headLine(),
                            textAlign: TextAlign.center,
                          ),
                          const VerticalSpace(
                            height: 7,
                          ),
                          Text(
                            'يرجي شحن البطارية',
                            style: bodyText().copyWith(
                              color: Colors.grey,
                              fontSize: 18.0.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const VerticalSpace(
                            height: 8,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Container(
                              color: blackColor,
                              height: 60.h,
                              width: 300.h,
                              child: Center(
                                child: Text(
                                  'تعليمات الشحن',
                                  style: headLine().copyWith(
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const VerticalSpace(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'الاجهزة المتصلة',
                    style: headLine().copyWith(
                      fontWeight: FontWeight.normal,
                      color: blackColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Container(
                      padding: const EdgeInsets.all(5.0),
                      color: blackColor,
                      height: 35.h,
                      width: 95.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'إضافة',
                            style: subTitle().copyWith(
                              color: Colors.white,
                              fontSize: 17.0.sp,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 25,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset('assets/images/device.png'),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Logo(
                              height: 20.0.h,
                              width: 60.0.w,
                            ),
                            const HorizontalSpace(
                              width: 10,
                            ),
                            Text(
                              'النسخة الاولي',
                              style: caption(),
                            ),
                            const HorizontalSpace(
                              width: 25,
                            ),
                            const Icon(
                              Icons.settings_outlined,
                              size: 30,
                            )
                          ],
                        ),
                        const VerticalSpace(
                          height: 7,
                        ),
                        Text(
                          'متصل',
                          style: bodyText().copyWith(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const VerticalSpace(
                          height: 10,
                        ),
                        Text(
                          'المزامنة الاخيرة: 09/12/2021 | 02:05م',
                          style: subTitle().copyWith(
                            color: blackColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const VerticalSpace(
                height: 25,
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
              Container(
                color: Colors.white,
                child: Column(
                  children: [
                    DetailsCard(),
                    const MyListTile(
                      icon: Icons.switch_account_rounded,
                      text: 'الاشخاص المقربون',
                    )
                  ],
                ),
              ),
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
              const VerticalSpace(
                height: 10,
              ),
              Container(
                width: 280.0.w,
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
      )),
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
