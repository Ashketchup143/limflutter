import 'package:flutter/material.dart';
import 'package:limflutter/screens/Login.dart';
import 'package:limflutter/services/authservice.dart';

class leftdrawer extends StatefulWidget {
  const leftdrawer({super.key});

  @override
  State<leftdrawer> createState() => _leftdrawerState();
}

class _leftdrawerState extends State<leftdrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:MediaQuery.of(context).size.width<1000?MediaQuery.of(context).size.width/3:300,
      height: MediaQuery.of(context).size.height,
      color: Color.fromARGB(255, 10, 29, 123),
      child: Column(
        children: [
          Container(
                  height:100,
                  width: 100,
                  child: Image.asset("assets/logo.png",fit:BoxFit.fill,),
                  ),
          Container(height: 40,),
          Container(width: MediaQuery.of(context).size.width*.4,child: 
          Text("Community Center Asset Management System",textAlign: TextAlign.center, style: TextStyle(color:Colors.white),)),
          Container(height: 40,),
        //   Container(
        //           width:175,
        //           height: 30,
        //           child: ElevatedButton(onPressed: (() {
        //             Navigator.pushReplacementNamed(context, "/");
        //             }),
        //             style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255),side: BorderSide(width:1),elevation: 5),
        //             child: 
        //                 Text("Login", style: TextStyle(color: Colors.black),),
                     
        //             )),
        // Container(height: 20,),
        Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "4");
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255),side: BorderSide(width:1),elevation: 5),
                    child: 
                        Text("Home", style: TextStyle(color: Colors.black),),
                     
                    )),
                    
                    Container(height: 20,),
        Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "2");
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255),side: BorderSide(width:1),elevation: 5),
                    child: 
                        Text("Students", style: TextStyle(color: Colors.black),),
                     
                    )),
        Container(height: 20,),
                  Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (() {
                    Navigator.pushReplacementNamed(context, "6");
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255),side: BorderSide(width:1),elevation: 5),
                    child: 
                        Text("Exams", style: TextStyle(color: Colors.black),),
                     
                    )),
        Container(height: 20,),
      //  Container(
      //             width:175,
      //             height: 30,
      //             child: ElevatedButton(onPressed: (() {
      //               Navigator.pushReplacementNamed(context, "3");
      //               }),
      //               style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255),side: BorderSide(width:1),elevation: 5),
      //               child: 
      //                   Text("Settings", style: TextStyle(color: Colors.black),),
                     
      //               )),
      //               Container(height: 20,),

                    Container(
                  width:175,
                  height: 30,
                  child: ElevatedButton(onPressed: (()async {
                    print("signout1");
                    await AuthService().signOut();
                    print("signout2");
                    Navigator.pushReplacementNamed(context, "/");
                    setState(() {
                      userid="";
                      username= "";
                      userphotourl= "";
                      
                    });
                    }),
                    style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255),side: BorderSide(width:1),elevation: 5),
                    child: 
                        Text("Signout", style: TextStyle(color: Colors.black),),
                     
                    )),
                    Container(height: 20,),
                    // userid=="EXibvyI7KEZy6OSJAF3UxwCdGru2"?Text(userid):Container(),

        // Container(
        //           width:175,
        //           height: 30,
        //           child: ElevatedButton(onPressed: (() async{
        //             await AuthService().signOut();
        //             Navigator.pushReplacementNamed(context, "/");
        //             }),
        //             style: ElevatedButton.styleFrom(backgroundColor: Color.fromARGB(255, 255, 255, 255),side: BorderSide(width:1),elevation: 5),
        //             child: 
        //                 Text("Sign out", style: TextStyle(color: Colors.black),),
                     
        //             )),

        ],
      ),
    );
  }
}