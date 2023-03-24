import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:limflutter/screens/Exams.dart';
import 'package:limflutter/screens/Login.dart';

class ExamUpdate extends StatefulWidget {
  const ExamUpdate({super.key});

  @override
  State<ExamUpdate> createState() => _ExamUpdateState();
}

class _ExamUpdateState extends State<ExamUpdate> {
 
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();


  String displayText1 = "";
  String displayText2 = "";

  
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
                        Text("Update Exam" ,style: TextStyle(fontSize: 35),),
                        SizedBox(height: 30,),
                        Text("UserID: "+docsExam!),
                        SizedBox(height: 10,),
                        // Textsfields(context,"ID",textController),
                        // SizedBox(height: 10,),
                        Textsfields(context,"examname",textController1),
                        SizedBox(height: 10,),
                        Textsfields(context,"timetotake",textController2),
                       
                        
                       
                        ElevatedButton(
                          onPressed: () {
                            // create a map containing the data to store
                            Map<String, dynamic> userData = {};
                            
                            if (textController1.text != "") {
                              userData['examname'] = textController1.text;
                            }
                            if (textController2.text != "") {
                              userData['timetotake'] = textController2.text;
                            }
    
                            // add the data to Firestore
                            CollectionReference collection=FirebaseFirestore.instance.collection("exams");
                            DocumentReference document=collection.doc(docsExam!);
                            document.update(userData);
    
                            setState(() {
                              displayText1 = textController1.text;
                              displayText2 = textController2.text;
                              textController1.clear();
                              textController2.clear();
                            });
                            Navigator.pushReplacementNamed(context, "6");
                            // print(displayText1);
                            //   print(displayText2);
                            //   print(displayText3);
                            //   print(displayText4);
                            //   print(displayText5);
                          },
                          child: Text("Save updated exam"),
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