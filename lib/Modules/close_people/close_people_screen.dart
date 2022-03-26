import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/cubits/authintication/auth_cubit.dart';
import 'package:pulse_app/cubits/authintication/auth_states.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/color.dart';
import '../../Shared/Style/theme.dart';

class closePeople extends StatefulWidget {
  const closePeople({Key? key}) : super(key: key);

  @override
  State<closePeople> createState() => _closePeopleState();
}

class _closePeopleState extends State<closePeople> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Builder(builder: (context) {
      AuthCubit.get(context).getMyNetwork();
      return BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                  left: 20.w,
                  right: 20.w,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Logo(
                        width: size.width * 0.2,
                        height: size.height * 0.05,
                      ),
                    ),
                    Text(
                      'المقربون',
                      style: headLine(),
                    ),
                    VerticalSpace(height: 10.0.h),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 5.0.w,
                      ),
                      decoration: BoxDecoration(
                        color: greyColor2.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        children: [
                          VerticalSpace(
                            height: 10.0.h,
                          ),
                          cubit.contacts.isEmpty
                              ? Center(
                                  child: Text(
                                    'لا يوجد مقربون',
                                    style: bodyText(),
                                  ),
                                )
                              : ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      BuildChatItem(
                                    image:
                                        cubit.contacts[index].photo.toString(),
                                    userName: cubit.contacts[index].userName
                                        .toString(),
                                  ),
                                  separatorBuilder: (context, index) =>
                                      VerticalSpace(
                                    height: 10.0.h,
                                  ),
                                  itemCount: cubit.contacts.length,
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    });
  }
}
