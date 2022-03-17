import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../login_screen/login_screen.dart';
import '../signup_screen/signup_screen.dart';

class RegistrationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Background(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 30.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  child: const NormalButton(
                    buttonColor: Colors.transparent,
                    icon: Icons.arrow_back_ios,
                  ),
                ),
                Expanded(
                  child: Logo(
                    width: size.width,
                    height: size.height,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: size.height,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: DefaultButton(
                          height: size.height,
                          width: size.width * 0.8,
                          borderRadius: size.height / 2,
                          buttonColor: backgroundColor,
                          onPressed: () {
                            navigateTo(context, SignUpScreen());
                          },
                          textColor: Colors.black,
                          buttonText: 'انشاء حساب جديد',
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: OrRow(),
                      ),
                      Expanded(
                        flex: 2,
                        child: DefaultButton(
                          height: size.height,
                          width: size.width * 0.8,
                          borderRadius: size.height / 2,
                          buttonColor: backgroundColor,
                          onPressed: () {
                            navigateTo(context, LoginScreen());
                          },
                          textColor: Colors.black,
                          buttonText: 'تسجيل الدخول',
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    height: size.height,
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
