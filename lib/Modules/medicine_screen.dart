
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pulse_app/Shared/Cubit/states.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

import '../Shared/Cubit/cubit.dart';
class medicineScreen extends StatefulWidget {
  const medicineScreen({Key? key}) : super(key: key);

  @override
  State<medicineScreen> createState() => _medicineScreenState();
}

class _medicineScreenState extends State<medicineScreen> {
  TimeOfDay selectedTime = TimeOfDay.now();
  String dropdownValue = 'One';
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener:(context, state ){},
        builder: (context,state){
          var cubit = AppCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title:  Text('المساعدة',
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Colors.black
                ),),


            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/Stuck at Home Health.png'),
                    Divider(
                      height: 0.6,
                      color: Colors.black87,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Color(0xffCCCCCC),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget> [
                            Text('اضافة دواء جديد',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 15),),

                            IconButton(onPressed: (){
                              Alert(
                                  context: context,
                                  title: "اضافة دواء جديد",
                                  content: Column(
                                    children: <Widget>[
                                      ElevatedButton(
                                        onPressed: () {
                                          _selectTime(context);
                                        },
                                        child: Text("Choose Time"),
                                      ),
                                      Text("${selectedTime.hour}:${selectedTime.minute}"),
                                      TextField(
                                        decoration: InputDecoration(
                                          icon: Icon(Icons.medical_services_outlined),
                                          labelText: 'اسم الدواء',
                                        ),
                                      ),
                                      DropdownButton<String>(
                                        value: dropdownValue,
                                        icon: const Icon(Icons.arrow_downward),
                                        elevation: 16,
                                        style: const TextStyle(color: Colors.deepPurple),
                                        underline: Container(
                                          height: 2,
                                          color: Colors.deepPurpleAccent,
                                        ),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownValue = newValue!;
                                          });
                                        },
                                        items: <String>['One', 'Two', 'Free', 'Four']
                                            .map<DropdownMenuItem<String>>((String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      )
                                    ],
                                  ),
                                  buttons: [
                                    DialogButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        "حفظ",
                                        style: TextStyle(color: Colors.white, fontSize: 20),
                                      ),
                                    )
                                  ]).show();
                            }, icon: Icon(Icons.add_box_outlined,size: 25,),
                              padding: EdgeInsets.all(8.0),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration:  BoxDecoration(
                          border: Border(
                            top: BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                            left: BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                            right: BorderSide(width: 30, color: Color(0xFFBFBFBF)),
                            bottom: BorderSide(width:30, color: Color(0xFFBFBFBF)),
                          ),
                          color: Color(0xFFBFBFBF),

                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('ليوبونيسيل',
                              style: TextStyle(
                                  fontSize: 25
                              ),),
                            Text('7:45 مساء',
                              style: TextStyle(
                                  fontSize: 25
                              ),)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }
    );
  }
  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }
}
