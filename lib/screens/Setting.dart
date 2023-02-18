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
          body:  Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Center(
              child: Container(
                height: 700,
                width: 500,
                child: Column(
                  children: [
                    Image.asset("assets/iphone.png",scale: 5,),
                    Container(height: 20,),
                    Text("Iphone 14" ,style: TextStyle(fontSize: 30),),
                    Container(height: 20,),
                    Container(
                      width: 400,
                      child: Text("The iPhone 14 display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.06 inches diagonally (actual viewable area is less)." ,style: TextStyle(fontSize: 20),textAlign: TextAlign.center,))
            
                  ],
                ),
              ).frosted(blur:10,borderRadius: BorderRadius.circular(12),frostColor: Colors.white),
            ),
          ),
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
            Center(
            child: Container(
              height: 700,
              width: 500,
              
              color:Colors.blue,
              child: Container(
                height: 700,
                width: 500,
                child: Column(
                  children: [
                    Image.asset("assets/iphone.png",scale: 5,),
                    Container(height: 20,),
                    Text("Iphone 14" ,style: TextStyle(fontSize: 30),),
                    Container(height: 20,),
                    Container(
                      width: 400,
                      child: Text("The iPhone 14 display has rounded corners that follow a beautiful curved design, and these corners are within a standard rectangle. When measured as a standard rectangular shape, the screen is 6.06 inches diagonally (actual viewable area is less)." ,style: TextStyle(fontSize: 20),textAlign: TextAlign.center,))
              
                  ],
                ),
              ).frosted(blur:10,borderRadius: BorderRadius.circular(12),frostColor: Colors.white),
            ),
            )
          ], 
            ),
            );
    }

}