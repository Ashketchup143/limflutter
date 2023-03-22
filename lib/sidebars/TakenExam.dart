import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:limflutter/models/SpecificExam.dart';
import 'package:limflutter/screens/Dashboard.dart';

class TakenExam extends StatefulWidget {
  const TakenExam({super.key});

  @override
  State<TakenExam> createState() => _TakenExamState();
}

String examnameid="";
String examnamecre="";
int examcodecre=0;

class _TakenExamState extends State<TakenExam> {
  final FirebaseFirestore db = FirebaseFirestore.instance;
  List<SpecificExam> _exams= [];
  @override
void initState() {
  super.initState();
  loadData();
}

Future<void> loadData() async {
  try {
    final examRef = FirebaseFirestore.instance
        .collection('exams');

    final querySnapshot = await examRef.get();

    final List<SpecificExam> allSpecExams = [];

    for (var docSnapshot in querySnapshot.docs) {
      SpecificExam SpecExams = SpecificExam(
        id: docSnapshot.id,
        name: docSnapshot.data()['examname'],
        code: docSnapshot.data()['examid'],

      );
      allSpecExams.add(SpecExams);
    }

    setState(() {
      _exams = allSpecExams;
    });
  } catch (e) {
    print("Error retrieving student data: $e");
  }
}


// String selectedExam="";

// Future<List<String>> getExamNames() async {
//   final examRef = FirebaseFirestore.instance.collection('exams');
//   final querySnapshot = await examRef.get();
//   List<String> examNames = [];
//   querySnapshot.docs.forEach((doc) {
//     examNames.add(doc.data()['examname']);
//   });
//   return examNames;
// }

  TextEditingController textController1 = TextEditingController();

  String displayText1 = "";


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 150,
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            enableDrag: true,
            isDismissible: true,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            builder: (_) {
              return DraggableScrollableSheet(
                expand: false,
                builder: (context, scrollController) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10.0,
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text("Taken Exam" ,style: TextStyle(fontSize: 35),),
                        SizedBox(height: 30,),
                        Container(
                          width: 500,
                          height: 150,
                          color: Color.fromARGB(255, 197, 195, 195),
                          child: 
                          ListView.builder(
                            itemCount: _exams.length,
                            itemBuilder: (context, index) {
                              final exam = _exams[index];
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    examnamecre=exam.name;
                                    examcodecre=exam.code;
                                    examnameid=exam.id;
                                  });
                                },
                                child: ListTile(
                                  title: Text(exam.name),
                                  subtitle: Text(exam.code.toString()),
                                ),
                              );
                            },
                          )
                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   itemCount: _examNames.length,
                          //   itemBuilder: (context, index) {
                          //     return GestureDetector(
                          //       onTap: () {
                          //         String selectedExam = _examNames[index];
                          //         print('Selected exam: $selectedExam');
                          //         // Do something with the selected exam name
                          //       },
                          //       child: ListTile(
                          //         title: Text(_examNames[index]),
                          //       ),
                          //     );
                          //   },
                          // ),
                        ),
                        Textsfields(context,"Grade",textController1),
                        SizedBox(height: 10,),
                        
                        
                          // ListView.builder(
                          //   shrinkWrap: true,
                          //   itemCount: _examNames.length,
                          //   itemBuilder: (context, index) {
                          //     return ListTile(
                          //       title: GestureDetector(
                          //         onTap: (){
                          //           setState(() {
                          //             specexam=_examNames
                          //           });
                          //         },
                          //         child: Text(_examNames[index])),
                          //     );
                          //   },
                          // ),
                        
                        // _examNames.length > 0
                        // ? Container(
                        //     color: Color.fromARGB(255, 234, 172, 244),
                        //     child: ListView.builder(
                        //       itemCount: _examNames.length,
                        //       itemBuilder: (context, index) {
                        //         final examName = _examNames[index];
                        //         return ListTile(
                        //           title: Text(examName),
                        //         );
                        //       },
                        //     ),
                        //   )
                        // : Center(
                        //     child: CircularProgressIndicator(),
                        //   ),

                        // FutureBuilder<List<String>>(
                        // future: getExamNames(),
                        // builder: (context, snapshot) {
                        //   if (!snapshot.hasData) {
                        //     return CircularProgressIndicator();
                        //   }
                        //   return Expanded(
                        //   child: DropdownButton<String>(
                        //     value: selectedExam,
                        //     items: snapshot.data!.map((examName) {
                        //       return DropdownMenuItem<String>(
                        //         value: examName,
                        //         child: Text(examName),
                        //       );
                        //     }).toList(),
                        //     onChanged: (value) {
                        //       setState(() {
                        //         selectedExam = value!;
                        //       });
                        //     },
                        //   ),
                        // );
                        // },
                        // ),
                        
                       
                        ElevatedButton(
                          onPressed: () {
                            // create a map containing the data to store
                            Map<String, dynamic> userData = {};
                            
                            userData['examid'] = examcodecre;

                            userData['examname'] = examnamecre;

                            if (textController1.text.isNotEmpty) {
                              int? grade = int.tryParse(textController1.text);
                              if (grade != null) {
                                userData['grade'] = grade;
                              }
                            }
    
                            // add the data to Firestore
                            FirebaseFirestore.instance.collection("students").doc(studid).collection("taken").add(userData);

                            Map<String, dynamic> otherData = {};
                            
                            otherData['studid'] = studid;

                            otherData['studname'] = studname;

                            if (textController1.text.isNotEmpty) {
                              int? grade = int.tryParse(textController1.text);
                              if (grade != null) {
                                otherData['grade'] = grade;
                              }
                            }
    
                            // add the data to Firestore
                            FirebaseFirestore.instance.collection("exams").doc(examnameid).collection("taken").add(otherData);
    
                            setState(() {
                              displayText1 = textController1.text;
                              textController1.clear();
                            });
                          },
                          child: Text("Student has taken this exam"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: const Text('Taken Exam'),
      ),
    );
  }

  Container Textsfields(BuildContext context, String hint,TextEditingController control ) {
    return Container(
                      height:50,
                      width: MediaQuery.of(context).size.width*.5,
                      decoration: BoxDecoration(
                        border: Border.all(color:Colors.grey),
                        borderRadius: BorderRadiusDirectional.circular(12)
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border:InputBorder.none,
                          hintText: hint
                        ),
                        controller: control,
                        maxLines: null,
                      ),
                    );
  }
}