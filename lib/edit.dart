import 'package:flutter/material.dart';
import 'package:loginentry/MyDBManager.dart';
import 'package:loginentry/route.dart';

class MyEditPage extends StatefulWidget {
  @override
  _MyEditPageState createState() => _MyEditPageState();
}
class _MyEditPageState extends State<MyEditPage> {
  final DBStudentManager dbStudentManager = new DBStudentManager();
  final _nameController = TextEditingController();
  final _courseController = TextEditingController();
  final _idController = TextEditingController();

  final _formkey = new GlobalKey<FormState>();
  int updateindex;
  List<Student> studlist;
  @override
  Widget build(BuildContext context) {
    final Student args =ModalRoute.of(context).settings.arguments;
    String name=args.name, course=args.course;
    int studentId = args.id;
    _idController.text = studentId.toString();
    _nameController.text = name;
    _courseController.text = course;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("EDIT DETAILS"),
          actions: [
            GestureDetector(
              child: Icon(Icons.remove_red_eye),
              onTap: (){
                Navigator.pushNamed(context, Routes.viewlist);
              },
            )
          ],
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
                      //initialValue: studentId.toString()??'',
                      decoration: InputDecoration(
                          labelText: 'Id'),
                      controller: _idController,
                      enabled: false,
                      validator: (val) =>
                      val.isNotEmpty ? null : "Name Should not be Empty",
                    ),
                    TextFormField(
                      //initialValue: name??'',
                      decoration: InputDecoration(labelText: "Name"),
                      controller: _nameController,
                      validator: (val) =>
                      val.isNotEmpty ? null : "Name Should not be Empty",
                    ),
                    TextFormField(
                      //initialValue: course??'',
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
                        submitStudent(context,args);
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
  void submitStudent(BuildContext context,Student student) {

        student.id = int.parse(_idController.text);
        student.name = _nameController.text;
        student.course = _courseController.text;

        dbStudentManager.updateStudent(student).then((value) {
          // setState(() {
          //   studlist[updateindex].name = _nameController.text;
          //   studlist[updateindex].course = _courseController.text;
          // });
          _nameController.clear();
          _courseController.clear();
          Navigator.pushNamed(context, Routes.viewlist);
        });
      }
    }

