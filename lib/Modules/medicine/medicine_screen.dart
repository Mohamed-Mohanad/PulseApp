import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pulse_app/Shared/Style/theme.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Cubit/cubit.dart';
import '../../Shared/Cubit/states.dart';
import '../../Shared/Style/color.dart';

class MedicineScreen extends StatefulWidget {
  const MedicineScreen({Key? key}) : super(key: key);

  @override
  State<MedicineScreen> createState() => _MedicineScreenState();
}

class _MedicineScreenState extends State<MedicineScreen> {
  TimeOfDay _time = TimeOfDay.now().replacing(hour: 11, minute: 30);

  void onTimeChanged(TimeOfDay newTime) {
    setState(() {
      _time = newTime;
    });
  }

  String dropdownValue = 'One';

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("كل يوم"), value: "كل يوم"),
      const DropdownMenuItem(
          child: Text("مرة في الاسبوع"), value: "مرة في الاسبوع"),
      const DropdownMenuItem(
          child: Text("مرتين في الاسبوع"), value: "مرتين في الاسبوع"),
      const DropdownMenuItem(child: Text("كل شهر"), value: "كل شهر"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    String? selectedValue = 'كل يوم';
    final _dropdownFormKey = GlobalKey<FormState>();
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            body: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.0.w,
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
                      Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 10.0.h,
                          horizontal: 20.0.w,
                        ),
                        child: Text(
                          'الدواء',
                          textAlign: TextAlign.start,
                          style: headLine(),
                        ),
                      ),
                      Image.asset('assets/images/Stuck at Home Health.png'),
                      const VerticalSpace(
                        height: 30,
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'يمكنك ضبط منبه بمواعيد الأدوية',
                          style: caption(),
                        ),
                      ),
                      const VerticalSpace(
                        height: 10,
                      ),
                      const Divider(
                        height: 1,
                        color: Colors.black87,
                      ),
                      const VerticalSpace(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: greyColor2.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.0),
                            border: Border.all(
                              color: greyColor2.withOpacity(0.3),
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.0.w,
                            vertical: 5.0.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'اضافة دواء جديد',
                                textAlign: TextAlign.start,
                                style: bodyText().copyWith(
                                  fontSize: 23.0.sp,
                                  color: blackColor,
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  Alert(
                                      context: context,
                                      title: "اضافة دواء جديد",
                                      content: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              "معاد الدواء",
                                              style: headLine(),
                                            ),
                                            Text(
                                              _time.format(context),
                                              textAlign: TextAlign.center,
                                              style: bodyText(),
                                            ),
                                            const VerticalSpace(height: 10),
                                            TextButton(
                                              style: TextButton.styleFrom(
                                                backgroundColor: primaryColor,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  showPicker(
                                                    context: context,
                                                    onChange: onTimeChanged,
                                                    value: _time,
                                                    minuteInterval:
                                                    MinuteInterval.FIVE,
                                                    onChangeDateTime:
                                                        (DateTime dateTime) {
                                                      print(dateTime);
                                                    },
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                "تحديد المعاد",
                                                style: bodyText().copyWith(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ),
                                            // Render inline widget
                                            const TextField(
                                              decoration: InputDecoration(
                                                icon: Icon(Icons
                                                    .medical_services_outlined),
                                                labelText: 'اسم الدواء',
                                              ),
                                            ),
                                            const VerticalSpace(
                                              height: 10,
                                            ),
                                            Form(
                                              key: _dropdownFormKey,
                                              child: DropdownButtonFormField(
                                                  decoration:
                                                  const InputDecoration(
                                                    fillColor: Colors.white,
                                                    filled: true,
                                                    contentPadding:
                                                    EdgeInsets.only(
                                                        bottom: 10.0,
                                                        left: 10.0,
                                                        right: 10.0),
                                                  ),
                                                  focusColor: Colors.black,
                                                  iconEnabledColor: Colors.black,
                                                  dropdownColor: Colors.white,
                                                  value: selectedValue,
                                                  onChanged: (String? newValue) {
                                                    setState(() {
                                                      selectedValue = newValue!;
                                                    });
                                                  },
                                                  items: dropdownItems),
                                            )
                                          ],
                                        ),
                                      ),
                                      buttons: [
                                        DialogButton(
                                          onPressed: () => Navigator.pop(context),
                                          child: Text(
                                            "حفظ",
                                            style: bodyText().copyWith(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        )
                                      ]).show();
                                },
                                icon: const Icon(
                                  Icons.add_box_outlined,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: greyColor2.withOpacity(0.3),
                              style: BorderStyle.solid,
                              width: 1,
                            ),
                            color: greyColor2.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: 20.0.w,
                            vertical: 40.0.h,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'ليوبونيسيل',
                                style: bodyText().copyWith(
                                  fontSize: 27.0.sp,
                                  color: Colors.black,
                                ),
                              ),
                              Container(
                                child: Text(
                                  '7:45 مساء',
                                  style: bodyText().copyWith(
                                    fontSize: 27.0.sp,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  Future<TimeOfDay?> showTimePicker({
    required BuildContext context,
    required TimeOfDay initialTime,
    TransitionBuilder? builder,
    bool useRootNavigator = true,
    TimePickerEntryMode initialEntryMode = TimePickerEntryMode.dial,
    String? cancelText,
    String? confirmText,
    String? helpText,
    String? errorInvalidText,
    String? hourLabelText,
    String? minuteLabelText,
    RouteSettings? routeSettings,
    EntryModeChangeCallback? onEntryModeChanged,
  }) async {
    assert(context != null);
    assert(initialTime != null);
    assert(useRootNavigator != null);
    assert(initialEntryMode != null);
    assert(debugCheckHasMaterialLocalizations(context));
  }
}
