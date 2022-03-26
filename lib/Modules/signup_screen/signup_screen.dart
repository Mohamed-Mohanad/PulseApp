import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pulse_app/Layout/Main/main_screen.dart';
import 'package:pulse_app/cubits/authintication/auth_cubit.dart';
import 'package:pulse_app/cubits/authintication/auth_states.dart';

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

    return BlocConsumer<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is AuthRegisterErrorState) {
          Fluttertoast.showToast(
            msg: 'حدث خطأ حاول مرة اخري',
            backgroundColor: chooseToastColor(ToastStates.error),
            textColor: Colors.white,
          );
        }
        if (state is AuthRegisterSuccessState) {
          navigateTo(
            context,
            const MainScreen(),
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
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Column(
                                    children: [
                                      DefaultTextField(
                                        controller: firstNameController,
                                        type: TextInputType.text,
                                        label: 'الاسم الاول',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: secondNameController,
                                        type: TextInputType.visiblePassword,
                                        label: 'اسم العائلة',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: emailController,
                                        type: TextInputType.visiblePassword,
                                        label: 'البريد الالكتروني',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        label: 'كلمة السر',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: passwordConfirmController,
                                        type: TextInputType.visiblePassword,
                                        label: 'تأكيد كلمة السر',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: phoneController,
                                        type: TextInputType.phone,
                                        label: 'رقم الهاتف',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: ageController,
                                        type: TextInputType.datetime,
                                        label: 'العمر',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: nationalIDController,
                                        type: TextInputType.number,
                                        label: 'الرقم القومي',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: cityController,
                                        type: TextInputType.text,
                                        label: 'المحافظة',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                      DefaultTextField(
                                        controller: townController,
                                        type: TextInputType.text,
                                        label: 'المدينة',
                                        validate: (String? val) {
                                          if (val!.isEmpty) {
                                            return 'لا يمكن ترك الحقل فارغ';
                                          }
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                VerticalSpace(
                                  height: size.height / 30,
                                ),
                                state is AuthRegisterLoadingState
                                    ? const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      )
                                    : DefaultButton(
                                        textColor: whiteColor,
                                        width: size.width * 0.70,
                                        buttonColor: redColor.withOpacity(0.87),
                                        borderRadius: size.height * 0.05 * 0.5,
                                        height: size.height * 0.05,
                                        buttonText: 'انشاء حساب',
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            cubit.register(
                                              firstName:
                                                  firstNameController.text,
                                              secondName:
                                                  secondNameController.text,
                                              email: emailController.text,
                                              phoneNumber: phoneController.text,
                                              gender: 0,
                                              city: cityController.text,
                                              governorate: townController.text,
                                              nationalId: int.parse(
                                                  nationalIDController.text),
                                              password: passwordController.text,
                                              age:
                                                  int.parse(ageController.text),
                                            );
                                          }
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
      },
    );
  }
}
