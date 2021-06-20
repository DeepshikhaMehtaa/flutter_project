import 'package:flutter/material.dart';
import 'package:loginentry/MyDBManager.dart';
import 'package:loginentry/loginpage.dart';
import 'package:loginentry/route.dart';
import 'package:loginentry/storages/shared_pref.dart';


class MyHomePage extends StatefulWidget {
  String userName;
  MyHomePage({this.userName});
  @override

  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
  final DBStudentManager dbStudentManager = new DBStudentManager();
  final _nameController = TextEditingController();
  final _courseController = TextEditingController();
  final _formkey = new GlobalKey<FormState>();
  // SharedPreferences logindata;
  // String username;
  Student student;
  int updateindex;
  List<Student> studlist;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //initial();
  }
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("ENTER DETAILS"),
          actions: [
            GestureDetector(
              child: Icon(Icons.remove_red_eye),
              onTap: (){
                Navigator.pushReplacementNamed(context, Routes.viewlist);
              },
            )
          ],
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text('LOG OUT ${widget.userName}'),
                onTap: () {


                 SharedManger.saveFirstLogin(false);
                 Navigator. pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(
                     builder: (BuildContext context) => Loginpage(),
                   ),
                       (route) => false,
                 );
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.list_alt),
                title: Text("Student Details"),
                onTap: (){
                  Navigator.pushNamed(context, Routes.studentdetails);
                },

              )
            ],
          ),
        ),
        body: ListView(
          children: <Widget>[
            Form(
              key: _formkey,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: "Name"),
                      controller: _nameController,
                      validator: (val) =>
                      val.isNotEmpty ? null : "Name Should not be Empty",
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: "Course"),
                      controller: _courseController,
                      validator: (val) =>
                      val.isNotEmpty ? null : "Course Should not be Empty",
                    ),

                    RaisedButton(
                      textColor: Colors.white,
                      color: Colors.lightBlue,
                      child: Container(
                          width: width * 0.9,
                          child: Text(
                            "Submit",
                            textAlign: TextAlign.center,
                          )),
                      onPressed: () {
                        submitStudent(context);
                      },
                    ),

                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void submitStudent(BuildContext context) {
    if (_formkey.currentState.validate()) {
      if (student == null) {
        Student st = new Student(
            name: _nameController.text, course: _courseController.text);
        dbStudentManager.insertStudent(st).then((value) => {
          _nameController.clear(),
          _courseController.clear(),

        });
      }
      else {
        student.name = _nameController.text;
        student.course = _courseController.text;

        dbStudentManager.updateStudent(student).then((value) {
          setState(() {
            studlist[updateindex].name = _nameController.text;
            studlist[updateindex].course = _courseController.text;
          });
          _nameController.clear();
          _courseController.clear();
          student = null;
        });
      }
    }
  }
}