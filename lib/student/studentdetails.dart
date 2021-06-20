import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:loginentry/route.dart';
import 'dart:io';
import 'package:loginentry/student/storage/sharedpreferance.dart';

class StudentDetails extends StatefulWidget {
  @override
  _StudentDetailsState createState() => _StudentDetailsState();
}

class _StudentDetailsState extends State<StudentDetails> {
  final _formKey = GlobalKey<FormState>();
  var _Namecontroller = new TextEditingController();
  var _Rollnocontroller = new TextEditingController();

  File _image;
  final imagepicker=ImagePicker();
 
  Future chooseImage()async{
    final image= await imagepicker.getImage(source: ImageSource.gallery);
    setState(() {
      _image=File(image.path);
    });
  }
  Future getImage()async{
      final image= await imagepicker.getImage(source: ImageSource.camera);
      setState(() {
        _image=File(image.path);
      });
    }


Future<void>_showChoiseDialog(BuildContext context){
  return showDialog(context: context,builder:(BuildContext){
    return StatefulBuilder(
      builder: (context, setState) {
        return AlertDialog(

          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Align(alignment: Alignment.topRight,
                    child: InkWell(child: Icon(Icons.cancel_sharp,color: Colors.red,),
                      onTap: ()
                      {
                       Navigator.of(context).pop();
                        //Navigator.
                      },
                    ),
                ),
                Text("Make a Choise",
              style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 25,color: Colors.deepOrange),
            ),


                Divider(),
                GestureDetector(
                  child: Text("Gelley"),
                  onTap: ()
                  {
                    Navigator.of(context, rootNavigator: true)
                        .pop();
                    chooseImage();
                  },
                ),
                Padding(padding:EdgeInsets.all(8.0)),
                GestureDetector(
                  child: Text("Camera"),
                  onTap: ()
                  {
                    Navigator.of(context, rootNavigator: true)
                      .pop();

                    getImage();
                  },
                ),
              ],
            ),
          ),
        );
      }
    );
  } );
}
  @override
  void dispose() {
    // TODO: implement dispose
    _Rollnocontroller.dispose();
    _Namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.greenAccent,
        appBar: AppBar(
          title: Text("Student Details"),

        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(right: 30,left: 30,top: 90),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 66,
                          backgroundColor: Colors.deepOrange,

                          backgroundImage: _image==null?NetworkImage(''):FileImage(File(_image.path)),
                        ),
                        Positioned(
                          bottom: 1,
                          right: 1 ,
                          child: Container(
                          height: 40, width: 40,
                          child: InkWell(
                            child: Icon(
                              Icons.add_a_photo,
                              color: Colors.white,
                            ),
                            onTap: (){

                              _showChoiseDialog(context);

                            },
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                        ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    TextFormField(
                      controller: _Namecontroller,
                      validator: (val)=>
                      val.isNotEmpty?null:"Name is Required",
                      decoration: InputDecoration(
                        hintText: " Enter your Name",
                        labelText: "Name",
                      ),
                    ),
                    TextFormField(
                      controller: _Rollnocontroller,
                      validator: (val)=>
                      val.isNotEmpty?null:"Roll no is Required",
                      decoration: InputDecoration(
                        hintText: "Enter your Roll No",
                        labelText: "Roll No",
                      ),
                    ),
                    SizedBox(height: 10,),

                    Row(
                      //crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          child: Text("Save"),
                            onPressed: () {
                              if (_formKey.currentState.validate())
                              {

                                //SharedpefHelper.saveStudentDetail();
                                Navigator.pushNamed(context, Routes.showstudentdetails);
                              }
                            }
                            ),
                        SizedBox(width: 20,),
                        ElevatedButton(
                            child: Text("Edit"),
                            onPressed: ()
                            {
                              Navigator.pushNamed(context, Routes.studentdetails);
                            }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
