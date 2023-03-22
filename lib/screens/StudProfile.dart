import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:limflutter/models/StudentsExams.dart';
import 'package:limflutter/screens/Dashboard.dart';
import 'package:limflutter/screens/Login.dart';
import 'package:limflutter/sidebars/TakenExam.dart';
import 'package:limflutter/sidebars/UpdateGrade.dart';
import 'package:limflutter/sidebars/leftdrawer.dart';

class StudProfile extends StatefulWidget {
  const StudProfile({super.key});

  @override
  State<StudProfile> createState() => _StudProfileState();
}
String docsExam1="";
String studExam1="";

class _StudProfileState extends State<StudProfile> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<StudentExams> _studentexams= [];
  @override
void initState() {
  super.initState();
  loadData();
}

Future<void> loadData() async {
  try {
    final studentRef = FirebaseFirestore.instance
        .collection('students')
        .doc(studid)
        .collection('taken');

    final querySnapshot = await studentRef.get();

    final List<StudentExams> allStudExams = [];

    for (var docSnapshot in querySnapshot.docs) {
      StudentExams studentExams = StudentExams(
        exdocid: docSnapshot.id,
        examid: docSnapshot.data()['examid'],
        examname: docSnapshot.data()['examname'],
        grade: docSnapshot.data()['grade'],
      );
      allStudExams.add(studentExams);
    }

    setState(() {
      _studentexams = allStudExams;
    });
  } catch (e) {
    print("Error retrieving student data: $e");
  }
}


//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     String studentId=studid;
//     print(studentId);
//     Future<void> getStudentData(String studentId) async {
//       print("object");
//   try {
//     print("here");
//     final studentRef = FirebaseFirestore.instance
//         .collection('students')
//         .doc("04zta4xxmfAPCFfJYj9F")
//         .collection('taken');

//     final querySnapshot = await studentRef.get();
//     print("second");
//     final List<StudentExams> allStudExams = [];

//     for (var docSnapshot in querySnapshot.docs) {
//       StudentExams studentExams = StudentExams(
//         exdocid: docSnapshot.id,
//         examid: docSnapshot.data()['examid'],
//         examname: docSnapshot.data()['examname'][0],
//         grade: docSnapshot.data()['grade'],
//       );
//       allStudExams.add(studentExams);
      
//     }

//     setState(() {
//       _studentexams = allStudExams;
//       print(_studentexams);
//     });
//   } catch (e) {
//     print("Error retrieving student data: $e");
//   }
// }
//     List<StudentExams> allStudExams=[];
//     Future<void> fetchStudentExams() async {
//   try {
//     final querySnapshot = await db
//         .collection("students")
//         .doc("04zta4xxmfAPCFfJYj9F")
//         .collection("taken")
//         .get();

//     print("Successfully completed");

//     for (var docSnapshot in querySnapshot.docs) {
//       StudentExams studentExams = StudentExams(
//         exdocid: docSnapshot.id,
//         examid: docSnapshot.data()['examid'],
//         examname: docSnapshot.data()['examname'],
//         timetotake: docSnapshot.data()['timetotake'],
//         grade: docSnapshot.data()['grade'],
//       );
//       allStudExams.add(studentExams);
//     }

//     setState(() {
//       _studentexams = allStudExams;
//     });
//   } catch (e) {
//     print("Error completing: $e");
//   }
// }

    // db.collection("students").doc(studid.toString()).collection("taken").get().then(
    //   (querySnapshot) {
    //     print("Successfully completed");
    //     for (var docSnapshot in querySnapshot.docs) {
    //       StudentExams studentExams=StudentExams(
    //         exdocid: docSnapshot.id,
    //         examid: docSnapshot.data()['examid'],
    //         examname: docSnapshot.data()['examname'],
    //         timetotake: docSnapshot.data()['timetotake'],
    //         grade: docSnapshot.data()['grade'],
    //       );
    //       allStudExams.add(studentExams);
    //       // print(docSnapshot.data()['name']);
    //       // print('${docSnapshot.id} => ${docSnapshot.data()}');
    //     }
    //     setState(() {
    //       _studentexams=allStudExams;
    //     });
    //   },
    //   onError: (e) => print("Error completing: $e"),
      
    // );
  // }

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
                Navigator.pushReplacementNamed(context, "2");
              }, child: (Text("Return to Students")),),
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
            child: Column(
              children: [
                Container(height: 50,),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(studphotourl),
                ),
                Text(studname,style: TextStyle(fontSize: 35, color: Colors.white), textAlign: TextAlign.center,),
                Text(studid,style: TextStyle(fontSize: 25, color: Colors.white), textAlign: TextAlign.center,),
                Container(height:20),
                Text("Exams taken:",style: TextStyle(fontSize: 35, color: Colors.white), textAlign: TextAlign.center,),
                Container(height: 30,),
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
                        for (var studex in _studentexams)
                          GestureDetector(
                            // onTap: () => _setUserId(students.id),
                            onTap: () {
                              setState(() {
                                docsExam1=studex.exdocid;
                                studExam1=studex.examname;

                                print(docsExam1);
                              });
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
                                      Text("Exam ID: "+studex.examid.toString()),
                                      Text("Exam: "+studex.examname),
                                      // Text("Time to Take: "+studex.timetotake),
                                      Text("Grade: "+studex.grade.toString(), style: (TextStyle(color:studex.grade>=72?Colors.green:Colors.red)),),
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
                    child: Container(),
                  ),
                  Row(children: [
                    Expanded(child:Container()),
                    userid=="EXibvyI7KEZy6OSJAF3UxwCdGru2"||useremail=="pappaasa@addu.edu.ph"?TakenExam():Container(),
                    SizedBox(width: 30,),
                    userid=="EXibvyI7KEZy6OSJAF3UxwCdGru2"||useremail=="pappaasa@addu.edu.ph"?UpdateGrade():Container(),
                    Expanded(child:Container()),
                  ],)
            ],
             )
             )
          ])
    );
  }
}