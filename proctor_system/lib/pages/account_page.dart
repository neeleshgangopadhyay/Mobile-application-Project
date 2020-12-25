import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:provider/provider.dart';
import 'package:proctor_system/mode/teacher.dart';
import 'package:proctor_system/mode/user.dart';
import 'package:proctor_system/service/database.dart';

import 'SecondRoute.dart';



class AccountPage extends StatefulWidget {
  AccountPage({Key key}): super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {







    return Scaffold(
        backgroundColor: Color(0xff00BCD1),
        body: InputPage(),
        appBar: AppBar(
          title: Text("TEACHER PROFILE PAGE"),
        ),



    );

  }
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}
class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {


    return Scaffold(


      body:

        Column(children: <Widget>[
          Image.asset('assets/teacher.jpg'),
          SizedBox(height: 30.0),


          Padding(
          padding: const EdgeInsets.all(8.0),




            child: Text(
            "PERSONAL BIODATA",
            textScaleFactor: 2,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Table(
            // textDirection: TextDirection.rtl,
            // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
            // border:TableBorder.all(width: 2.0,color: Colors.red),
            children: [
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "NAME",
                  textScaleFactor: 1.5,
                ),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),

              TableRow(children: [
                Text("DEGREE", textScaleFactor: 1.5),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("POST", textScaleFactor: 1.5),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("CONTACT", textScaleFactor: 1.5),
                Text("", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
            ],
          ),
        ),
      ]),
    floatingActionButton: Column(

      mainAxisAlignment: MainAxisAlignment.end,


    children:<Widget> [

          Text('Edit Profile'),
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondRoute()),
              );
            },
          ),
        ],
      ),
    );
  }
}
