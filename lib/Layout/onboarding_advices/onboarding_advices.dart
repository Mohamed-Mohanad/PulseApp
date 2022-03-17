import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Models/onboarding_advices_data/onboarding_advices_data.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';
import '../registration_screen/registration_screen.dart';

class OnBoardingAdvicesScreen extends StatefulWidget {
  const OnBoardingAdvicesScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingAdvicesScreen> createState() => _OnBoardingAdvicesScreen();
}

class _OnBoardingAdvicesScreen extends State<OnBoardingAdvicesScreen> {
  var pageController = PageController();
  bool isLast = false;
  int index = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
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
                      width: size.width * 0.3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.05,
                        horizontal: size.width * 0.04,
                      ),
                      child: PageView.builder(
                        physics: const BouncingScrollPhysics(),
                        controller: pageController,
                        onPageChanged: (index) {
                          if (index == OnBoardingAdvicesContents.length - 1) {
                            setState(() {
                              isLast = true;
                              this.index = index;
                            });
                          } else {
                            setState(() {
                              isLast = false;
                              this.index = index;
                            });
                          }
                        },
                        itemBuilder: (context, index) => BuildBoardingItem(
                          model: OnBoardingAdvicesContents[index],
                        ),
                        itemCount: OnBoardingAdvicesContents.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              height: size.height * 0.15,
              width: size.width,
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
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
                        if (index == 0) {
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
                  Container(
                    child: Center(
                      child: Row(
                        children: [
                          SmoothPageIndicator(
                            axisDirection: Axis.horizontal,
                            controller: pageController,
                            effect: ExpandingDotsEffect(
                              spacing: size.width * 0.03,
                              radius: 5.0,
                              dotWidth: 5.0,
                              dotHeight: 5.0,
                              paintStyle: PaintingStyle.fill,
                              dotColor: primaryColor,
                            ),
                            count: OnBoardingAdvicesContents.length,
                          ),
                        ],
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
                    backgroundColor: redColor.withOpacity(0.25 * (index + 1)),
                    elevation: 0.0,
                    child: const Icon(
                      Icons.arrow_forward_ios,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BuildBoardingItem extends StatelessWidget {
  final OnBoardingAdvices model;

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
        const SizedBox(
          height: 50,
        ),
        Text(
          model.body,
          style: bodyText(),
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
