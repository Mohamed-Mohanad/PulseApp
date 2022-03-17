import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Style/theme.dart';

import '../../Shared/Components/components.dart';

class closePeople extends StatefulWidget {
  const closePeople({Key? key}) : super(key: key);

  @override
  State<closePeople> createState() => _closePeopleState();
}

class _closePeopleState extends State<closePeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/icons/pulseIcon.png",
                ),
              ),
              Text(
                'المقربون',
                style: headLine(),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              ListView.separated(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => const BuildChatItem(),
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.0.h,
                ),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
