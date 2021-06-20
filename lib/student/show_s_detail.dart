import 'package:flutter/material.dart';
class ShowStudentDetails extends StatefulWidget {
  @override
  _ShowStudentDetailsState createState() => _ShowStudentDetailsState();
}

class _ShowStudentDetailsState extends State<ShowStudentDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 35,right: 35),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //Image(image: null),
                Text("Name:-"),
              SizedBox(height: 20,),
              Text("Roll no:-"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
