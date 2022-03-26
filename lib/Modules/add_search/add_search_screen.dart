import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Components/components.dart';

import '../../Shared/Style/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(0),
          child: NormalButton(
            buttonColor: Colors.grey,
            icon: Icons.arrow_back_ios,
          ),
        ),
        actions: [
          CircleAvatar(
            child: ClipOval(
              child: CustomCachedNetworkImage(
                imageHeight: 45.h,
                imageWidth: 60.w,
                imageUrl:
                "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                imageFit: BoxFit.cover,
              ),
            ),
            radius: 23.0.r,
          ),
        ],
      ),
      body: Column(
        children: [
          Logo(
            height: 30.0.h,
            width: 150.0.w,
          ),
          const VerticalSpace(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: whiteColor,
                border: const OutlineInputBorder(),
                labelText: 'بحث عن اقرب مستشفي / صيدلة',
                icon: const Icon(
                  Icons.search_rounded,
                  textDirection: TextDirection.ltr,
                  size: 60,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
