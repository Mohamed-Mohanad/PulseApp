import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Layout/OnBoarding/onboarding_screen.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Style/theme.dart';
import '../../Shared/Style/color.dart';
import '../registration_screen/registration_screen.dart';

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
            Positioned(
              top: 0,
              left: 0,
              child: ClipPath(
                clipper: WaveClipper(),
                child: Container(
                  color: redColor.withOpacity(0.7),
                  height: size.height * 0.35,
                  width: size.width * 0.75,
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 0,
              child: ClipPath(
                clipper: WaveClipperSec(),
                child: Container(
                  color: primaryColor.withOpacity(0.6),
                  height: size.height * 0.27,
                  width: size.width * 0.97,
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(22 / 7),
                child: ClipPath(
                  clipper: WaveClipperThi(),
                  child: Container(
                    color: primaryColor.withOpacity(0.25),
                    height: size.height * 0.3,
                    width: size.width,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Transform(
                alignment: Alignment.center,
                transform: Matrix4.rotationZ(22 / 7),
                child: ClipPath(
                  clipper: WaveClipperFour(),
                  child: Container(
                    color: greenColor.withOpacity(0.6),
                    height: size.height * 0.3,
                    width: size.width,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(
                  horizontal: 40.0.w,
                  vertical: 10.0.h,
                ),
                alignment: Alignment.topRight,
                child: Container(
                  width: size.width * 0.45,
                  child: Text(
                    'مرحبا بك, في تطبيق',
                    textWidthBasis: TextWidthBasis.parent,
                    style: headLine().copyWith(
                      color: whitColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 36.sp,
                      height: 1.3.sp,
                    ),
                    textDirection: TextDirection.rtl,
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Logo(
                    width: size.width * 0.7,
                    height: size.height * 0.05,
                  ),
                  VerticalSpace(
                    height: size.height * 0.1,
                  ),
                  Container(
                    width: size.width * 0.2,
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
                  VerticalSpace(
                    height: size.height * 0.015,
                  ),
                  Container(
                    width: size.width * 0.6,
                    child: Text(
                      'هو تطبيق جوال للرعاية الصحية '
                      'يهدف إلى تسهيل حياة الأشخاص '
                      'المعرضين لخطر الإصابة بنوبة قلبية '
                      'وإنقاذ حياتهم في المواقف الخطرة',
                      style: bodyText(),
                      maxLines: 4,
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              width: size.width,
              height: size.height * 0.2,
              bottom: 0.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DefaultButton(
                    height: size.height.h * 0.065,
                    width: size.width.w * 0.85,
                    onPressed: () {
                      navigateTo(context, const OnBoardingScreen());
                    },
                    textColor: Colors.white,
                    borderRadius: 50,
                    buttonColor: redColor,
                    buttonText: 'انا مريض قلب',
                  ),
                  VerticalSpace(
                    height: size.height * 0.01,
                  ),
                  DefaultButton(
                    height: size.height.h * 0.065,
                    width: size.width.w * 0.85,
                    onPressed: () {
                      navigateTo(context, RegistrationScreen());
                    },
                    textColor: Colors.white,
                    borderRadius: 50,
                    buttonColor: redColor,
                    buttonText: 'انا متطوع',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
