import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ExamCreate extends StatefulWidget {
  const ExamCreate({Key? key}) : super(key: key);

  @override
  State<ExamCreate> createState() => ExamCreateState();
}

class ExamCreateState extends State<ExamCreate> {
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();


  String displayText1 = "";
  String displayText2 = "";
  String displayText3 = "";


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
                        Text("Create Exam" ,style: TextStyle(fontSize: 35),),
                        SizedBox(height: 30,),
                        Textsfields(context,"Exam ID",textController1),
                        SizedBox(height: 10,),
                        Textsfields(context,"Exam Name",textController2),
                        SizedBox(height: 10,),
                        Textsfields(context,"Time To Take",textController3),
                        SizedBox(height: 10,),
                        
                       
                        ElevatedButton(
                          onPressed: () {
                            // create a map containing the data to store
                            Map<String, dynamic> userData = {};
                            
                            if (textController1.text.isNotEmpty) {
                              int? id = int.tryParse(textController1.text);
                              if (id != null) {
                                userData['examid'] = id;
                              }
                            }
                            if (textController2.text != "") {
                              userData['examname'] = textController2.text;
                            }
                            if (textController3.text != "") {
                              userData['timetotake'] = textController3.text;
                            }
    
                            // add the data to Firestore
                            FirebaseFirestore.instance.collection("exams").add(userData);
    
                            setState(() {
                              displayText1 = textController1.text;
                              displayText2 = textController2.text;
                              displayText3 = textController3.text;
                              textController1.clear();
                              textController2.clear();
                              textController3.clear();
                            });

                            Navigator.pushReplacementNamed(context, "6");
                            // print(displayText1);
                            //   print(displayText2);
                            //   print(displayText3);
                            //   print(displayText4);
                            //   print(displayText5);
                          },
                          child: Text("Save created exam"),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
        child: const Text('Create'),
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