import 'package:flutter/material.dart';
import 'package:loginentry/storages/shared_pref.dart';
import 'package:loginentry/myhomepage.dart';
import 'package:loginentry/route.dart';
import 'package:loginentry/student/storage/sharedpreferance.dart';

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _formKey = GlobalKey<FormState>();
  var _userNamecontroller = new TextEditingController();
  var _paswwordcontroller = new TextEditingController();
  var _emailcontroller = new TextEditingController();
  //SharedPreferences logindata;
  //bool newuser;

  @override
  void dispose() {
    // TODO: implement dispose
    _userNamecontroller.dispose();
    _paswwordcontroller.dispose();
    _emailcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text("Login Page"),
            centerTitle: true,
            backgroundColor: Colors.purple[400],
          ),
          body: SingleChildScrollView(
            child:
            Form(
              key: _formKey,
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("USERNAME"),
                        TextFormField(
                            controller: _userNamecontroller,
                            validator: (val)=>
                            val.isNotEmpty?null:"UserName is required",
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.account_circle_sharp),
                              labelText: "UserName",
                              hintText: "Enter your UserName ",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular((30.0)),),
                              ),
                            ),
                          ),
                      SizedBox(height: 7,),
                      Text("PASSWORD"),
                       TextFormField(
                        controller: _paswwordcontroller,
                        validator: (val)=>
                        val.isNotEmpty?null:"Password is Required",
                        obscureText: true,
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.lock),
                          labelText: "Password",
                          hintText: "Enter your Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular((30.0)),),
                          ),
                        ),
                      ),
                      SizedBox(height: 7,),
                      Text("EMAIL"),
                  TextFormField(
                            controller: _emailcontroller,
                            validator: (val)=>
                            val.isNotEmpty?null:"Email is required",
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.email),
                              labelText: "Email",
                              hintText: "Enter your Email",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular((30.0)),),
                              ),
                            ),
                          ),
                      SizedBox(height: 7,),
                      Center(
                        child: RaisedButton(
                          child: Text("Login"),
                          onPressed: () {
                            if (_formKey.currentState.validate()){
                              if (_userNamecontroller.text.isNotEmpty && _paswwordcontroller.text.isNotEmpty) {
                                SharedManger.saveFirstLogin(true);
                                // Navigator.pushNamed(context, Routes.myhomepage());
                               // Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage(userName:_userNamecontroller.text)));
                               // Navigator.pushReplacementNamed(context, Routes.myhomepage, arguments: _userNamecontroller.text );
                              /*  Navigator.of(context).pushReplacement(                                                         //new
                                    new MaterialPageRoute(                                                                       //new
                                        settings: const RouteSettings(name: Routes.myhomepage),                                              //new
                                        builder: (context) => new MyHomePage(userName: _userNamecontroller.text, ) //new
                                    )                                                                                            //new
                                );*/
                                SharedpefHelper.saveStudentDetail(null);
                               // SharedpefHelper.saveStudentDetail(null);
                             /*   Navigator. pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) => MyHomePage(userName: _userNamecontroller.text,),
                                  ),
                                      (route) => false,
                                );*/
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
      ),
    );
  }
}

