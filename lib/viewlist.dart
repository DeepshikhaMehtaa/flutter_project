import 'package:flutter/material.dart';
import 'package:loginentry/MyDBManager.dart';
import 'package:loginentry/route.dart';


class ViewList extends StatefulWidget {
  @override
  _ViewListState createState() => _ViewListState();
}

class _ViewListState extends State<ViewList> {

  final DBStudentManager dbStudentManager = new DBStudentManager();
  final _nameController = TextEditingController();
  final _courseController = TextEditingController();

  Student student;
  int updateindex;
  List<Student> studlist;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("DETAILS"),
        ),
       body: FutureBuilder(
         future: dbStudentManager.getStudentList(),
         builder: (context, snapshot) {
           if (snapshot.hasData) {
             studlist = snapshot.data;
             return ListView.builder(
               shrinkWrap: true,
               itemCount: studlist == null ? 0 : studlist.length,
               itemBuilder: (BuildContext context, int index) {
                 Student st = studlist[index];

                 return Card(
                   child: Row(
                     children: <Widget>[
                       Padding(
                         padding: const EdgeInsets.all(16.0),
                         child: Container(
                           width: width * 0.50,
                           child: Column(
                             children: <Widget>[
                               Text('ID: ${st.id}'),
                               Text('Name: ${st.name}'),
                               //Text('password: ${st.name}'),
                             ],
                           ),
                         ),
                       ),
                       IconButton(
                         onPressed: () {
                           Navigator.pushNamed(context, Routes.myviewpage,arguments: studlist[index]);
                            _nameController.text = st.name;
                             _courseController.text = st.course;
                            student = st;
                            updateindex = index;
                         },
                         icon: Icon(
                           Icons.edit,
                           color: Colors.blue,
                         ),
                       ),
                       IconButton(
                         onPressed: () {
                           dbStudentManager.deleteStudent(st.id);
                           setState(() {
                             studlist.removeAt(index);
                           });
                         },
                         icon: Icon(
                           Icons.delete,
                           color: Colors.red,
                         ),
                       ),
                     ],
                   ),
                 );
               },
             );
           }
           return CircularProgressIndicator();
         },
       ),
      ),
    );

  }
}
