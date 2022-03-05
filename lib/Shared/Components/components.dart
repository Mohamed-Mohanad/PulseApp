import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../Style/color.dart';

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
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
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
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
    return TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: label,
      ),
      textDirection: TextDirection.rtl,
    );
  }
}

class BuildTab extends StatelessWidget {
  final String image;
  final String title;
  final Color tabColor;
  final Function onPressTab;

  const BuildTab(
      {Key? key,
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
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
    Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
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
                child: Image.asset("assets/images/background.png",
                    width: size.width),
              ),
            ),
            child,
          ],
        ),
      ),
    );
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
          width: MediaQuery.of(context).size.width * 0.4,
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
            style: Theme.of(context).textTheme.bodyText1,
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
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: backgroundColor,
        ),
        child: InkWell(
          onTap: () {
            print('pressed');
          },
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Center(
                  child: Text(
                    'المتابعة مع جوجل',
                    style: Theme.of(context).textTheme.bodyText1?.copyWith(
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