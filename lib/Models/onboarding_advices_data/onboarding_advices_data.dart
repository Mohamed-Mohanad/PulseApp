class OnBoardingAdvices {
  final String image;
  final String body;

  OnBoardingAdvices({
    required this.image,
    required this.body,
  });
}

List<OnBoardingAdvices> OnBoardingAdvicesContents = [
  OnBoardingAdvices(
    image: 'assets/images/Hands Phone.png',
    body:
        'اضغط علي الموافقة بعد, الأطلاع علي حالة المريض لتعرف كيف تقوم بمساعدته',
  ),
  OnBoardingAdvices(
    image: 'assets/images/Wavy Buddies Address.png',
    body: 'قم بالأطلاع علي موقع المريض لتصل اليه في اقرب وقت',
  ),
  OnBoardingAdvices(
    image: 'assets/images/The Little Things Working.png',
    body: 'اتبع النصائح لمساعدة المريض',
  ),
  OnBoardingAdvices(
    image: 'assets/images/Lifesavers One on One.png',
    body:
        'يمكنك الحصول علي مساعدة عن طريق الأطلاع علي مستشفيات والصيدليات القريبة',
  ),
];
