import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Style/color.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

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
                fillColor: whitColor,
                border: const OutlineInputBorder(),
                labelText: 'بحث عن اقرب مستشفي / صيدلة',
                icon:const Icon(Icons.search_rounded,textDirection: TextDirection.ltr,size: 60,),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
