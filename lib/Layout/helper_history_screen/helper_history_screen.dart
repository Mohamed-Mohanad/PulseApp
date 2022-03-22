import 'package:flutter/material.dart';

import '../../Models/history_data/history_data.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class HelperHistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                ClipPath(
                  clipper: OneWaveClipper(),
                  child: Container(
                    width: size.width,
                    height: size.height * 0.4,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: const [
                          0.0,
                          0.3,
                          0.7,
                        ],
                        colors: [
                          primaryColor,
                          primaryColor.withOpacity(0.5),
                          Colors.white,
                        ],
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Container(
                            width: size.width,
                            height: size.height * 0.35,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.contain,
                                image: AssetImage(
                                    'assets/images/Allura Celebrations.png'),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Logo(
                            width: size.width * 0.2,
                            height: size.height * 0.1,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: size.height * 0.05,
                      child: Text(
                        'رائع, لقد انقذت 3 اشخاص',
                        style: headLine(),
                      ),
                    ),
                    Container(
                      height: size.height * 0.035,
                      child: Text(
                        'مساهمتك في نجاة شخص تعني الكثير',
                        style: caption(),
                      ),
                    ),
                    Container(
                      height: size.height * 0.04,
                      child: Text(
                        '(وَمَنْ أَحْيَاهَا فَكَأَنَّمَا أَحْيَا النَّاسَ جَمِيعاً)',
                        style: bodyText(),
                      ),
                    ),
                    Container(
                      width: size.width * 0.9,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 3,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Container(
                        width: size.width * 0.9,
                        height: 1,
                        color: Colors.black45,
                      ),
                    ),
                    const VerticalSpace(height: 15.0),
                    ListView.separated(
                      itemBuilder: (BuildContext, index) {
                        return BuildPerson(
                          image: people[index].image,
                          name: people[index].name,
                        );
                      },
                      separatorBuilder: (BuildContext, index) =>
                          const VerticalSpace(height: 10.0),
                      itemCount: people.length,
                      shrinkWrap: true,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildPerson extends StatelessWidget {
  final String image;
  final String name;

  const BuildPerson({
    required this.image,
    required this.name,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(5.0),
          width: size.width * 0.9,
          height: size.height * 0.1,
          color: greyColor2.withOpacity(0.3),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                child: Text(
                  name,
                  style: bodyText().copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const HorizontalSpace(width: 20.0),
              Image(
                image: AssetImage(image),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
