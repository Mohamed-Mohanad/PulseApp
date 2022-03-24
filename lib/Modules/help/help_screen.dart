import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Style/theme.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';

class helpScreen extends StatefulWidget {
  const helpScreen({Key? key}) : super(key: key);

  @override
  State<helpScreen> createState() => _helpScreenState();
}

class _helpScreenState extends State<helpScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.05,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Logo(
                  width: size.width * 0.2,
                  height: size.height * 0.05,
                ),
              ),
              Text(
                'المساعدة',
                textAlign: TextAlign.start,
                style: headLine(),
              ),
              Container(
                height: 40.0.h,
                decoration: BoxDecoration(
                    color: greyColor1, borderRadius: BorderRadius.circular(20)),
                child: TabBar(
                    indicator: BoxDecoration(
                        color: redColor,
                        borderRadius: BorderRadius.circular(20)),
                    tabs: const [
                      Tab(
                        text: 'المقربون',
                      ),
                      Tab(
                        text: 'الجميع',
                      )
                    ]),
              ),
              const VerticalSpace(
                height: 20.0,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      greyColor2.withOpacity(0.3),
                      whiteColor.withOpacity(0.1),
                    ],
                  ),
                ),
                height: size.height * 0.6,
                child: TabBarView(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          const VerticalSpace(
                            height: 35.0,
                          ),
                          Image.asset(
                              'assets/images/Family Values Family 1.png'),
                          const VerticalSpace(
                            height: 70,
                          ),
                          Text(
                            'الاقرباء بجانبك',
                            textAlign: TextAlign.center,
                            style: headLine(),
                          ),
                          const VerticalSpace(
                            height: 20.0,
                          ),
                          Container(
                            width: size.width * 0.6,
                            child: Text(
                              'بتفعيل وضع المساعدة للاقرباء سوف يكون اقرباْئك بجانبك دائماً',
                              textAlign: TextAlign.center,
                              style: subTitle().copyWith(
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          const VerticalSpace(
                            height: 35.0,
                          ),
                          Image.asset(
                              'assets/images/Wavy Buddies Delivering.png'),
                          const VerticalSpace(
                            height: 70,
                          ),
                          Text(
                            'الحميع بجانبك',
                            textAlign: TextAlign.center,
                            style: headLine(),
                          ),
                          const VerticalSpace(
                            height: 20.0,
                          ),
                          Container(
                            width: size.width * 0.6,
                            child: Text(
                              'هناك الكثير من حولك علي استعداد لتقديم المساعدة في اي وقت',
                              textAlign: TextAlign.center,
                              style: subTitle().copyWith(
                                fontSize: 15.sp,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
