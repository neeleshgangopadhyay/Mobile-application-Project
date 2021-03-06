import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:proctor_system/model/student.dart';
class AccountPage extends StatefulWidget {
  AccountPage({Key key}): super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {

    final student = Provider.of<List<Student>>(context);


    return Scaffold(
      backgroundColor: Color(0xff00BCD1),
      body: InputPage(),
      appBar: AppBar(
        title: Text("STUDENT PROFILE PAGE"),
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
        SizedBox(height: 15.0),


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
                  textScaleFactor: 1.0,
                ),
                Text("", textScaleFactor: 1.0),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),

              TableRow(children: [
                Text("SEMESTER", textScaleFactor: 1.0),
                Text("", textScaleFactor: 1.0),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("COURSE", textScaleFactor: 1.0),
                Text("", textScaleFactor: 1.0),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("PROCTOR", textScaleFactor: 1.0),
                Text("", textScaleFactor: 1.0),

              ]),
              TableRow(children: [
                Text(
                  "--------------------------------",
                  textScaleFactor: 1.5,
                ),
                Text("-------------------------------", textScaleFactor: 1.5),

              ]),
              TableRow(children: [
                Text("CONTACT", textScaleFactor: 1.0),
                Text("", textScaleFactor: 1.0),

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
class SecondRoute extends StatelessWidget{

  final name = TextEditingController();
  final phoneNumber = TextEditingController();

  final degree = TextEditingController();
  final post = TextEditingController();

 final year = TextEditingController();
  final teach = TextEditingController();


  @override
  Widget build(BuildContext context) {
    final student = Provider.of<List<Student>>(context);

    return Scaffold(
        appBar: AppBar(
          title: Text("UPDATE PROFILE PAGE"),
        ),
        body:

        SingleChildScrollView( child:  Center(
          child: Column(
            children: <Widget>[

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: name,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Name Here'),
                  )
              ),


              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: phoneNumber,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Phone Number Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: degree,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter semester Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: post,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter course Here'),
                  )
              ),
              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: year,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter year Here'),
                  )
              ),

              Container(
                  width: 280,
                  padding: EdgeInsets.all(10.0),
                  child: TextField(
                    controller: teach,
                    autocorrect: true,
                    decoration: InputDecoration(hintText: 'Enter Proctor name'),
                  )
              ),



              Container(
                width: 280,
                padding: EdgeInsets.all(10.0),

              ),



              RaisedButton(
                onPressed:() {
                  Navigator.pop(context);
                },
                elevation: 30,


                color: Color(0xffFF1744),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: Text('SHOW PROFILE'),
              ),
              RaisedButton(
                onPressed:() async {
                  Navigator.pop(context);
                },
                elevation: 30,


                color: Color(0xffFF1744),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(10, 15, 10, 15),
                child: Text('UPDATE'),
              ),

            ],
          ),
        )
    ),
    );
  }




}
