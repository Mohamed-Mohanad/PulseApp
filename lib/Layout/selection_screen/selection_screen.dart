import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse/Layout/login_screen/login_screen.dart';

import '../../Shared/Components/components.dart';
import '../OnBoarding/onboarding_screen.dart';
import '../../Shared/Style/color.dart';
import '../registration_screen/registration_screen.dart';
import '../signup_screen/signup_screen.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({Key? key}) : super(key: key);

  @override
  _SelectionScreenState createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(
                  width: size.width * 0.73,
                  height: size.height * 0.3,
                  left: 0.0,
                  top: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/vectors/2_1.png'),
                        opacity: 0.80,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: size.width * 0.95,
                  height: size.height * 0.25,
                  right: 0.0,
                  top: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/vectors/2_2.png'),
                        opacity: 0.72,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: size.width * 0.5,
                  height: size.height * 0.2,
                  right: 20.0.w,
                  top: 40.0.h,
                  child: Container(
                    child: Text(
                      'مرحبا بك, في تطبيق',
                      style: TextStyle(
                        fontSize: 36.0.sp,
                        fontWeight: FontWeight.w800,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: size.width,
                  height: size.height,
                  top: 250.0.h,
                  child: Column(
                    children: [
                      Logo(
                        width: size.width * 0.5,
                        height: size.height * 0.2,
                      ),
                      SizedBox(
                        height: 15.0.h,
                      ),
                      Container(
                        width: size.width * 0.25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Circle(
                              color: redColor,
                            ),
                            Circle(
                              color: primaryColor,
                            ),
                            Circle(
                              color: greenColor,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.75,
                        child: Text(
                          'هو تطبيق جوال للرعاية الصحية '
                          'يهدف إلى تسهيل حياة الأشخاص '
                          'المعرضين لخطر الإصابة بنوبة قلبية '
                          'وإنقاذ حياتهم في المواقف الخطرة',
                          style: Theme.of(context).textTheme.bodyText1,
                          maxLines: 4,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.25,
                  bottom: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/vectors/2_3.png'),
                        opacity: 0.30,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width * 1,
                  height: MediaQuery.of(context).size.height * 0.25,
                  bottom: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/vectors/2_4.png'),
                        opacity: 0.72,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width * 0.8,
                  height: MediaQuery.of(context).size.height * 0.2,
                  bottom: 10.0.h,
                  left: MediaQuery.of(context).size.width * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0.h,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OnBoardingScreen(),
                              ),
                            );
                          },
                          child: Text('انا مريض قلب',
                              style: TextStyle(
                                fontSize: 24.0.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                          color: redColor,
                        ),
                      ),
                      SizedBox(
                        height: 10.0.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50.0.h,
                        child: MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RegistrationScreen(),
                              ),
                            );
                          },
                          child: Text('انا متطوع',
                              style: TextStyle(
                                fontSize: 24.0.sp,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              )),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            50,
                          ),
                          color: redColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
