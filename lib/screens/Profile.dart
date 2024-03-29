import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:limflutter/screens/leftdrawer.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
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
        Scaffold(appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 175, 173, 175),
        title: Row(children: [Container(
                  height:50,
                  width: 50,
                  child: Image.asset("assets/logo.png",fit:BoxFit.fill,),
                  ),
                  Column(children: [
                    Text("ATENEO DE DAVAO UNIVERSITY" ,style: TextStyle(fontSize: 20, color: Colors.black),),
                    Text("Community Center Asset Management System" ,style: TextStyle(fontSize: 20, color: Colors.black),),

                  ],)

        ],)
        ),
        drawer: leftdrawer(),
        body: Container(child: Text("Profile", style: TextStyle(fontSize: 50),),)
        );
    }
    Widget webUI(BuildContext context) {
      return 
        Scaffold(body:
        Row(
          children: [
            Container(
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
            ),
            Column(
              children: [
                Text("Profile", style: TextStyle(fontSize: 50),),
              ],
            )
          ],
        ),
          

        );
    }
}