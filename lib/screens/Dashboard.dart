import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:limflutter/models/Students.dart';
import 'package:limflutter/screens/leftdrawer.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

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

@override
    Widget build(BuildContext context) {
      return 
        Scaffold(
          appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 175, 173, 175),
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
                          Text("ATENEO DE DAVAO UNIVERSITY" ,style: TextStyle(fontSize: 20, color: Colors.black),),
                          Text("Community Center Asset Management System" ,style: TextStyle(fontSize: 20, color: Colors.black),),
                                          
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
          _students.length > 0
          ? SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              alignment: WrapAlignment.center,
              direction: Axis.horizontal,
              children: [
                for (var students in _students)
                  Container(
                    padding: EdgeInsets.all(40),
                    width: 300,
                    child: Card(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                      child: Container(
                        width: 250.0,
                        height: 300.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            // Image.network(students.strMealThumb),
                            SizedBox(height: 20.0),
                            Text("description"+students.name),
                            Text(students.description),
                            Text(students.id),
                            // Text(students.age as String),
                            Text(students.sex),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          )
          : Center(
              child: CircularProgressIndicator(),
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