import 'package:blur/blur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:limflutter/models/Students.dart';

class Login extends StatefulWidget {
  const Login({super.key, required String title});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // final FirebaseFirestore db = FirebaseFirestore.instance;
  // List<Students> _students= [];
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   List<Students> allStudents=[];
  //   db.collection("students").get().then(
  //     (querySnapshot) {
  //       print("Successfully completed");
  //       for (var docSnapshot in querySnapshot.docs) {
  //         Students students=Students(
  //           id: docSnapshot.id,
  //           name: docSnapshot.data()['name'],
  //           age: docSnapshot.data()['age'],
  //           pic1: docSnapshot.data()['pic1']
  //         );
  //         allStudents.add(students);
  //         print(docSnapshot.data()['name']);
  //         // print('${docSnapshot.id} => ${docSnapshot.data()}');
  //       }
  //       setState(() {
  //         _students=allStudents;
  //       });
  //     },
  //     onError: (e) => print("Error completing: $e"),
  //   );
  // }
  
  @override
  Widget build(BuildContext context){
  return Scaffold(
   body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 9, 64, 109),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 400,
            height: 600 ,
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
                        Icon(Icons.mail_outline, color: Colors.black)
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
                        Icon(Icons.supervised_user_circle, color: Colors.black,)
                      ],
                    )),
                  ),
              ],
            )),
          ).frosted(blur:1,borderRadius: BorderRadius.circular(12),),
        //   Column(children: <Widget>[
        //   Container(
        //     height: 400,
        //     child: ListView.builder(
        //       itemCount: _students.length,
        //       itemBuilder:(context, index) {
        //         if(_students.length==0){
        //         return Text("Nothing");
        //         } else {
        //           return Text(_students[index].id);
        //         }
        //       },
        //     ),
        //   )]
        // ,)
        ],
      ),
      
    )
  );
    }
}
