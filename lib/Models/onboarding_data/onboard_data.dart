import 'package:flutter/material.dart';

import '../../Shared/Style/color.dart';

class OnBoarding {
  final String image;
  final String title;
  final String body;
  final Color color;

  OnBoarding({
    required this.image,
    required this.title,
    required this.body,
    required this.color,
  });
}

List<OnBoarding> onBoardingContents = [
  OnBoarding(
    image: 'assets/images/Open Peeps Standing.png',
    title: 'تابع مؤشراتك الحيوية',
    body:
        'يمكنك متابعة )نبضات قلبك - نسبة الأكسجين في الدم - درجة حرارت جسمك( وسوف نهتم بك في حالة حدوث اي خلل',
    color: redColor,
  ),
  OnBoarding(
    image: 'assets/images/Open Peeps Together.png',
    title: 'الأقارب بجانبك',
    body: 'يمكن للأقارب العثور عليك في اي وقت وفي حالة تعرضك لأي متاعب',
    color: primaryColor,
  ),
  OnBoarding(
    image: 'assets/images/Wavy Buddies Address.png',
    title: 'الجميع بجانبك',
    body:
        'يمكنك بتفعيل وضع المساعدة للجميع الحصول علي الكثير من المتطوعين لمساعدتك في حالة تعرضك لأي متاعب',
    color: greenColor,
  ),
];
