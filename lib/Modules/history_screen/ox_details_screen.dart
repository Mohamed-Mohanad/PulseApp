import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Models/graph_data/graph_data.dart';
import 'package:pulse_app/Shared/Components/components.dart';
import 'package:pulse_app/Shared/Style/color.dart';

class OxDetailsHistoryScreen extends StatefulWidget {
  const OxDetailsHistoryScreen({Key? key}) : super(key: key);

  @override
  State<OxDetailsHistoryScreen> createState() => _OxDetailsHstoryScreenState();
}

class _OxDetailsHstoryScreenState extends State<OxDetailsHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return  DefaultTabController(
      length: 3,
      child: Scaffold(
          body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 100.h),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(25.0)),
                  child: TabBar(
                    indicator: BoxDecoration(
                        color: primaryColor, borderRadius: BorderRadius.circular(25.0)),
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.black,
                    tabs: const [
                      Tab(
                          icon: Text('اليوم',
                              style: TextStyle(
                                color: Colors.black,
                              ))),
                      Tab(
                          icon: Text('الاسبوع',
                              style: TextStyle(
                                color: Colors.black,
                              ))),
                      Tab(
                          icon: Text('الشهر',
                              style: TextStyle(
                                color: Colors.black,
                              ))),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      BuildDetailsHealthDataTab(
                        graphPoint: [
                          GraphDataClass('12:00', 35),
                          GraphDataClass('2:00', 28),
                          GraphDataClass('4:00', 34),
                          GraphDataClass('6:00', 32),
                          GraphDataClass('8:00', 40),
                        ],
                        tabColor: primaryColor,
                        tabTitle: "الاوكسجين",
                      ),
                      BuildDetailsHealthDataTab(
                        graphPoint: [
                          GraphDataClass('sat', 35),
                          GraphDataClass('sun', 28),
                          GraphDataClass('mon', 34),
                          GraphDataClass('tus', 32),
                          GraphDataClass('wen', 40),
                        ],
                        tabColor: primaryColor,
                        tabTitle: "الاوكسجين",
                      ),
                      BuildDetailsHealthDataTab(
                        graphPoint: [
                          GraphDataClass('Jan', 35),
                          GraphDataClass('Feb', 28),
                          GraphDataClass('Mar', 34),
                          GraphDataClass('Apr', 32),
                          GraphDataClass('May', 40),
                        ],
                        tabColor: primaryColor,
                        tabTitle: "الاوكسجين",
                      ),
                    ],
                  ),
                ),
                const Text(
                    'هذا المؤشر يوضح قرائات القلب علي مدار فترة زمنية محددة'),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                        left:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                        right:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                        bottom:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                      ),
                      color: Color(0xFFBFBFBF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Column(
                          children: [
                            Text(
                              'اليوم 21 فبراير ',
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              'طبيعي ',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          '45 نبضة',
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                        left:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                        right:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                        bottom:
                        BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                      ),
                      color: Color(0xFFBFBFBF),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:  [
                        Column(
                          children: [
                            Text(
                              'اليوم 21 فبراير ',
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              'طبيعي ',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                        Text(
                          '45 نبضة',
                          style: TextStyle(fontSize: 25),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
