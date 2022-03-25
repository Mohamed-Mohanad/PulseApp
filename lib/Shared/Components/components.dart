import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Models/graph_data/graph_data.dart';
import '../Style/color.dart';
import '../Style/theme.dart';

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

class HorizontalSpace extends StatelessWidget {
  final double width;

  const HorizontalSpace({required this.width, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width.w,
    );
  }
}

class VerticalSpace extends StatelessWidget {
  final double height;

  const VerticalSpace({
    required this.height,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height.h,
    );
  }
}

class CustomCachedNetworkImage extends StatelessWidget {
  final double imageHeight;
  final double imageWidth;
  final String imageUrl;
  final BoxFit imageFit;

  const CustomCachedNetworkImage({
    Key? key,
    required this.imageHeight,
    required this.imageWidth,
    required this.imageUrl,
    required this.imageFit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, i) => Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: primaryColor,
        ),
      ),
      errorWidget: (context, url, error) => const Icon(
        Icons.error,
      ),
      height: imageHeight,
      width: imageWidth,
      fit: imageFit,
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
            fontWeight: FontWeight.w600,
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
        VerticalSpace(height: MediaQuery.of(context).size.height * 0.02),
      ],
    );
  }
}

class BuildTab extends StatelessWidget {
  final String image;
  final String title;
  final Color tabColor;
  final Function onPressTab;

  const BuildTab({
    Key? key,
    required this.tabColor,
    required this.title,
    required this.image,
    required this.onPressTab,
  }) : super(key: key);

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

class BuildHealthDataTab extends StatelessWidget {
  final String tabTitle;
  final Color tabColor;
  final List<GraphDataClass> graphPoint;

  const BuildHealthDataTab({
    Key? key,
    required this.graphPoint,
    required this.tabColor,
    required this.tabTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 88.h,
              width: double.infinity,
              color: tabColor,
              padding: const EdgeInsets.all(20.0),
              child: Text(
                tabTitle,
                textAlign: TextAlign.start,
                style: bodyText().copyWith(
                  color: Colors.white,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(
              height: 7.h,
            ),
            Container(
              height: 10.h,
              width: double.infinity,
              color: tabColor,
            ),
          ],
        ),
        SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 65.h,
              ),
              ClipRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    width: 340.0.w,
                    height: 208.0.h,
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200.withOpacity(0.5)),
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      series: <LineSeries<GraphDataClass, String>>[
                        LineSeries<GraphDataClass, String>(
                          color: tabColor,
                          dataSource: graphPoint,
                          xValueMapper: (GraphDataClass sales, _) => sales.year,
                          yValueMapper: (GraphDataClass sales, _) =>
                              sales.sales,
                          dataLabelSettings:
                              const DataLabelSettings(isVisible: true),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildDetailsHealthDataTab extends StatelessWidget {
  final String tabTitle;
  final Color tabColor;
  final List<GraphDataClass> graphPoint;

  const BuildDetailsHealthDataTab({
    Key? key,
    required this.graphPoint,
    required this.tabColor,
    required this.tabTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.h,
            ),
            Container(
              height: 88.h,
              width: double.infinity,
              color: tabColor,
              padding: const EdgeInsets.all(20.0),
            )
          ],
        ),
        Column(
          children: [
            Text(
              tabTitle,
              textAlign: TextAlign.start,
              style: bodyText().copyWith(
                color: Colors.black,
                fontSize: 36.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  width: 340.0.w,
                  height: 208.0.h,
                  decoration: BoxDecoration(
                      color: Colors.grey.shade200.withOpacity(0.5)),
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    series: <LineSeries<GraphDataClass, String>>[
                      LineSeries<GraphDataClass, String>(
                        color: tabColor,
                        dataSource: graphPoint,
                        xValueMapper: (GraphDataClass sales, _) => sales.year,
                        yValueMapper: (GraphDataClass sales, _) => sales.sales,
                        dataLabelSettings:
                            const DataLabelSettings(isVisible: true),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 37.h,
            ),
            Container(
              height: 7.h,
              width: double.infinity,
              color: tabColor,
            ),
          ],
        ),
      ],
    );
  }
}

class HeartTab extends StatelessWidget {
  const HeartTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildHealthDataTab(
      graphPoint: [
        GraphDataClass('Jan', 35),
        GraphDataClass('Feb', 28),
        GraphDataClass('Mar', 34),
        GraphDataClass('Apr', 32),
        GraphDataClass('May', 40),
      ],
      tabColor: redColor,
      tabTitle: "القلب",
    );
  }
}

class OxygenTab extends StatelessWidget {
  const OxygenTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildHealthDataTab(
      graphPoint: [
        GraphDataClass('Jan', 35),
        GraphDataClass('Feb', 28),
        GraphDataClass('Mar', 34),
        GraphDataClass('Apr', 32),
        GraphDataClass('May', 40)
      ],
      tabColor: primaryColor,
      tabTitle: "الاكسجين",
    );
  }
}

class TempTab extends StatelessWidget {
  const TempTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildHealthDataTab(
      graphPoint: [
        GraphDataClass('Jan', 35),
        GraphDataClass('Feb', 28),
        GraphDataClass('Mar', 34),
        GraphDataClass('Apr', 32),
        GraphDataClass('May', 40)
      ],
      tabColor: greenColor,
      tabTitle: "درجة الحرارة",
    );
  }
}

class BuildChatItem extends StatelessWidget {
  const BuildChatItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          15.0,
        ),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(
        5.0,
      ),
      child: Row(
        children: [
          Container(
            width: 70.w,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                15.0,
              ),
            ),
            clipBehavior: Clip.antiAlias,
            child: const Image(
              image: NetworkImage(
                  'https://www.hollywoodreporter.com/wp-content/uploads/2019/03/avatar-publicity_still-h_2019.jpg?w=1024'),
              fit: BoxFit.cover,
            ),
          ),
          HorizontalSpace(
            width: 15.w,
          ),
          Text(
            'أسماء خالد',
            style: bodyText().copyWith(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext c) {
                  return Wrap(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Divider(
                            color: Colors.grey,
                            height: 2.0,
                            thickness: 2,
                            indent: 3,
                            endIndent: 5,
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.help_outline_sharp,
                              color: Colors.black,
                            ),
                            title: Text(
                              'طلب المساعدة ',
                              style: bodyText().copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.location_on_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              'مشاركة الموقع',
                              style: bodyText().copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          ListTile(
                            leading: const Icon(
                              Icons.not_interested_outlined,
                              color: Colors.black,
                            ),
                            title: Text(
                              'إزالة من المقربون',
                              style: bodyText().copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                },
              );
            },
            icon: const Icon(
              Icons.more_vert,
              color: Color(0xff686868),
            ),
          ),
        ],
      ),
    );
  }
}

class DayTab extends StatelessWidget {
  const DayTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildHealthDataTab(
      graphPoint: [
        GraphDataClass('Jan', 35),
        GraphDataClass('Feb', 28),
        GraphDataClass('Mar', 34),
        GraphDataClass('Apr', 32),
        GraphDataClass('May', 40),
      ],
      tabColor: redColor,
      tabTitle: "القلب",
    );
  }
}

class WeekTab extends StatelessWidget {
  const WeekTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildHealthDataTab(
      graphPoint: [
        GraphDataClass('Jan', 35),
        GraphDataClass('Feb', 28),
        GraphDataClass('Mar', 34),
        GraphDataClass('Apr', 32),
        GraphDataClass('May', 40),
      ],
      tabColor: redColor,
      tabTitle: "القلب",
    );
  }
}

class MonthTab extends StatelessWidget {
  const MonthTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildHealthDataTab(
      graphPoint: [
        GraphDataClass('Jan', 35),
        GraphDataClass('Feb', 28),
        GraphDataClass('Mar', 34),
        GraphDataClass('Apr', 32),
        GraphDataClass('May', 40),
      ],
      tabColor: redColor,
      tabTitle: "القلب",
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
          image: AssetImage('assets/icons/pulseIcon.png'),
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
  const MyLine({Key? key}) : super(key: key);

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
  const OrRow({Key? key}) : super(key: key);

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
  const GoogleAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.65,
        height: size.height * 0.05,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            size.height * 0.05 * 0.5,
          ),
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
                      image: AssetImage('assets/icons/google.png'),
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

class WaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();
    path.lineTo(0.0, size.height * 0.7);

    var firstControlPoint = Offset(size.width * 0.5, size.height);
    var firstEndPoint = Offset(size.width * 0.75, size.height * 0.7);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width, size.height * 0.35);
    var secondEndPoint = Offset(size.width * 0.55, 0.0);
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
    var firstEndPoint = Offset(size.width * 0.2, size.height * 0.95);
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

class WaveClipperFour extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0, size.height * 0.58);

    var firstControlPoint = Offset(size.width * 0.15, size.height * 0.8);
    var firstEndPoint = Offset(size.width * 0.25, size.height * 0.7);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.45, size.height * 0.5);
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

class WaveClipperMountain extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    var firstControlPoint = Offset(0, size.height * 0.1);
    var firstEndPoint = Offset(size.width * 0.3, size.height * 0.3);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width * 0.45, size.height * 0.4);
    var secondEndPoint = Offset(size.width * 0.3, size.height * 0.5);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(size.width * 0.15, size.height * 0.6);
    var thirdEndPoint = Offset(size.width * 0.25, size.height * 0.7);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(size.width * 0.45, size.height * 0.9);
    var fourthEndPoint = Offset(size.width, size.height * 0.7);
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

class OneWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = Path();

    path.lineTo(0.0, size.height * 0.6);

    var firstControlPoint = Offset(size.width * 0.5, size.height);
    var firstEndPoint = Offset(size.width, size.height * 0.6);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(size.width, 0.0);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

class Header extends StatelessWidget {
  final String title;

  const Header({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(
        top: size.height * 0.03,
      ),
      alignment: Alignment.centerRight,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 5,
        ),
        child: Text(
          title,
          style: headLine().copyWith(
            color: blackColor,
          ),
        ),
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 1.0,
            style: BorderStyle.solid,
            color: blackColor,
          ),
        ),
      ),
    );
  }
}

class CalculateBox extends StatelessWidget {
  final double width;
  final String header;
  final Widget child;

  const CalculateBox(
      {Key? key,
      required this.width,
      required this.header,
      required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.05,
        vertical: size.height * 0.02,
      ),
      child: Column(
        children: [
          Container(
            width: size.width * 0.32,
            child: Text(
              header,
              style: caption(),
            ),
          ),
          Container(
            width: width,
            padding: EdgeInsets.symmetric(
              horizontal: 12.0.w,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              color: greyColor2.withOpacity(0.3),
              border: Border.all(
                color: greyColor1,
                style: BorderStyle.solid,
                width: 1.0,
              ),
            ),
            child: child,
          ),
        ],
      ),
    );
  }
}

class MyTimer extends StatelessWidget {
  String timer;
  var cubit;
  Function function;

  MyTimer({
    Key? key,
    required this.timer,
    required this.cubit,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).push(
          showPicker(
            context: context,
            onChange: (value) {
              function(value);
            },
            value: TimeOfDay.now(),
            minuteInterval: MinuteInterval.FIVE,
            is24HrFormat: true,
            onChangeDateTime: (DateTime dateTime) {
              function(dateTime);
            },
          ),
        );
      },
      child: Text(
        timer == '' ? '00:00' : timer,
        style: bodyText(),
      ),
    );
  }
}

class GetHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class ProfileName extends StatelessWidget {
  final String name;

  const ProfileName({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class Heading extends StatelessWidget {
  final String heading;

  const Heading({
    Key? key,
    required this.heading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}

class DetailsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class SettingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
}

class MyListTile extends StatelessWidget {
  final String text;
  final IconData icon;

  const MyListTile({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
        size: MediaQuery.of(context).size.width * 0.07,
      ),
      title: Text(
        text,
        style: bodyText().copyWith(
          fontSize: 23.0.sp,
        ),
      ),
    );
  }
}

class Content extends StatelessWidget {
  final String text;
  final IconData icon;

  const Content({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 10.0.h,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey,
            size: 30.0,
          ),
          const HorizontalSpace(width: 30.0),
          TextButton(
            onPressed: () {},
            child: Text(
              text,
              style: bodyText().copyWith(
                fontSize: 23.0.sp,
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopBlur extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Positioned(
      child: Opacity(
        opacity: 0.5,
        child: Container(
          width: size.width,
          height: size.height * 0.2,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [
                0.0,
                0.2,
                0.8,
              ],
              colors: [
                primaryColor.withOpacity(0.9),
                primaryColor.withOpacity(0.5),
                Colors.white,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
