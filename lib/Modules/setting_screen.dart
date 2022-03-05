import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  static const routeName = "/profile";

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
           child: Container(
          color: Color(0xffBBBBBB),
          child: Column(
            children: [
              //for circle avtar image
              _getHeader(),
              _profileName("assmaakhaled609@gmail.com"),
              SizedBox(
                height: 14,
              ),
              _heading("الانقاذ"),
              _helpMode(),
              SizedBox(
                height: 6,
              ),
              _heading("الاعدادت"),
              SizedBox(
                height: 6,
              ),
              _detailsCard(),
              SizedBox(
                height: 10,
              ),
              _heading("عن التطبيق"),
              SizedBox(
                height: 6,
              ),
              _settingsCard(),
            ],
          ),
        ),
          )),
    );
  }

  Widget _getHeader() {
    return SingleChildScrollView(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                //borderRadius: BorderRadius.all(Radius.circular(10.0)),
                shape: BoxShape.circle,
                image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://img.freepik.com/free-photo/no-problem-concept-bearded-man-makes-okay-gesture-has-everything-control-all-fine-gesture-wears-spectacles-jumper-poses-against-pink-wall-says-i-got-this-guarantees-something_273609-42817.jpg?w=996",
                    ) // color: Colors.orange[100],
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _profileName(String name) {
    return SingleChildScrollView(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.80, //80% of width,
        child: Center(
          child: Text(
            name,
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
    );
  }

  Widget _heading(String heading) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.80, //80% of width,
      child: Text(
        heading,
        style: TextStyle(fontSize: 16),
      ),
    );
  }

  Widget _detailsCard() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Container(
            color: Colors.white,
            child: Column(
              children: [
                //row for each deatails
                ListTile(
                  leading: Icon(
                    Icons.account_circle_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "الملف الشخصي",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.black,
                  ),
                  title: Text(
                    "اعدادت الصفحة",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.people,
                    color: Colors.black,
                  ),
                  title: Text(
                    "الاشخاص المقربون",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.assignment_outlined,
                    color: Colors.black,
                  ),
                  title: Text(
                    "اعداد التقرير",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                Divider(
                  height: 0.6,
                  color: Colors.black87,
                ),
                ListTile(
                  leading: Icon(
                    Icons.notifications,
                    color: Colors.black,
                  ),
                  title: Text(
                    "الاشعارات",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _settingsCard() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: Column(
            children: [
              //row for each deatails
              ListTile(
                leading: Icon(
                  Icons.book_sharp,
                  color: Colors.black,
                ),
                title: Text(
                  "طريقة الاستخدام",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Divider(
                height: 0.6,
                color: Colors.black87,
              ),
              ListTile(
                leading: Icon(
                  Icons.privacy_tip,
                  color: Colors.black,
                ),
                title: Text(
                  "البيانات والخصوصية",
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Divider(
                height: 0.6,
                color: Colors.black87,
              ),
              ListTile(
                leading: Icon(
                  Icons.error_outline_outlined,
                  color: Colors.black,
                ),
                title: Text(
                  "الاصدار",
                  style: TextStyle(color: Colors.black),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _helpMode() {
    bool status = true;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(
              Icons.person_outline,
              color: Colors.black,
            ),
            title: Text(
              "تفعيل الانقاذ",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
