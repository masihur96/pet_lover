import 'package:flutter/material.dart';
import 'package:pet_lover/home.dart';
import 'package:pet_lover/login.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.black12));

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Colors.black,
        primarySwatch: Colors.deepOrange,
      ),
      home: Login(),
    );
  }
}
