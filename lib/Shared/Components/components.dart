import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Cubit/cubit.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../Models/GraphData/graph_data.dart';
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

AppLocalizations getLang(context) => AppLocalizations.of(context)!;

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
          style: Theme.of(context).textTheme.bodyText1?.copyWith(
                color: textColor,
              ),
        ),
      ),
    );
  }
}

class BuildTab extends StatelessWidget {
  final String image;
  final String title;
  final Color tabColor;
  final Function onPressTab;
  const BuildTab({Key? key, required this.tabColor, required this.title, required this.image, required this.onPressTab}) : super(key: key);

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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1!
                  .copyWith(
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
                style: Theme.of(context).textTheme.bodyText1!.copyWith(
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
        GraphDataClass('May', 40)
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
Widget buildChatItem(BuildContext context) =>
    Container(
      decoration:  BoxDecoration(
        border: Border(
          top: BorderSide(width: 1.5, color: Color(0xFFBFBFBF)),
          left: BorderSide(width: 1.5, color: Color(0xFFBFBFBF)),
          right: BorderSide(width: 1.5, color: Color(0xFFBFBFBF)),
          bottom: BorderSide(width: 1.5, color: Color(0xFFBFBFBF)),
        ),
        color: Color(0xFFBFBFBF),

      ),

      child: Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                  radius: 30.0,
                  backgroundImage: NetworkImage('https://www.hollywoodreporter.com/wp-content/uploads/2019/03/avatar-publicity_still-h_2019.jpg?w=1024')),
              Padding(
                padding: const EdgeInsetsDirectional.only(
                  bottom: 3.0,
                  end: 3.0,
                ),
                child: CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'أسماء خالد',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children:
                  [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 100.0,
                      ),

                    ),
                    IconButton(onPressed:(){
                      _bottomSheet(context);
                    }, icon: Icon(Icons.more_vert))
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
_bottomSheet(context){
  showModalBottomSheet(context: context, builder: (BuildContext c){
    return Wrap(
      children: [
        Container(
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.center,
            children: const <Widget>[
            Divider(
                color: Colors.grey,
                height: 2.0,
                thickness: 2,
                indent: 3,
                endIndent:5,
              ),
              ListTile(
                leading: Icon(Icons.help_outline_sharp),
                title: Text('طلب المساعدة '),
              ),
              ListTile(
                leading: Icon(Icons.location_on_outlined),
                title: Text('مشاركة الموقع'),
              ),
              ListTile(
                leading:Icon(Icons.not_interested_outlined),
                title: Text('ازالة المقربون'),
              ),
            ],
          ),
        ),
      ],
    );
  });

}
