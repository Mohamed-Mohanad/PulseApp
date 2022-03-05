

import 'package:flutter/material.dart';

import '../../Shared/Components/components.dart';

class closePeople extends StatefulWidget {
  const closePeople({Key? key}) : super(key: key);

  @override
  State<closePeople> createState() => _closePeopleState();
}

class _closePeopleState extends State<closePeople> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  "assets/icons/pulseIcon.png",
                ),
              ),
              Text('المقربون',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
              ),),
              SizedBox(
                height: 20.0,
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) => buildChatItem(context),
                separatorBuilder: (context, index) =>
                    SizedBox(
                      height: 20.0,
                    ),
                itemCount: 15,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


