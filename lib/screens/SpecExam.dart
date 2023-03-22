import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:limflutter/models/StudTakenexams.dart';
import 'package:limflutter/models/StudentsExams.dart';
import 'package:limflutter/screens/Dashboard.dart';
import 'package:limflutter/screens/Exams.dart';

class SpecExam extends StatefulWidget {
  const SpecExam({super.key});

  @override
  State<SpecExam> createState() => _SpecExamState();
}

class _SpecExamState extends State<SpecExam> {
   final FirebaseFirestore db = FirebaseFirestore.instance;
  List<StudTakenExams> _studentexams= [];
  @override
void initState() {
  super.initState();
  loadData();
}

Future<void> loadData() async {
  try {
    final studentRef = FirebaseFirestore.instance
        .collection('exams')
        .doc(docsExam)
        .collection('taken');

    final querySnapshot = await studentRef.get();

    final List<StudTakenExams> allStudExams = [];

    for (var docSnapshot in querySnapshot.docs) {
      StudTakenExams studentExams = StudTakenExams(
        id: docSnapshot.id,
        studname: docSnapshot.data()['studname'],
        studdentid: docSnapshot.data()['studid'],
        grade: docSnapshot.data()['grade'],
      );
      allStudExams.add(studentExams);
      print(studname);
    }

    setState(() {
      _studentexams = allStudExams;
    });
  } catch (e) {
    print("Error retrieving student data: $e");
  }
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
              ElevatedButton(onPressed: (){
                Navigator.pushReplacementNamed(context, "6");
              }, child: (Text("Return to Exams")),),
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
                child:Column(children: [
                  Container(height: 50,),
                  // Text(docsExam),
                  Text("Exam: "+nameOfExam,style: TextStyle(fontSize: 35, color: Colors.white), textAlign: TextAlign.center,),
                  Text("Exam ID: "+idOfExam.toString(),style: TextStyle(fontSize: 25, color: Colors.white), textAlign: TextAlign.center,),
                  Text("Time: "+takenTime,style: TextStyle(fontSize: 25, color: Colors.white), textAlign: TextAlign.center,),
                  Container(height: 20,),
                  Text("Students who took the exam:",style: TextStyle(fontSize: 30, color: Colors.white), textAlign: TextAlign.center,),
                  _studentexams.length > 0
                ? Container(
                  height: MediaQuery.of(context).size.height*.5,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        for (var takenex in _studentexams)
                          Container(
                            padding: EdgeInsets.all(40),
                            width: 325,
                            child: Card(
                              elevation: 10,
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                              child: Container(
                                width: 300.0,
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
                                    Text("Student Name: "+takenex.studname),
                                    Text("Student ID: "+takenex.studdentid),
                                    // Text("Time to Take: "+studex.timetotake),
                                    Text("Grade: "+takenex.grade.toString(), style: (TextStyle(color:takenex.grade>=72?Colors.green:Colors.red)),),
                                    ]
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                )
                : Center(
                    child: Container(),
                  ),
                ]) ,)
              
            ],
             ));
  }
}