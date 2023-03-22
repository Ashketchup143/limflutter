import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:limflutter/screens/Login.dart';
import 'package:limflutter/sidebars/BottomCreate.dart';
import 'package:limflutter/sidebars/BottomUpdDel.dart';

import 'package:limflutter/sidebars/leftdrawer.dart';



class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
    
     Widget build(BuildContext context,) {
      // final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      // final name = args?['name']?.toString();
      // final photourl = args?['photourl']?.toString();
      // String? username="";
      // String? userphoto="";
      // setState(() {
      //   username=name;
      //   userphoto=photourl;
      // });
      // print(name);
      return 
        Scaffold(
          appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 2, 25, 138),
          centerTitle: true,
          title: 
          Center(
            child: Row(children: [
              Expanded(child: Container()),
              Container(
                      height:50,
                      width: 50,
                      child: Image.asset("assets/logo.png",fit:BoxFit.fill,),
                      ),
                      Container(
                        child: Column(children: [
                          Text("ATENEO DE DAVAO UNIVERSITY" ,style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),),
                          Text("Community Center Asset Management System" ,style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 255, 255, 255)),),
                                          
                        ],),
                      ),
                      Expanded(child: Container()),
                      ],),
          )
                    ),
          drawer: leftdrawer(),
          body: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width:MediaQuery.of(context).size.width,
                child:Image.asset("assets/addujacinto.jpg",fit:BoxFit.fill)
              ),
              Opacity(
                opacity: 0.5,
                child: 
                Container(
                height: MediaQuery.of(context).size.height,
                width:MediaQuery.of(context).size.width,  
                color: Color.fromARGB(255, 1, 30, 133),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  if (userphotourl != null)CircleAvatar(
                    radius: 100,
                    backgroundImage: Image.network(
                      userphotourl!,
                      fit: BoxFit.cover,
                    ).image,
                    ),
                  Text("Welcome to the Home Screen" ,style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 255, 255, 255)),),
                  if (username != null)Text( "user: "+username!,style: TextStyle(fontSize: 32, color: Color.fromARGB(255, 255, 255, 255)),),
                ],)
              )
            ],
             ),
              
    
             );
             
    }

}