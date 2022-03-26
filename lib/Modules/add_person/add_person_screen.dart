import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Models/user_network/contacts_model.dart';
import 'package:pulse_app/Shared/Components/components.dart';
import 'package:pulse_app/cubits/authintication/auth_cubit.dart';

class AddPersonScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController(),
      phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                children: [
                  SizedBox(
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
                  ) //Text
                      ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'اسم المستخدم',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'رقم التلفون',
                      ),
                      keyboardType: TextInputType.text,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  SizedBox(
                    height: 45.h,
                    width: 150.w,
                    child: ElevatedButton(
                      onPressed: () {
                        AuthCubit.get(context).addToMyNetwork(
                          contact: ContactModel(
                            userName: nameController.text,
                            photo:
                                "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                            phoneNumber: phoneController.text,
                          ),
                        );
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
      ),
    );
  }
}
