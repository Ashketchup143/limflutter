import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:blur/blur.dart';
import 'package:limflutter/screens/leftdrawer.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  State<setting> createState() => _settingState();
}

class _settingState extends State<setting> {
    Widget build(BuildContext context) {
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
                          Text("ATENEO DE DAVAO UNIVERSITY" ,style: TextStyle(fontSize: 20, color: Colors.black),),
                          Text("Community Center Asset Management System" ,style: TextStyle(fontSize: 20, color: Colors.black),),
                                          
                        ],),
                      ),
                      Expanded(child: Container()),
                      ],),
          )
                    ),
          drawer: leftdrawer(),
          body:
          Text("Settings")
        );
    }

}