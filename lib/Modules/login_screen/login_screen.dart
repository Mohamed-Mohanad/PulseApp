import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pulse_app/cubits/authintication/auth_cubit.dart';
import 'package:pulse_app/cubits/authintication/auth_states.dart';

import '../../Layout/helper_main_screen/helper_main_screen.dart';
import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var formKey = GlobalKey<FormState>();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthLoginErrorState) {
          Fluttertoast.showToast(
            msg: 'البريد الالكتروني او كلمة السر غير صحيح',
            backgroundColor: chooseToastColor(ToastStates.error),
            textColor: Colors.white,
          );
        }
        if (state is AuthLoginSuccessState) {
          navigateTo(
            context,
            const HelperMainScreen(),
          );
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
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
                              child: Text(
                                "تسجيل الدخول",
                                style: headLine(),
                              ),
                            ),
                            VerticalSpace(height: size.height * 0.03),
                            Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.symmetric(horizontal: 40),
                              child: DefaultTextField(
                                controller: emailController,
                                type: TextInputType.text,
                                label: 'البريد الالكتروني',
                                validate: (String? val) {
                                  if (val!.isEmpty) {
                                    return 'لا يمكن ترك حقل البريد الالكتروني فارغ';
                                  }
                                },
                              ),
                            ),
                            VerticalSpace(height: size.height * 0.01),
                            Container(
                              alignment: Alignment.center,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 40),
                              child: DefaultTextField(
                                controller: passwordController,
                                type: TextInputType.visiblePassword,
                                label: 'كلمة السر',
                                validate: (String? val) {
                                  if (val!.isEmpty) {
                                    return 'لا يمكن ترك حقل كلمة السر فارغ';
                                  }
                                },
                              ),
                            ),
                            VerticalSpace(
                              height: size.height * 0.05,
                            ),
                            state is AuthLoginLoadingState
                                ? const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                                : DefaultButton(
                                    textColor: whiteColor,
                                    width: size.width * 0.70,
                                    buttonColor: redColor.withOpacity(0.87),
                                    borderRadius: size.height * 0.05 * 0.5,
                                    height: size.height * 0.05,
                                    buttonText: 'دخول',
                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        cubit.login(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        );
                                      }
                                    },
                                  ),
                            VerticalSpace(
                              height: size.height * 0.01,
                            )
                          ],
                        ),
                      ),
                    ),
                    VerticalSpace(
                      height: size.height * 0.05,
                    ),
                    const OrRow(),
                    VerticalSpace(
                      height: size.height * 0.03,
                    ),
                    const GoogleAuth(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
