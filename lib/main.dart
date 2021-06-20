import 'package:flutter/material.dart';
import 'package:loginentry/route.dart';
import 'package:loginentry/spaleshscreen.dart';
import 'package:loginentry/validationform.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: Routes.routes,
      home: SplashScreen(),
     // home: MyCustomForm(),
    );
  }
}

