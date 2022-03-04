import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var formKey = GlobalKey<FormState>();

    var emailController = TextEditingController(),
        passwordController = TextEditingController();

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
                SizedBox(
                  height: size.height * 0.02,
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
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 43,
                              vertical: 13,
                            ),
                            child: const Text(
                              "انشاء حساب جديد",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 36),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                DefaultTextField(
                                  controller: emailController,
                                  type: TextInputType.text,
                                  label: 'الاسم الاول',
                                ),
                                SizedBox(height: size.height * 0.02),
                                DefaultTextField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  label: 'اسم العائلة',
                                ),
                                SizedBox(height: size.height * 0.02),
                                DefaultTextField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  label: 'البريد الالكتروني',
                                ),
                                SizedBox(height: size.height * 0.02),
                                DefaultTextField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  label: 'كلمة السر',
                                ),
                                SizedBox(height: size.height * 0.02),
                                DefaultTextField(
                                  controller: passwordController,
                                  type: TextInputType.visiblePassword,
                                  label: 'تأكيد كلمة السر',
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.15,
                          ),
                          DefaultButton(
                              textColor: whitColor,
                              width: size.width * 0.70,
                              buttonColor: redColor.withOpacity(0.87),
                              borderRadius: 20,
                              height: 37,
                              buttonText: 'انشاء حساب',
                              onPressed: () {}),
                        ],
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
