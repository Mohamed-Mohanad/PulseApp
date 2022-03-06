import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class helpScreen extends StatefulWidget {
  const helpScreen({Key? key}) : super(key: key);

  @override
  State<helpScreen> createState() => _helpScreenState();
}

class _helpScreenState extends State<helpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('المساعدة',
          textAlign: TextAlign.start,
          style: TextStyle(
              color: Colors.black
          ),),


        ),

      body: DefaultTabController(

        length: 2,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
          child: Column(
            children: [
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: Color(0xffBBBBBB),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: TabBar(
                    indicator: BoxDecoration(
                      color: Color(0xffEE1C5D),
                      borderRadius: BorderRadius.circular(15)
                    ),
                      tabs: [
                    Tab(text: 'المقربون',),
                    Tab(text: 'الجميع',)
                  ]),
                ),
              ),
              SizedBox(height: 20,),
              SizedBox(
               height: 300,
                child: TabBarView(children: [
                  Container(
                   decoration: BoxDecoration(
                        color: Color(0xffBBBBBB),
                        borderRadius: BorderRadius.circular(10),
                    ),
                    height: 150,
                    width:60 ,
                    child: Container(
                        child: Stack(
                          children: [
                            Column(
                              children: [
                                Image.asset('assets/images/Wavy Buddies Delivering.png'),
                                SizedBox(
                                  height: 10,
                                ),
                                Text('الاقرباء بجانبك ً',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('بتفعيل وضع المساعدة للاقرباء _سوف يكون اقرباْئك بجانبك دائماً',
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),

                          ],
                        )),
                  ),
                  Container(
                    decoration:BoxDecoration(
                      color: Color(0xffBBBBBB),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:Column(
                      children: [
                        Image.asset('assets/images/Family Values Family 1.png'),
                        SizedBox(
                          height: 10,
                        ),
                        Text('الجميع بجانبك ً',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text('هناك الكثير من حولك علي_استعداد لتقديم المساعدة في اي وقتًً',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ) ,
                  )
                ],),
              )
            ],
          ),
        ),
      ),
    );
  }
}
