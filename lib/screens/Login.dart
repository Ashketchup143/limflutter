import 'package:blur/blur.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:limflutter/models/Students.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:limflutter/screens/Profile.dart';
import 'package:limflutter/services/authservice.dart';
import 'package:provider/provider.dart';

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
   final List<String> imageList = [
    'assets/addu-ccfc.jpg',
    'assets/addujacinto.jpg',
    'assets/addu-library.jpg',
    'assets/addu-matina.jpg',
    'assets/addu-students.jpg',
  ];

  String name= "";

  @override
  Widget build(BuildContext context){
  return Scaffold(
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
       Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0)),
                child: Container(
                  width: 800,
                  height: 600 ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: 
                  Row(
                    children: [Container(
                      width: 400,
                      height: 600,
                      decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.grey[200],
                      ),
                      child: Stack(
                  children: [
                    CarouselSlider(
                      items: imageList.map((imageUrl) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)
                          ),
                            color: Colors.grey[200],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(12.0),
                            bottomLeft: Radius.circular(12.0)
                          ),
                            child: Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        aspectRatio: 400 / 600,
                        pageSnapping: true,
                        viewportFraction: 1,
                        scrollDirection: Axis.horizontal,
                        scrollPhysics: PageScrollPhysics(),
                      ),
                    ),
                  ],
                ),

            
        
                      
                    ),
                      Expanded(child: Container()),
                        Column(
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
                            child: Text("ATENEO DE DAVAO UNIVERSITY",style: TextStyle(fontSize: 30), textAlign: TextAlign.center,)),
                          Text("Community Center A", style: TextStyle(fontSize:20), textAlign: TextAlign.center,),
                           Text("Asset Management System", style: TextStyle(fontSize:20), textAlign: TextAlign.center,),
                           Container(height: 40,),
                           Container(
                            width:300,
                            height:40,
                            child: 
                            TextField(
                              maxLines:1,
                              decoration: InputDecoration(
                                hintText: "username",
                                filled: true,
                                fillColor: Color.fromARGB(255, 243, 242, 242),
                                border: InputBorder.none,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(width:1, color: Color.fromARGB(255, 0, 0, 0)),
                                  borderRadius: BorderRadius.all(Radius.circular(5)
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(width:1, color: Color.fromARGB(255, 0, 0, 0)),
                                  borderRadius: BorderRadius.all(Radius.circular(5)
                                )
                                ) 
                              ),
                            ),
                          ),
                          Container(height: 10,),
                            Container(
                            width:300,
                            height:40,
                            child: 
                            TextField(
                              obscureText: true,
                              maxLines:1,
                              decoration: InputDecoration(
                                hintText: "password",
                                filled: true,
                                fillColor: Color.fromARGB(255, 243, 242, 242),
                                border: InputBorder.none,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(width:1, color: Color.fromARGB(255, 0, 0, 0)),
                                  borderRadius: BorderRadius.all(Radius.circular(5)
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(width:1, color: Color.fromARGB(255, 0, 0, 0)),
                                  borderRadius: BorderRadius.all(Radius.circular(5)
                                )
                                ) 
                              ),
                            ),
                          ),
                          Container(height: 10,),
                          Container(
                            width:175,
                            height: 30,
                            child: ElevatedButton(onPressed: () async {
                              await AuthService().signInWithGoogle().then((value){
                                
                                print(value.user?.displayName.toString());
                                final user=value.user?.displayName;
                                setState(() {
                                  this.name= user.toString();
                                });
                                if(user==null){
                                }else{
                                  Navigator.pushReplacementNamed(context, "4", arguments: this.name,);
                                }
                              }).onError((error, stackTrace){

                              });
                              // ignore: use_build_context_synchronously
                              
                              },
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
                                Navigator.pushReplacementNamed(context, "3");
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
                      ),
                      Expanded(child: Container()),
                    ],
                  ),
                ),
              ),
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
          
        ),
     ],
   )
  );
    }
}
