import 'package:flutter/material.dart';
import 'bottom_appBar_demo.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'pages/splash_screen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  final SystemUiOverlayStyle _style =
      SystemUiOverlayStyle(statusBarColor: Colors.transparent);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(_style);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(),
    );
  }
}