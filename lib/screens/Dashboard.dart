import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:limflutter/models/Students.dart';
import 'package:limflutter/screens/Login.dart';
import 'package:limflutter/sidebars/BottomCreate.dart';
import 'package:limflutter/sidebars/BottomUpdDel.dart';
import 'package:limflutter/sidebars/leftdrawer.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

String studid="";
String _userId="";
String studname="";
String studphotourl="";

class _DashboardState extends State<Dashboard> {
  @override
   final FirebaseFirestore db = FirebaseFirestore.instance;
  List<Students> _students= [];
  
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List<Students> allStudents=[];
    db.collection("students").get().then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          Students students=Students(
            id: docSnapshot.id,
            name: docSnapshot.data()['name'],
            age: docSnapshot.data()['age'],
            description: docSnapshot.data()['description'],
            sex: docSnapshot.data()['sex'],
            pic:docSnapshot.data()['pic']
          );
          allStudents.add(students);
          // print(docSnapshot.data()['name']);
          // print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
        setState(() {
          _students=allStudents;
        });
      },
      onError: (e) => print("Error completing: $e"),
      
    );

  }
void _setUserId(String id) {
    setState(() {
      _userId = id;
      print(_userId);
    });
  }
@override
    Widget build(BuildContext context) {
      return 
        Scaffold(
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
                _students.length > 0
                ? Container(
                  height: MediaQuery.of(context).size.height*.8,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      children: [
                        for (var students in _students)
                          GestureDetector(
                            onTap: () => _setUserId(students.id),
                            // onTap: () {
                            //   setState(() {
                            //     userId = students.id;
                            //     print(userId);
                            //   });
                            // },
                            onDoubleTap: (){
                              setState(() {
                                studid = students.id;
                                studname=students.name;
                                studphotourl=students.pic;
                                print(studname);
                                // print(studid);
                                // print(studphotourl);
                              });
                              Navigator.pushReplacementNamed(context, "5");
                            },
                            // (){
                            //   userid=students.id;
                            //   print(userid);
                            // },
                            child: Container(
                              padding: EdgeInsets.all(40),
                              
                              width: 300,
                              child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                                child: Container(
                                  width: 250.0,
                                  height: 300.0,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 10.0),
                                      CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(students.pic),
                                      ),
                                      // Image.network(students.pic),
                                      SizedBox(height: 20.0),
                                      Text("Name: "+students.name,),
                                      Text("Description: "+students.description,),
                                      Text("ID: "+students.id, ),
                                      Text("Age: "+students.age.toString()),
                                      Text("Sex: "+students.sex,),
                                    ],
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
                    userid=="EXibvyI7KEZy6OSJAF3UxwCdGru2"||useremail=="pappaasa@addu.edu.ph"?BottomCreate():Container(),
                    SizedBox(width: 30,),
                    userid=="EXibvyI7KEZy6OSJAF3UxwCdGru2"||useremail=="pappaasa@addu.edu.ph"?BottomUpdateAndDelete(userid: _userId):Container(),
                    Expanded(child:Container()),
                  ],)
              
              
              ],
            ),
          ),
            ],
        
        // Column(children: <Widget>[
        //   Container(
        //     height:MediaQuery.of(context).size.height,
        //     width: MediaQuery.of(context).size.width,
        //     color: Colors.blue,
        //     child: ListView.builder(
        //       itemCount: _students.length,
        //       itemBuilder:(context, index) {
        //         if(_students.length==0){
        //         return Text("Nothing");
        //         } else {
        //           // _students[index].id
        //           return 
        //           Card(
        //             child: 
        //             Container(
        //               height: 250,
        //               width: 300,
                                  
        //             ),
        //           ),
                  // ListTile(
                  //   leading:Image.network(_students[index].pic),
                  //   title: Text(_students[index].name),
                  //   subtitle: Column(children: [
                  //     Text(_students[index].id),
                  //     Text(_students[index].description),
                  //     // Text(_students[index].age as String),
                  //     Text(_students[index].sex),
                  //   ],),
                  // );
        //         }
        //       },
        //     ),
        //   )]
        // ,)
        ));
    }

}