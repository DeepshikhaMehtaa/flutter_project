import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:loginentry/student/model/student_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:loginentry/student/storage/constants.dart';
class SharedpefHelper{
  SharedpefHelper._();
  static SharedPreferences _pref;


  //string
  // static void saveString(String save)async{
  //   _pref = await SharedPreferences.getInstance();
  //   _pref.setString(Constant.SAVE_KEY, save);
  // }

  // static Future<String> getString()async{
  //   _pref = await SharedPreferences.getInstance();
  //   return _pref.getString(Constant.SAVE_KEY);
  // }


  //integer
  // static void saveInteger(int save)async{
  //  _pref =await SharedPreferences.getInstance();
  //  _pref.setInt(Constant.SAVE_KEY, save);
  // }
  // static Future<int>getInteger()async{
  //   _pref=await SharedPreferences.getInstance();
  //   return _pref.getInt(Constant.SAVE_KEY);
  // }

 /* static void saveUserDetail(StudentDetails studentDetails )async{
  _pref=await SharedPreferences.getInstance();
  _pref.setString(Constant.STUDENT_DETAIL,jsonEncode(new StudentDetails(image, name, rollno)));
  }*/

static void saveStudentDetail( Student studentDetails)async{
    _pref=await SharedPreferences.getInstance();
    _pref.setString(Constant.STUDENT_DETAIL, jsonEncode(Student(rollno: "12121212",name: "ddsdsdsdds")));
    //loadSharedPrefs();
}

static Future<String>readStudentDetail()async{
      _pref=await SharedPreferences.getInstance();
     // return _pref.getInt(Constant.STUDENT_DETAIL);
    return json.decode(_pref.getString(Constant.STUDENT_DETAIL));

    }


  // static loadSharedPrefs() async {
  //   try {
  //     StudentDetails studentDetails = StudentDetails.fromJson(await SharedpefHelper.saveStudentDetail((studentDetails)));
  //     print("checking..............${studentDetails.rollno}");
  //   } catch (Exception ) {
  //     print("checking............}");
  //     // do something
  //   }
  // }

  // final SharedPreferences _prefs = await SharedPreferences.getInstance();
  // bool result = await prefs.setString('user', jsonEncode(user));
  // print(result);

}

