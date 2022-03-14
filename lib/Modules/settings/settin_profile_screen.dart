
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:pulse_app/Shared/Style/color.dart';

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
              color:const Color(0xffBBBBBB),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children:const [
                        Icon(Icons.search,size: 35,),
                        Icon(Icons.arrow_forward_ios,size: 35,),
                      ],
                    ),
                  ),//for circle avtar image
                  _getHeader(),
                  _profileName("assmaakhaled609@gmail.com"),
                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.white,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                const Text('بطاريتك منخفضة بنسبة 25%',style: TextStyle(fontSize: 20),
                                  textAlign: TextAlign.center,),
                                SizedBox(height: 5.h,),
                                const Text('يرجي شحن البطارية',style: TextStyle(fontSize: 10),
                                  textAlign: TextAlign.center,),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    textStyle: TextStyle(color:blackColor),
                                  ),
                                  onPressed: (){},
                                  child: Container(
                                    color: Colors.grey,
                                    height: 60.h,
                                    width: 300.h,
                                    child: const Text(
                                      'تعليمات الشحن',
                                      style: TextStyle(fontSize: 25,color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('الاجهزة المتصلة'),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: TextStyle(color:blackColor),
                          ),
                          onPressed: (){},
                          child: Container(
                            color: Colors.grey,
                            height: 30.h,
                            width: 80.h,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const[
                                Text(
                                  'إضافة',
                                  style: TextStyle(fontSize: 20,color: Colors.black),
                                  textAlign: TextAlign.center,
                                ),
                                Icon(Icons.add,color: Colors.white,size: 25,)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      color: Colors.white,
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
                                  Image.asset('assets/icons/pulseIcon.png'),
                                  SizedBox(width: 10.w,),
                                  const Text('النسخة الاولي'),
                                  SizedBox(width: 25.w,),
                                  const Icon(Icons.settings,size: 30,)
                                ],
                              ),
                              SizedBox(height: 10.h,),
                              const Text('متصل',style: TextStyle(color: Colors.green),),
                              SizedBox(height: 10.h,),
                              const Text('المزامنة الاخيرة: 09/12/2021 | 02:05م')

                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  _heading("الانقاذ"),
                  _helpMode(),
                  const SizedBox(
                    height: 6,
                  ),
                  _heading("الاعدادت"),
                  const SizedBox(
                    height: 6,
                  ),
                  _detailsCard(),
                  const SizedBox(
                    height: 10,
                  ),
                  _heading("عن التطبيق"),
                  const SizedBox(
                    height: 6,
                  ),
                  _settingsCard(),
                ],
              ),
            ),
          )),
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
              decoration:const BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image:NetworkImage("https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                    ) // color: Colors.orange[100],
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
      child: SizedBox(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.80, //80% of width,
        child: Center(
          child: Text(
            name,
            style:const TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return SizedBox(
      width: MediaQuery
          .of(context)
          .size
          .width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Container(
            color: Colors.white,
            child: Column(
              children: const[
                //row for each deatails
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "الملف الشخصي",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: Text(
                    "اعدادت الصفحة",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  title: Text(
                    "الاشخاص المقربون",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.assignment_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "اعداد التقرير",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  title: Text(
                    "الاشعارات",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Column(
            children: const [
              //row for each deatails
              ListTile(
                leading: Icon(
                  Icons.book_sharp,
                  color: Colors.black,
                ),
                title: Text(
                  "طريقة الاستخدام",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Divider(
                height: 0.6,
                color: Colors.black87,
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip,
                  color: Colors.black,
                ),
                title: Text(
                  "البيانات والخصوصية",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Divider(
                height: 0.6,
                color: Colors.black87,
              ),
              ListTile(
                leading: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "الاصدار",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Container(
            color: Colors.white,
            height: 60.h,
            width: 400.w,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.person_outline,
                    color: Colors.black,
                  ),
                const   Text(
                    "تفعيل الانقاذ",
                    style: TextStyle(color: Colors.black),
                  ),
                  FlutterSwitch(
                    value: status1,
                    onToggle: (val) {
                      setState(() {
                        status1 = val;
                      });
                    },
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}
