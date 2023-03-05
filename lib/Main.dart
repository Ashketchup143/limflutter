import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:blur/blur.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:limflutter/screens/Dashboard.dart';
import 'package:limflutter/screens/Login.dart';
import 'package:limflutter/screens/Profile.dart';
import 'package:limflutter/screens/Setting.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/':(context) => Login(title: "Login"),
        '2':(context) => Dashboard(),
        '3':(context) => setting(),
        '4':(context) => profile(),
      },
    );
  }
}



