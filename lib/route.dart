import 'package:flutter/cupertino.dart';
import 'package:loginentry/viewlist.dart';
import 'package:loginentry/myhomepage.dart';
import 'package:loginentry/edit.dart';
import 'package:loginentry/loginpage.dart';
import 'package:loginentry/spaleshscreen.dart';
import 'package:loginentry/student/studentdetails.dart';
import 'package:loginentry/student/show_s_detail.dart';



 class Routes{
  Routes._();

  static const String viewlist="/viewlist";
  static const String myhomepage="/myhomepage";
  static const String myviewpage="/myviewpage";
  static const String loginpage="/loginpage";
  static const String splashscreen="/splashscreen";
  static const String studentdetails="/studentdetails";
static const String showstudentdetails="/showstudentdetails";

  static final routes=<String,WidgetBuilder>{
    viewlist:(BuildContext context)=>ViewList(),
    myhomepage:(BuildContext context)=>MyHomePage(),
    myviewpage:(BuildContext context)=>MyEditPage(),
    loginpage:(BuildContext context)=>Loginpage(),
    splashscreen:(BuildContext context)=>SplashScreen(),
    studentdetails:(BuildContext context)=>StudentDetails(),
    showstudentdetails:(BuildContext context)=>ShowStudentDetails(),

  };
}







