import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Layout/onboarding_advices/onboarding_advices.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class HelperHomeScreen extends StatefulWidget {
  const HelperHomeScreen({Key? key}) : super(key: key);

  @override
  State<HelperHomeScreen> createState() => _HelperHomeScreenState();
}

class _HelperHomeScreenState extends State<HelperHomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
              child: Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipperFirst(),
                  child: Container(
                    color: primaryColor.withOpacity(0.7),
                    height: size.height * 0.1,
                    width: size.width,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipperBack_1(),
                  child: Container(
                    color: primaryColor.withOpacity(0.6),
                    height: size.height * 0.07,
                    width: size.width,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipperBack_1(),
                  child: Container(
                    color: primaryColor.withOpacity(0.5),
                    height: size.height * 0.04,
                    width: size.width,
                  ),
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(
                  size.width * 0.05,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Logo(
                          width: size.width * 0.2,
                          height: size.height * 0.1,
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: const [
                                0.0,
                                0.9,
                              ],
                              colors: [
                                greyColor2.withOpacity(0.1),
                                Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: greyColor2.withOpacity(0.5),
                            ),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 3,
                                child: Container(
                                  width: size.width * 0.5,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image:
                                      AssetImage('assets/images/earth.png'),
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '6,534',
                                          style: bodyText().copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          'متطوع',
                                          style: caption().copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: size.width * 0.15,
                                        vertical: 10.0,
                                      ),
                                      child: Container(
                                        width: 1.0,
                                        height: size.height,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                      MainAxisAlignment.center,
                                      crossAxisAlignment:
                                      CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '643',
                                          style: bodyText().copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 25,
                                          ),
                                        ),
                                        Text(
                                          'مريض',
                                          style: caption().copyWith(
                                            fontWeight: FontWeight.w200,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalSpace(
                        height: size.height * 0.02,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: const [
                                0.0,
                                0.9,
                              ],
                              colors: [
                                greyColor2.withOpacity(0.1),
                                Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: greyColor2.withOpacity(0.5),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RichText(
                                text: TextSpan(
                                  text: 'مرحبا, ',
                                  style: caption().copyWith(
                                    color: Colors.black87,
                                  ),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'احمد',
                                      style: bodyText().copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              VerticalSpace(
                                height: 15.0,
                              ),
                              Text(
                                'متطوع منذ 3 مارس, 2022',
                                style: caption(),
                              ),
                              const VerticalSpace(
                                height: 5.0,
                              ),
                              Container(
                                height: size.height * 0.04,
                                width: size.width * 0.2,
                                decoration: BoxDecoration(
                                  color: greyColor2.withOpacity(0.4),
                                  borderRadius: BorderRadius.circular(size.height * 0.02),
                                ),
                                child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'العربية',
                                    style: caption(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalSpace(
                        height: size.height * 0.02,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: size.width,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              stops: const [
                                0.0,
                                0.9,
                              ],
                              colors: [
                                greyColor2.withOpacity(0.1),
                                Colors.white,
                              ],
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                              color: greyColor2.withOpacity(0.5),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.notifications,
                                color: primaryColor,
                                size: size.width * 0.08,
                              ),
                              Container(
                                padding: EdgeInsets.only(
                                  left: size.width * 0.12,
                                  right: size.width * 0.02,
                                ),
                                child: Text(
                                  'سوف تستلم اشعار عندما يكون هناك شخص \nبحاجة اليك',
                                  style: caption().copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      VerticalSpace(
                        height: size.height * 0.02,
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 10.0.h),
                          child: MaterialButton(
                            color: primaryColor.withOpacity(0.8),
                            minWidth: size.width,
                            height: size.height,
                            onPressed: () {
                              navigateTo(context, const OnBoardingAdvicesScreen());
                            },
                            textColor: Colors.white,
                            elevation: 7.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              'تعلم كيف تنقذ الأشخاص',
                              style: bodyText().copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 22.0.sp,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: VerticalSpace(
                          height: size.height * 0.02,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
