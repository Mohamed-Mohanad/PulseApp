import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Models/onboarding_data/onboard_data.dart';
import '../../Modules/registration_screen/registration_screen.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
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
                      height: size.height * 0.2,
                      width: size.width * 0.25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: size.width,
                  height: 20.0,
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.01,
                  ),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SmoothPageIndicator(
                          axisDirection: Axis.horizontal,
                          controller: pageController,
                          effect: ScrollingDotsEffect(
                            spacing: size.width * 0.3,
                            radius: 5.0,
                            dotWidth: 10.0,
                            dotHeight: 10.0,
                            paintStyle: PaintingStyle.fill,
                            dotColor: Colors.black,
                            activeDotColor: onBoardingContents[index].color,
                          ),
                          count: onBoardingContents.length,
                        ),
                      ],
                    ),
                  ),
                ),
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
                        if (index == onBoardingContents.length - 1) {
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
                        model: onBoardingContents[index],
                      ),
                      itemCount: onBoardingContents.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: size.height * 0.15,
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
                    backgroundColor: redColor.withOpacity(0.33 * (index + 1)),
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
        const SizedBox(
          height: 30,
        ),
        Center(
          child: Text(
            model.title,
            style: subTitle(),
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(
          height: 15,
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
