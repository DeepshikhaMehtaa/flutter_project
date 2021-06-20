import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginentry/route.dart';

import 'package:loginentry/storages/shared_pref.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),

            () => navigateUser()
    );
  }

  void navigateUser() async {
    SharedManger.getFirstLogin().then((value) => {
      if (value==true)
        {
          Navigator.pushReplacementNamed(context, Routes.myhomepage),
        }
      else
        {
          Navigator.pushReplacementNamed(context, Routes.loginpage),
        }
    });
  }

    @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.purpleAccent,
        child: FlutterLogo(size: MediaQuery.of(context).size.height)
    );
  }
}
