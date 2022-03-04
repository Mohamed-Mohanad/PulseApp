import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../signup_screen/signup_screen.dart';

class LoginScreen extends StatelessWidget {
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
                  height: size.height * 0.1,
                ),
                Container(
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
                            "تسجيل الدخول",
                            style: TextStyle(color: Colors.black, fontSize: 36),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: DefaultTextField(
                            controller: emailController,
                            type: TextInputType.text,
                            label: 'البريد الالكتروني',
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(horizontal: 40),
                          child: DefaultTextField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            label: 'كلمة السر',
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        DefaultButton(
                            textColor: whitColor,
                            width: size.width * 0.70,
                            buttonColor: redColor.withOpacity(0.87),
                            borderRadius: 20,
                            height: 37,
                            buttonText: 'دخول',
                            onPressed: () {}),
                        const SizedBox(
                          height: 13,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                OrRow(),
                SizedBox(
                  height: size.height * 0.03,
                ),
                GoogleAuth(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
