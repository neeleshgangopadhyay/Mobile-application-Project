import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:proctor_system/model/student.dart';
class CoursePage extends StatefulWidget {
  CoursePage({Key key}): super(key: key);

  @override
  _CoursePageState createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  @override
  Widget build(BuildContext context) {
    final student = Provider.of<List<Student>>(context);



    return Scaffold(
      appBar: AppBar(title: Text("Course Registration"),
      ),
      body:

      Table(
        border: TableBorder.all(),
        columnWidths: {
          1: FlexColumnWidth(3),
          2: FlexColumnWidth(1.2),
        },
        children: [
          TableRow(children: [
            Text('SL.NO',textAlign: TextAlign.center,
              style: TextStyle(fontWeight:FontWeight.bold, fontSize:18),
            ),
            Text('Subject Name',textAlign: TextAlign.center,
              style: TextStyle(fontWeight:FontWeight.bold, fontSize:18),
            ),
            Text('Course code',textAlign: TextAlign.center,
              style: TextStyle(fontWeight:FontWeight.bold, fontSize:18),
            ),
            Text('Grade',textAlign: TextAlign.center,
              style: TextStyle(fontWeight:FontWeight.bold, fontSize:18),
            ),
          ]),
          TableRow(children: [
            Text('1',textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
          ]),
          TableRow(children: [
            Text('2',textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
          ]),
          TableRow(children: [
            Text('3',textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
          ]),
          TableRow(children: [
            Text('4',textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
          ]),
          TableRow(children: [
            Text('5',textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
            TextField(
              textAlign: TextAlign.center,
            ),
          ]),





        ],
      ),

    );


  }
}
