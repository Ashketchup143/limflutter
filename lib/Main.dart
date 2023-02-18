import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:glass/glass.dart';
import 'package:blur/blur.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:limflutter/screens/Dashboard.dart';
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
        '/':(context) => MyHomePage(title: "home",),
        '2':(context) => Dashboard(),
        '3':(context) => setting(),
        '4':(context) => profile(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
 Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext , BoxConstraints constraints){
        if(constraints.maxWidth>720){
          return webUI(context);
        } else{
          return mobileUI(context);
        }
      },
      );
  }

    Widget mobileUI(BuildContext context) {
      return 
        Scaffold(
          body: logincard(context),
        );
    }
    Widget webUI(BuildContext context) {
      return 
        Scaffold(
      body: logincard(context),
       );
    }

    Container logincard(BuildContext context) {
      return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 600,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12)
            ),
            child: (Column(
              children: [
                Container(
                  height: 50,
                ),
                Container(
                  height:150,
                  width: 150,
                  child: Image.asset("assets/logo.png",fit:BoxFit.fill,),
                  ),
                
                Container(
                  width: 350,
                  child: Text("ATENEO DE DAVAO UNIVERSITY",style: TextStyle(fontSize: 45), textAlign: TextAlign.center,)),
                Text("Community Center A", style: TextStyle(fontSize:20), textAlign: TextAlign.center,),
                 Text("Asset Management System", style: TextStyle(fontSize:20), textAlign: TextAlign.center,),
                 Container(height: 80,),
                Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "2");
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 197, 246, 179),side: BorderSide(width:1)),
                    child: Row(
                      children: [
                        Container(width:5),
                        Text("Login with Google", style: TextStyle(color: Colors.black),),
                        Icon(Icons.mail_outline)
                      ],
                    )),
                ),
                Container(height: 10,),
                  Container(
                    width: 175,
                    height: 30,
                    child: ElevatedButton(onPressed: (() {
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 114, 214, 247),side: BorderSide(width:1)),
                    child: Row(
                      children: [
                        Container(width:10),
                        Text("Login as Guest", style: TextStyle(color: Colors.black),),
                        Icon(Icons.supervised_user_circle)
                      ],
                    )),
                  ),
              ],
            )),
          ).frosted(blur:10,borderRadius: BorderRadius.circular(12),frostColor: Colors.grey)
        ],
      ),
      
    );
    }
}
