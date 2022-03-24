import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class closePeople extends StatefulWidget {
  const closePeople({Key? key}) : super(key: key);

  @override
  State<closePeople> createState() => _closePeopleState();
}

class _closePeopleState extends State<closePeople> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.w,
            right: 20.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Logo(
                  width: size.width * 0.2,
                  height: size.height * 0.05,
                ),
              ),
              Text(
                'المقربون',
                style: headLine(),
              ),
              VerticalSpace(height: 10.0.h),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.0.w,
                ),
                decoration: BoxDecoration(
                  color: greyColor2.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column(
                  children: [
                    VerticalSpace(
                      height: 10.0.h,
                    ),
                    ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) => const BuildChatItem(),
                      separatorBuilder: (context, index) => VerticalSpace(
                        height: 10.0.h,
                      ),
                      itemCount: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
