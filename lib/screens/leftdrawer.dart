import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class leftdrawer extends StatelessWidget {
  const leftdrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
      height: MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 175, 173, 175),
      child: Column(
        children: [
          Container(
                  height:100,
                  width: 100,
                  child: Image.asset("assets/logo.png",fit:BoxFit.fill,),
                  ),
          Container(width: MediaQuery.of(context).size.width*.4,child: Text("Community Center Asset Management System",textAlign: TextAlign.center,)),
          Container(height: 40,),
          Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "2");
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 158, 159, 158),side: BorderSide(width:1),elevation: 5),
                    child: 
                        Text("Dashboard", style: TextStyle(color: Colors.black),),
                     
                    )),
        Container(height: 20,),
        Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "3");
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 158, 159, 158),side: BorderSide(width:1),elevation: 5),
                    child: 
                        Text("Settings", style: TextStyle(color: Colors.black),),
                     
                    )),
                    Container(height: 20,),
        Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "4");
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 158, 159, 158),side: BorderSide(width:1),elevation: 5),
                    child: 
                        Text("Profile", style: TextStyle(color: Colors.black),),
                     
                    )),

        ],
      ),
    );
  }
}