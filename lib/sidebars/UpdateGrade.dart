import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:limflutter/screens/Dashboard.dart';
import 'package:limflutter/screens/Exams.dart';
import 'package:limflutter/screens/StudProfile.dart';

class UpdateGrade extends StatefulWidget {
  const UpdateGrade({super.key});

  @override
  State<UpdateGrade> createState() => _UpdateGradeState();
}

class _UpdateGradeState extends State<UpdateGrade> {
  TextEditingController textController1 = TextEditingController();


  String displayText1 = "";

  
  // String? get userid => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                        
                        
                        // Text(widget.userid??""),
                        Text("Update Grade" ,style: TextStyle(fontSize: 35),),
                        SizedBox(height: 30,),
                        Text("Exam doc ID: "+docsExam1!),
                        Text("Exam Name: "+studExam1),
                        SizedBox(height: 10,),
                        // Textsfields(context,"ID",textController),
                        // SizedBox(height: 10,),
                        Textsfields(context,"grade",textController1),
                        SizedBox(height: 10,),
                       
                        
                       
                        ElevatedButton(
                          onPressed: () {
                            // create a map containing the data to store
                            Map<String, dynamic> userData = {};
                            
                            if (textController1.text.isNotEmpty) {
                              int? id = int.tryParse(textController1.text);
                              if (id != null) {
                                userData['grade'] = id;
                              }
                            }
    
                            // add the data to Firestore
                            CollectionReference collection=FirebaseFirestore.instance.collection("students");
                            DocumentReference document=collection.doc(studid!);
                            CollectionReference subcollection=document.collection("taken");
                            DocumentReference subdocument=subcollection.doc(docsExam1);
                            print(userData);
                            subdocument.update(userData).then((value) {
                              print("Document updated successfully.");
                            }).catchError((error) {
                              print("Failed to update document: $error");
                            });
    
                            setState(() {
                              displayText1 = textController1.text;
                              textController1.clear();
                            });
                            // print(displayText1);
                            //   print(displayText2);
                            //   print(displayText3);
                            //   print(displayText4);
                            //   print(displayText5);
                          },
                          child: Text("update grade"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: const Text('Update'),
      ),
    );
  }

  Container Textsfields(BuildContext context, String hint,TextEditingController control ) {
    return Container(
                      height:40,
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