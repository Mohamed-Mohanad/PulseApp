import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse/Shared/Style/theme.dart';

import '../Style/color.dart';

void navigateTo(context, widget) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

navigateAndFinish(context, widget) =>
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
          (Route<dynamic> route) => false,
    );

///SHOW TOAST
enum ToastStates {
  success,
  error,
  warning,
}

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.success:
      color = Colors.green;
      break;
    case ToastStates.error:
      color = Colors.red;
      break;
    case ToastStates.warning:
      color = Colors.yellow;
      break;
  }
  return color;
}

class HorizontalSpace extends StatelessWidget {
  final double width;

  const HorizontalSpace({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double height;

  const VerticalSpace({required this.height, Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class DefaultButton extends StatelessWidget {
  final Function onPressed;
  final double width;
  final double height;
  final double borderRadius;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  const DefaultButton({
    Key? key,
    required this.height,
    required this.width,
    required this.borderRadius,
    required this.buttonColor,
    required this.onPressed,
    required this.textColor,
    required this.buttonText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: MaterialButton(
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        color: buttonColor,
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: bodyText().copyWith(
            color: textColor,
          ),
        ),
      ),
    );
  }
}

class NormalButton extends StatelessWidget {
  final Color buttonColor;
  final IconData icon;

  const NormalButton({
    Key? key,
    required this.buttonColor,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 25,
      width: 25,
      child: Center(
        child: IconButton(
          icon: Icon(
            icon,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          color: buttonColor,
        ),
      ),
    );
  }
}

class DefaultTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType type;
  final bool isPassword;
  final String label;

  const DefaultTextField({
    Key? key,
    required this.controller,
    required this.type,
    this.isPassword = false,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          keyboardType: type,
          obscureText: isPassword,
          decoration: InputDecoration(
            labelText: label,
          ),
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
        ),
        SizedBox(height: MediaQuery
            .of(context)
            .size
            .height * 0.02),
      ],
    );
  }
}

class DefaultRadioButton extends StatelessWidget {
  late final String label;
  late int value;
  late int group;
  late final Function onChange;
  late final Color activeColor;

  DefaultRadioButton({
    required this.label,
    required this.value,
    required this.group,
    required this.onChange,
    required this.activeColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      leading: Radio(
        value: value,
        groupValue: group,
        onChanged: (value) {
          onChange(value);
        },
        activeColor: activeColor,
      ),
    );
  }
}

class BuildTab extends StatelessWidget {
  final String image;
  final String title;
  final Color tabColor;
  final Function onPressTab;

  const BuildTab({Key? key,
    required this.tabColor,
    required this.title,
    required this.image,
    required this.onPressTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressTab();
      },
      child: Container(
        width: 100.w,
        height: 72.h,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(
              10.0,
            ),
            topLeft: Radius.circular(
              10.0,
            ),
          ),
          color: tabColor,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              title,
              style: bodyText().copyWith(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Circle extends StatelessWidget {
  final Color color;

  const Circle({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 5.5.sp,
      backgroundColor: blackColor,
      child: CircleAvatar(
        radius: 4.5.sp,
        backgroundColor: color,
      ),
    );
  }
}

class Logo extends StatelessWidget {
  final double width;
  final double height;

  const Logo({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/logo/logo.png'),
        ),
      ),
    );
  }
}

class Background extends StatelessWidget {
  final Widget child;

  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return SingleChildScrollView(
      child: Container(
        color: greenColor.withOpacity(0.2),
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Positioned(
              top: 0,
              right: 0,
              child: Opacity(
                opacity: 0.3,
                child: ClipPath(
                  clipper: WaveClipperBack_1(),
                  child: Container(
                    color: primaryColor.withOpacity(0.8),
                    height: size.height,
                    width: size.width,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0.0,
              child: Opacity(
                opacity: 0.3,
                child: Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.rotationZ(22 / 7),
                  child: ClipPath(
                    clipper: WaveClipperBack_2(),
                    child: Container(
                      color: redColor.withOpacity(0.2),
                      height: size.height,
                      width: size.width,
                    ),
                  ),
                ),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}

class WaveClipperBack_1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0.0, size.height * 0.8);

    var firstControlPoint = Offset(size.width * 0.15, size.height);
    var firstEndPoint = Offset(size.width * 0.3, size.height * 0.6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.4, size.height * 0.3);
    var secondEndPoint = Offset(size.width * 0.5, size.height * 0.45);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.6, size.height * 0.55);
    var thirdEndPoint = Offset(size.width * 0.75, size.height * 0.4);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipperBack_2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0.0, size.height * 0.808);

    var firstControlPoint = Offset(size.width * 0.23, size.height * 0.65);
    var firstEndPoint = Offset(size.width * 0.23, size.height * 0.65);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.4, size.height * 0.5);
    var secondEndPoint = Offset(size.width * 0.45, size.height * 0.55);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.6, size.height * 0.85);
    var thirdEndPoint = Offset(size.width * 0.86, size.height * 0.2);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(size.width * 0.9, size.height * 0.15);
    var fourthEndPoint = Offset(size.width, size.height * 0.205);
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


class MyLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
        ),
        child: Container(
          width: MediaQuery
              .of(context)
              .size
              .width * 0.4,
          height: 1.0,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class OrRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyLine(),
          Text(
            'او',
            style: bodyText(),
          ),
          MyLine(),
        ],
      ),
    );
  }
}

class GoogleAuth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Center(
      child: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.65,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.height * 0.05 * 0.5,),
          color: backgroundColor,
        ),
        child: InkWell(
          onTap: () {},
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    'المتابعة مع جوجل',
                    style: caption().copyWith(
                      color: const Color(0xff7f7f7f),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo/google.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class WaveClipperFirst extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0.0, size.height * 0.8);

    var firstControlPoint = Offset(size.width * 0.15, size.height);
    var firstEndPoint = Offset(size.width * 0.3, size.height * 0.6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.4, size.height * 0.3);
    var secondEndPoint = Offset(size.width * 0.5, size.height * 0.45);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.6, size.height * 0.55);
    var thirdEndPoint = Offset(size.width * 0.75, size.height * 0.4);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, size.height * 0.2);
    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class WaveClipperSecond extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0.0, size.height * 0.5);

    var firstControlPoint = Offset(size.width * 0.25, size.height);
    var firstEndPoint = Offset(size.width * 0.5, size.height * 0.6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.6, size.height * 0.4);
    var secondEndPoint = Offset(size.width * 0.65, size.height * 0.5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.8, size.height * 0.7);
    var thirdEndPoint = Offset(size.width, size.height * 0.4);
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
