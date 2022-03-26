import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Shared/Components/components.dart';

class AddPersonScreen extends StatelessWidget {
  const AddPersonScreen({Key? key}) : super(key: key);

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            Column(
              children: [
                Logo(
                  height: 30.0.h,
                  width: 150.0.w,
                ),
                VerticalSpace(
                  height: 80.h,
                ),
                Center(
                  child: CircleAvatar(
                    backgroundColor: Colors.greenAccent[400],
                    radius: 80.0.r,
                    child: ClipOval(
                      child: CustomCachedNetworkImage(
                        imageHeight: 160.h,
                        imageWidth: 160.w,
                        imageUrl:
                            "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                        imageFit: BoxFit.cover,
                      ),
                    ),
                  ), //Text
                ),
                SizedBox(
                  height: 30.h,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'اسم المستخدم',
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'رقم التلفون',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 45.h,
                  width: 150.w,
                  child: ElevatedButton(
                    onPressed: () {
                      // Respond to button press
                    },
                    child: const Text(
                      "اضافة ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
