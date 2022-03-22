import 'package:day_night_time_picker/lib/constants.dart';
import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_app/Shared/Cubit/states.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../../Shared/Cubit/cubit.dart';

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
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'المساعدة',
                textAlign: TextAlign.start,
                style: TextStyle(color: Colors.black),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/Stuck at Home Health.png'),
                    const Divider(
                      height: 0.6,
                      color: Colors.black87,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: const Color(0xffCCCCCC),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            const Text(
                              'اضافة دواء جديد',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 15),
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
                                            style: Theme.of(context)
                                                .textTheme
                                                .headline6,
                                          ),
                                          Text(
                                            _time.format(context),
                                            textAlign: TextAlign.center,
                                            style: Theme.of(context)
                                                .textTheme.bodyText1,
                                          ),
                                          SizedBox(height: 10),
                                          TextButton(
                                            style: TextButton.styleFrom(
                                              backgroundColor: Theme.of(context)
                                                  .colorScheme
                                                  .secondary,
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
                                              style: TextStyle(
                                                  color: Colors.white),
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
                                          const SizedBox(
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
                                        child: const Text(
                                          "حفظ",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20),
                                        ),
                                      )
                                    ]).show();
                              },
                              icon: const Icon(
                                Icons.add_box_outlined,
                                size: 25,
                              ),
                              padding: const EdgeInsets.all(8.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            top:
                                BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                            left:
                                BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                            right:
                                BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                            bottom:
                                BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                          ),
                          color: Color(0xFFBFBFBF),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'ليوبونيسيل',
                              style: TextStyle(fontSize: 25),
                            ),
                            Text(
                              '7:45 مساء',
                              style: TextStyle(fontSize: 25),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
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
