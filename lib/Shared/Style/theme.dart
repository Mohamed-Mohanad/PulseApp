import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color.dart';

ThemeData lightMode = ThemeData(
  dialogTheme: DialogTheme(
    backgroundColor: Colors.white,
    contentTextStyle: TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    elevation: 20.0,
  ),
  canvasColor: Colors.white,
  dividerColor: Colors.black26,
  primarySwatch: primarySwatchColor,
  appBarTheme: AppBarTheme(
    titleSpacing: 20.0.w,
    iconTheme: IconThemeData(
      color: blackColor,
    ),
    backgroundColor: Colors.white,
    elevation: 0.0,
    systemOverlayStyle: const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
    ),
    titleTextStyle: TextStyle(
      color: primaryColor,
      fontSize: 20.0.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Tajawal",
    ),
  ),
  iconTheme: IconThemeData(
    color: blackColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    elevation: 15.0,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  fontFamily: "Tajawal",
);

TextStyle bodyText() => TextStyle(
      fontSize: 16.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black,
      fontFamily: "Tajawal",
    );

TextStyle subTitle() => TextStyle(
      fontSize: 14.0.sp,
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      height: 1.3.h,
    );

TextStyle caption() => TextStyle(
      fontSize: 13.0.sp,
      color: Colors.grey,
      fontFamily: "Tajawal",
    );

TextStyle headLine() => TextStyle(
      fontSize: 25.0.sp,
      fontWeight: FontWeight.w800,
      color: Colors.black,
      fontFamily: "Tajawal",
    );

TextStyle appBarText() => TextStyle(
      color: primaryColor,
      fontSize: 20.0.sp,
      fontWeight: FontWeight.bold,
      fontFamily: "Tajawal",
    );
