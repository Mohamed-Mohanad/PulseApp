import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Style/color.dart';

class AddDeviceScreen extends StatelessWidget {
  const AddDeviceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          SizedBox(height: 80.h,),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: greyColor1,
                border: const OutlineInputBorder(),
                labelText: 'اضافة جهاز جديد',
                icon:const Icon(Icons.device_hub_sharp,textDirection: TextDirection.ltr,size: 40,),
              ),
            ),
          ),
          Divider(height: 10.h,),
         const Text(
            'قم بإدخال الكود الخاص بجهازك وقم بمسح الكود'
          )
        ],
      ),
    );
  }
}
