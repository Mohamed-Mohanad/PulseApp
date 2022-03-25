import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Models/onboarding_data/onboard_data.dart';
import '../../Modules/registration_screen/registration_screen.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';
import '../../cubits/onboarding/onboarding_cubit.dart';
import '../../cubits/onboarding/onboarding_states.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var pageController = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocConsumer<OnBoardingCubit, OnBoardingStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = OnBoardingCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: size.height * 0.15,
                child: Stack(
                  children: [
                    ClipPath(
                      clipper: WaveClipperFirst(),
                      child: Container(
                        color: greenColor.withOpacity(0.6),
                        height: size.height,
                        width: size.width,
                      ),
                    ),
                    ClipPath(
                      clipper: WaveClipperSecond(),
                      child: Container(
                        color: primaryColor.withOpacity(0.3),
                        height: size.height,
                        width: size.width,
                      ),
                    ),
                    SafeArea(
                      child: Container(
                        alignment: Alignment.topCenter,
                        child: Logo(
                          height: size.height * 0.1,
                          width: size.width * 0.25,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: size.width,
                      height: 15.0.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0.w,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SmoothPageIndicator(
                            axisDirection: Axis.horizontal,
                            controller: pageController,
                            effect: ScrollingDotsEffect(
                              spacing: 100.0.w,
                              radius: 5.0,
                              dotWidth: 10.0,
                              dotHeight: 10.0,
                              paintStyle: PaintingStyle.fill,
                              dotColor: Colors.black,
                              activeDotColor:
                                  onBoardingContents[cubit.currentIndex].color,
                            ),
                            count: onBoardingContents.length,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: size.height * 0.68,
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.04,
                      ),
                      child: PageView.builder(
                        controller: pageController,
                        onPageChanged: (index) {
                          if (index == onBoardingContents.length - 1) {
                            isLast = true;
                            cubit.changeBoard(index);
                          } else {
                            isLast = false;
                            cubit.changeBoard(index);
                          }
                        },
                        itemBuilder: (context, index) => BuildBoardingItem(
                          model: onBoardingContents[index],
                        ),
                        itemCount: onBoardingContents.length,
                      ),
                    ),
                    Container(
                      height: size.height * 0.12,
                      width: size.width,
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              color: Color(0xf4f4f4f4),
                              borderRadius: BorderRadius.all(
                                Radius.circular(25.0),
                              ),
                            ),
                            child: IconButton(
                              onPressed: () {
                                if (cubit.currentIndex == 0) {
                                  Navigator.pop(context);
                                } else {
                                  pageController.previousPage(
                                    duration: const Duration(
                                      milliseconds: 700,
                                    ),
                                    curve: Curves.easeInOut,
                                  );
                                }
                              },
                              icon: const Icon(
                                Icons.arrow_back,
                                size: 30.0,
                              ),
                            ),
                          ),
                          FloatingActionButton(
                            onPressed: () {
                              if (isLast) {
                                navigateAndFinish(
                                  context,
                                  RegistrationScreen(),
                                );
                              } else {
                                pageController.nextPage(
                                  duration: const Duration(
                                    milliseconds: 700,
                                  ),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            backgroundColor: redColor
                                .withOpacity(0.33 * (cubit.currentIndex + 1)),
                            elevation: 0.0,
                            child: const Icon(
                              Icons.arrow_forward_ios,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class BuildBoardingItem extends StatelessWidget {
  final OnBoarding model;

  const BuildBoardingItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(
          image: AssetImage(model.image),
        ),
        const VerticalSpace(height: 30.0),
        Center(
          child: Text(
            model.title,
            style: headLine(),
            textDirection: TextDirection.rtl,
          ),
        ),
        const VerticalSpace(height: 15.0),
        Text(
          model.body,
          style: subTitle(),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
