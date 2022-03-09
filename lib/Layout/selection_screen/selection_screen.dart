import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse/Shared/Style/theme.dart';

import '../../Shared/Components/components.dart';
import '../OnBoarding/onboarding_screen.dart';
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
            ClipPath(
              clipper: WaveClipper(),
              child: Container(
                color: redColor.withOpacity(0.7),
                height: size.height * 0.34,
                width: size.width * 0.7,
              ),
            ),
            ClipPath(
              clipper: WaveClipperSec(),
              child: Container(
                color: primaryColor.withOpacity(0.6),
                height: size.height * 0.27,
                width: size.width,
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
                    height: size.height * 0.28,
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
                  clipper: WaveClipperFor(),
                  child: Container(
                    color: greenColor.withOpacity(0.6),
                    height: size.height * 0.28,
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
                    width: size.width * 0.5,
                    height: size.height * 0.1,
                  ),
                  SizedBox(
                    height: 110.0.h,
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
                  SizedBox(
                    height: 10.0.h,
                  ),
                  Container(
                    width: size.width * 0.8,
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
                      navigateTo(context, OnBoardingScreen());
                    },
                    textColor: Colors.white,
                    borderRadius: 50,
                    buttonColor: redColor,
                    buttonText: 'انا مريض قلب',
                  ),
                  SizedBox(
                    height: 10.0.h,
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

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0.0, size.height * 0.8);

    var firstControlPoint = Offset(size.width * 0.5, size.height);
    var firstEndPoint = Offset(size.width * 0.85, size.height * 0.6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width, size.height * 0.38);
    var secondEndPoint = Offset(size.width * 0.9, 0.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipperSec extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    var zeroControlPoint = Offset(size.width * 0.06, size.height * 0.3);
    var zeroEndPoint = Offset(size.width * 0.07, size.height * 0.5);
    path.quadraticBezierTo(zeroControlPoint.dx, zeroControlPoint.dy,
        zeroEndPoint.dx, zeroEndPoint.dy);

    var firstControlPoint = Offset(size.width * 0.09, size.height * 0.92);
    var firstEndPoint = Offset(size.width * 0.15, size.height * 0.95);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.4, size.height);
    var secondEndPoint = Offset(size.width * 0.6, size.height * 0.72);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.88, size.height * 0.6);
    var thirdEndPoint = Offset(size.width, size.height * 0.5);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipperThi extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0, size.height * 0.75);

    var firstControlPoint = Offset(size.width * 0.17, size.height * 0.6);
    var firstEndPoint = Offset(size.width * 0.25, size.height * 0.7);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.25, size.height * 0.7);
    var secondEndPoint = Offset(size.width * 0.38, size.height * 0.85);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.5, size.height);
    var thirdEndPoint = Offset(size.width * 0.65, size.height * 0.85);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(size.width * 0.95, size.height * 0.5);
    var fourthEndPoint = Offset(size.width, size.height * 0.2);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipperFor extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0, size.height * 0.58);

    var zeroControlPoint = Offset(size.width * 0.13, size.height * 0.65);
    var zeroEndPoint = Offset(size.width * 0.13, size.height * 0.65);
    path.quadraticBezierTo(zeroControlPoint.dx, zeroControlPoint.dy,
        zeroEndPoint.dx, zeroEndPoint.dy);

    var firstControlPoint = Offset(size.width * 0.2, size.height * 0.7);
    var firstEndPoint = Offset(size.width * 0.25, size.height * 0.7);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.45, size.height * 0.55);
    var secondEndPoint = Offset(size.width * 0.58, size.height * 0.8);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.7, size.height);
    var thirdEndPoint = Offset(size.width * 0.85, size.height * 0.85);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(size.width * 0.95, size.height * 0.75);
    var fourthEndPoint = Offset(size.width, size.height * 0.6);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
