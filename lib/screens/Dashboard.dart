import 'package:flutter/material.dart';
import 'package:limflutter/screens/leftdrawer.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  


    Widget build(BuildContext context) {
      return 
        Scaffold(
          appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 175, 173, 175),
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
      //   Row(
      //     children: [
      //       Container(
      // width:MediaQuery.of(context).size.width<720?MediaQuery.of(context).size.width*.5:MediaQuery.of(context).size.width*.33,
      // height: MediaQuery.of(context).size.height,
      // color: Color.fromARGB(255, 175, 173, 175),
      // child: Column(
      //       children: [
      //         Container(
      //                 height:100,
      //                 width: 100,
      //                 child: Image.asset("assets/logo.png",fit:BoxFit.fill,),
      //                 ),
      //         Container(width: MediaQuery.of(context).size.width*.4,child: Text("Community Center Asset Management System",textAlign: TextAlign.center,)),
      //         Container(height: 40,),
      //         Container(
      //                 width:175,
      //                 height: 30,
      //                 child: ElevatedButton(onPressed: (() {
      //                   Navigator.pushReplacementNamed(context, "2");
      //                   }),
      //                   style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 158, 159, 158),side: BorderSide(width:1),elevation: 5),
      //                   child: 
      //                       Text("Dashboard", style: TextStyle(color: Colors.black),),
                         
      //                   )),
      //       Container(height: 20,),
      //       Container(
      //                 width:175,
      //                 height: 30,
      //                 child: ElevatedButton(onPressed: (() {
      //                   Navigator.pushReplacementNamed(context, "3");
      //                   }),
      //                   style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 158, 159, 158),side: BorderSide(width:1),elevation: 5),
      //                   child: 
      //                       Text("Settings", style: TextStyle(color: Colors.black),),
                         
      //                   )),
      //                   Container(height: 20,),
      //       Container(
      //                 width:175,
      //                 height: 30,
      //                 child: ElevatedButton(onPressed: (() {
      //                   Navigator.pushReplacementNamed(context, "4");
      //                   }),
      //                   style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 158, 159, 158),side: BorderSide(width:1),elevation: 5),
      //                   child: 
      //                       Text("Profile", style: TextStyle(color: Colors.black),),
                         
      //                   )),

      //       ],
      // ),
      //       ),
      //       Column(
      //         children: [
      //           Text("Dashboard", style: TextStyle(fontSize: 50),),
      //         ],
      //       )
      //     ],
      //   ),
        Text("Dashboard")
        );
    }

}