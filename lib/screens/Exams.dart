import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:limflutter/models/Exams.dart';
import 'package:limflutter/screens/Login.dart';
import 'package:limflutter/sidebars/ExamCreate.dart';
import 'package:limflutter/sidebars/ExamUpdate.dart';
import 'package:limflutter/sidebars/leftdrawer.dart';

class Exams extends StatefulWidget {
  const Exams({super.key});

  @override
  State<Exams> createState() => _ExamsState();
}

int idOfExam=0;
String nameOfExam="";
String takenTime="";
String docsExam="";

class _ExamsState extends State<Exams> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<Exams1> _exams= [];
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<Exams1> allExams=[];
    db.collection("exams").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          Exams1 examss=Exams1(
            examdocid: docSnapshot.id,
            examid: docSnapshot.data()['examid'],
            examname: docSnapshot.data()['examname'],
            timetotake: docSnapshot.data()['timetotake'],
          );
          allExams.add(examss);
          // print(docSnapshot.data()['name']);
          // print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
        setState(() {
          _exams=allExams;
        });
      },
      onError: (e) => print("Error completing: $e"),
      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              children: [
                _exams.length > 0
                ? Container(
                  height: MediaQuery.of(context).size.height*.8,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        for (var examss in _exams)
                          GestureDetector(
                            // onTap: () => _setUserId(students.id),
                            onTap: () {
                              setState(() {
                                docsExam=examss.examdocid;
                                print(docsExam);
                              });
                            },
                            onDoubleTap: (){
                              setState(() {
                                docsExam=examss.examdocid;
                                nameOfExam=examss.examname;
                                idOfExam=examss.examid;
                                takenTime=examss.timetotake;
                              });
                              Navigator.pushReplacementNamed(context, "7");
                            },
                            child: Container(
                              padding: EdgeInsets.all(40),
                              width: 300,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                                child: Container(
                                  width: 250.0,
                                  height: 150.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10.0),
                                      
                                      // Image.network(students.pic),
                                      SizedBox(height: 20.0),
                                      Text("Exam ID: "+examss.examid.toString()),
                                      Text("Exam: "+examss.examname),
                                      Text("Time to Take: "+examss.timetotake),
                                      ]
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
                : Center(
                    child: CircularProgressIndicator(),
                  ),

                  Row(children: [
                    Expanded(child:Container()),
                    userid=="EXibvyI7KEZy6OSJAF3UxwCdGru2"||useremail=="pappaasa@addu.edu.ph"?ExamCreate():Container(),
                    SizedBox(width: 30,),
                    userid=="EXibvyI7KEZy6OSJAF3UxwCdGru2"||useremail=="pappaasa@addu.edu.ph"?ExamUpdate():Container(),
                    Expanded(child:Container()),
                  ],)
            ],
            )
              )
          ]
          )
          );
             
  }
}