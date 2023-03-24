import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:limflutter/screens/Login.dart';

class BottomUpdateAndDelete extends StatefulWidget {
  final String userid;

  BottomUpdateAndDelete({required this.userid, Key? key}) : super(key: key);

  @override
  State<BottomUpdateAndDelete> createState() => _BottomUpdateAndDeleteState();
}

class _BottomUpdateAndDeleteState extends State<BottomUpdateAndDelete> {
 final CollectionReference CreateUser  = FirebaseFirestore.instance.collection("students");
 
  TextEditingController textController = TextEditingController();
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  TextEditingController textController3 = TextEditingController();
  TextEditingController textController4 = TextEditingController();
  TextEditingController textController5 = TextEditingController();

  String displayText = "";
  String displayText1 = "";
  String displayText2 = "";
  String displayText3 = "";
  String displayText4 = "";
  String displayText5 = "";
  
  String? _userID;
  
  // String? get userid => null;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userID=widget.userid;
    print(_userID);
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
                        Text("Update Student User Profile" ,style: TextStyle(fontSize: 35),),
                        SizedBox(height: 30,),
                        Text("UserID: "+widget.userid!),
                        SizedBox(height: 10,),
                        // Textsfields(context,"ID",textController),
                        // SizedBox(height: 10,),
                        Textsfields(context,"Name",textController1),
                        SizedBox(height: 10,),
                        Textsfields(context,"Age",textController2),
                        SizedBox(height: 10,),
                        Textsfields(context,"Description",textController3),
                        SizedBox(height: 10,),
                        Textsfields(context,"Sex",textController4),
                        SizedBox(height: 10,),
                        Textsfields(context,"Picture",textController5),
                        SizedBox(height: 10,),
                       
                        
                       
                        ElevatedButton(
                          onPressed: () {
                            // create a map containing the data to store
                            Map<String, dynamic> updateUserData = {};
                            if (textController1.text != "") {
                              updateUserData['name'] = textController1.text;
                            }
                            if (textController2.text.isNotEmpty) {
                              int? age = int.tryParse(textController2.text);
                              if (age != null) {
                                updateUserData['age'] = age;
                              }
                            }
                            if (textController3.text != "") {
                              updateUserData['description'] = textController3.text;
                            }
                            if (textController4.text != "") {
                              updateUserData['sex'] = textController4.text;
                            }
                            if (textController5.text != "") {
                              updateUserData['pic'] = textController5.text;
                            }
                            print(textController);
                            print(updateUserData);
    
                            // add the data to Firestore
                            CollectionReference collection=FirebaseFirestore.instance.collection("students");
                            print(userid);
                            DocumentReference document=collection.doc(widget.userid!);
                            document.update(updateUserData);
    
                            setState(() {
                              displayText1 = textController1.text;
                              displayText2 = textController2.text;
                              displayText3 = textController3.text;
                              displayText4 = textController4.text;
                              displayText5 = textController5.text;
                              textController1.clear();
                              textController2.clear();
                              textController3.clear();
                              textController4.clear();
                              textController5.clear();
                            });
                            Navigator.pushReplacementNamed(context, "2");
                            // print(displayText1);
                            //   print(displayText2);
                            //   print(displayText3);
                            //   print(displayText4);
                            //   print(displayText5);
                          },
                          child: Text("Save updated profile"),
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