import 'package:flutter/material.dart';
import 'package:pulse_app/Layout/Main/main_screen.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var formKey = GlobalKey<FormState>();

    var firstNameController = TextEditingController(),
        secondNameController = TextEditingController(),
        emailController = TextEditingController(),
        passwordController = TextEditingController(),
        passwordConfirmController = TextEditingController(),
        phoneController = TextEditingController(),
        ageController = TextEditingController(),
        nationalIDController = TextEditingController(),
        cityController = TextEditingController(),
        townController = TextEditingController();

    return Scaffold(
      body: Background(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const NormalButton(
                    buttonColor: Colors.transparent,
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                Center(
                  child: Logo(
                    width: size.width * 0.3,
                    height: size.height * 0.1,
                  ),
                ),
                VerticalSpace(
                  height: size.height * 0.015,
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: backgroundColor,
                      border: Border.all(
                        color: Colors.grey,
                      ),
                    ),
                    child: Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 43,
                                vertical: 13,
                              ),
                              child: Text(
                                "انشاء حساب جديد",
                                style: headLine(),
                              ),
                            ),
                            VerticalSpace(height: size.height * 0.01),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: Column(
                                children: [
                                  DefaultTextField(
                                    controller: firstNameController,
                                    type: TextInputType.text,
                                    label: 'الاسم الاول',
                                  ),
                                  DefaultTextField(
                                    controller: secondNameController,
                                    type: TextInputType.visiblePassword,
                                    label: 'اسم العائلة',
                                  ),
                                  DefaultTextField(
                                    controller: emailController,
                                    type: TextInputType.visiblePassword,
                                    label: 'البريد الالكتروني',
                                  ),
                                  DefaultTextField(
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    label: 'كلمة السر',
                                  ),
                                  DefaultTextField(
                                    controller: passwordConfirmController,
                                    type: TextInputType.visiblePassword,
                                    label: 'تأكيد كلمة السر',
                                  ),
                                  DefaultTextField(
                                    controller: phoneController,
                                    type: TextInputType.phone,
                                    label: 'رقم الهاتف',
                                  ),
                                  DefaultTextField(
                                    controller: ageController,
                                    type: TextInputType.datetime,
                                    label: 'العمر',
                                  ),
                                  DefaultTextField(
                                    controller: nationalIDController,
                                    type: TextInputType.number,
                                    label: 'الرقم القومي',
                                  ),
                                  DefaultTextField(
                                    controller: cityController,
                                    type: TextInputType.text,
                                    label: 'المحافظة',
                                  ),
                                  DefaultTextField(
                                    controller: townController,
                                    type: TextInputType.text,
                                    label: 'المدينة',
                                  ),
                                ],
                              ),
                            ),
                            VerticalSpace(
                              height: size.height * 0.15,
                            ),
                            DefaultButton(
                              textColor: whitColor,
                              width: size.width * 0.70,
                              buttonColor: redColor.withOpacity(0.87),
                              borderRadius: size.height * 0.05 * 0.5,
                              height: size.height * 0.05,
                              buttonText: 'انشاء حساب',
                              onPressed: () {
                                navigateTo(context, const MainScreen());
                              },
                            ),
                            VerticalSpace(
                              height: size.height * 0.05,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
