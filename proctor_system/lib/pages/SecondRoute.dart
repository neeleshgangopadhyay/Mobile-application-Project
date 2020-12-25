import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:proctor_system/mode/teacher.dart';
import 'package:proctor_system/mode/user.dart';
import 'package:proctor_system/service/database.dart';


class SecondRoute extends StatelessWidget{

  final name = TextEditingController();

  final phoneNumber = TextEditingController();

  final degree = TextEditingController();
  final post = TextEditingController();



  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return StreamBuilder<Userdata>(
        stream: DatabaseService(uid: user.id).userData,
        builder: (context, snapshot) {
          if(snapshot.hasData){

            Userdata userData =  snapshot.data;
            return Scaffold(
              appBar: AppBar(
                title: Text("UPDATE PROFILE PAGE"),
              ),
              body:
              SingleChildScrollView(child: Center(
                child: Column(
                  children: <Widget>[

                    Container(
                        width: 280,
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          initialValue: userData.name,
                          controller: name,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Enter Name Here'),

                        )
                    ),


                    Container(
                        width: 280,
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: phoneNumber,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Enter Phone Number Here'),
                        )
                    ),

                    Container(
                        width: 280,
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: degree,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Enter Degree Here'),
                        )
                    ),

                    Container(
                        width: 280,
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          controller: post,
                          autocorrect: true,
                          decoration: InputDecoration(hintText: 'Enter Post Here'),
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
          }else{

          }

        }
    );
  }




}