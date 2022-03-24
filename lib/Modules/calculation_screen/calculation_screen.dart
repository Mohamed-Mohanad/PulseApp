import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';
import '../../Shared/Style/theme.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({Key? key}) : super(key: key);

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  late int steps;
  late String sleepTime = '',
      wakeUpTime = '';
  late int height;
  late int weight;
  var stepsController = TextEditingController();
  var dateController = TextEditingController();


  String dropdownValue = 'النوع';
  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("ذكر"), value: "ذكر"),
      const DropdownMenuItem(child: Text("انثى"), value: "انثى"),
    ];
    return menuItems;
  }

  String dropdownTall = '150سم';
  List <String> spinnerItemsTall = [
    for(int i = 50; i < 250; i++)
      '${i++}سم'
  ];

  String dropdownWeight = '150سم';
  List <String> spinnerItemsWeight = [
    for(int i = 20; i < 250; i++)
      '${i++}كجم'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              TopBlur(),
              SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Logo(
                        height: size.height * 0.1,
                        width: size.width * 0.2,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: size.height * 0.01,
                        horizontal: size.width * 0.15,
                      ),
                      child: Text(
                        'الحساب',
                        style: headLine(),
                      ),
                    ),
                    const Header(
                      title: 'الأهداف',
                    ),
                    CalculateBox(
                      width: size.width * 0.32,
                      header: 'الخطوات',
                      child: Container(
                        child: Center(
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            controller: stepsController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              hintText: '5000',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Header(
                      title: 'وقت النوم',
                    ),
                    Container(
                      child: Row(
                        children: [
                          CalculateBox(
                            width: size.width * 0.32,
                            header: 'موعد النوم',
                            child: MyTimer(
                              timer: sleepTime,
                            ),
                          ),
                          CalculateBox(
                            width: size.width * 0.35,
                            header: 'موعد الاستيقاظ',
                            child: MyTimer(
                              timer: wakeUpTime,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Header(
                      title: 'معلومات عنك',
                    ),
                    Container(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              // CalculateBox(
                              //   width: size.width * 0.32,
                              //   header: 'النوع',
                              //   child: DropdownButton(
                              //     dropdownColor: Colors.white,
                              //     value: dropdownValue,
                              //     onChanged: (String? newValue) {},
                              //     items: dropdownItems,
                              //   ),
                              // ),
                              // CalculateBox(
                              //   width: size.width * 0.38,
                              //   header: 'تاريخ الميلاد',
                              //   child: InkWell(
                              //     onTap: () {
                              //       showDatePicker(
                              //         context: context,
                              //         initialDate: DateTime.now(),
                              //         firstDate: DateTime.now(),
                              //         lastDate: DateTime.parse('2030-12-31'),
                              //       ).then((value) {
                              //         dateController.text =
                              //             DateFormat.yMMMd().format(value!);
                              //       });
                              //     },
                              //   ),
                              // ),
                            ],
                          ),
                          Row(
                            children: const [
                              // CalculateBox(
                              //     width: size.width * 0.32,
                              //     header: 'الطول',
                              //     child: DropdownButton<String>(
                              //       value: dropdownTall,
                              //       icon: const Icon(Icons.arrow_drop_down),
                              //       iconSize: 24,
                              //       underline: Container(
                              //         height: 2,
                              //         color: Colors.grey,
                              //       ),
                              //       onChanged: (data) {},
                              //       items: spinnerItemsTall.map<
                              //           DropdownMenuItem<String>>((
                              //           String value) {
                              //         return DropdownMenuItem<String>(
                              //           value: value,
                              //           child: Text(value),
                              //         );
                              //       }).toList(),
                              //     ),
                              // ),
                              // CalculateBox(
                              //   width: size.width * 0.32,
                              //   header: 'الوزن',
                              //   child: DropdownButton<String>(
                              //     value: dropdownWeight,
                              //     icon: const Icon(Icons.arrow_drop_down),
                              //     iconSize: 24,
                              //     underline: Container(
                              //       height: 2,
                              //       color: Colors.grey,
                              //     ),
                              //     onChanged: (data) {},
                              //     items: spinnerItemsWeight.map<
                              //         DropdownMenuItem<String>>((
                              //         String value) {
                              //       return DropdownMenuItem<String>(
                              //         value: value,
                              //         child: Text(value),
                              //       );
                              //     }).toList(),
                              //   ),
                              // ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
