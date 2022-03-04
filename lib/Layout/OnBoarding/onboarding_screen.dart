import 'package:flutter/material.dart';
import 'package:pulse/Models/onboarding_data/onboard_data.dart';
import 'package:pulse/Layout/signup_screen/signup_screen.dart';
import 'package:pulse/Shared/Components/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../Shared/Style/color.dart';
import '../registration_screen/registration_screen.dart';

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
            flex: 1,
            child: Stack(
              children: [
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  top: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/vectors/3_1.png'),
                        opacity: 0.72,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.2,
                  top: 0.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/vectors/3_2.png'),
                        opacity: 0.46,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Logo(
                    height: size.height * 0.5,
                    width: size.width * 0.3,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
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
          Container(
            height: size.height * 0.15,
            width: size.width,
            padding: EdgeInsets.symmetric(
              horizontal: size.width * 0.1,
              vertical: 10.0,
            ),
            child: Row(
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
                  backgroundColor: redColor.withOpacity(0.5),
                  elevation: 0.0,
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                ),
              ],
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
            style: Theme.of(context).textTheme.subtitle1,
            textDirection: TextDirection.rtl,
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          model.body,
          style: Theme.of(context).textTheme.caption,
          textDirection: TextDirection.rtl,
        ),
      ],
    );
  }
}
