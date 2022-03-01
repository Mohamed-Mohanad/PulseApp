import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Style/color.dart';

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
      color: primaryColor,
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
    ),
  ),
  iconTheme: IconThemeData(
    color: primaryColor,
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    type: BottomNavigationBarType.fixed,
    selectedItemColor: primaryColor,
    elevation: 15.0,
    unselectedItemColor: Colors.grey,
    backgroundColor: Colors.white,
  ),
  textTheme: TextTheme(
    headline1: TextStyle(
      fontSize: 36.0.sp,
      fontWeight: FontWeight.w800,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 24.0.sp,
      fontWeight: FontWeight.normal,
      color: Colors.black,
    ),
    subtitle1: TextStyle(
      fontSize: 18.0.sp,
      fontWeight: FontWeight.w800,
      color: Colors.grey,
      height: 1.3.sp,
    ),
    caption: TextStyle(
      fontSize: 15.0.sp,
      color: Colors.grey,
    ),
  ),
);
