import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

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
          VerticalSpace(
            height: 40.h,
          ),
          Container(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: greyColor1,
                border: const OutlineInputBorder(),
                labelText: 'اضافة جهاز جديد',
                icon: const Icon(
                  Icons.device_hub_sharp,
                  textDirection: TextDirection.rtl,
                  size: 40,
                ),
              ),
            ),
          ),
          Divider(
            height: 10.h,
          ),
          const Text('قم بإدخال الكود الخاص بجهازك وقم بمسح الكود')
        ],
      ),
    );
  }
}
