//to authenticate register and sign in
import 'package:flutter/material.dart';
import 'package:proctor/pages/login.dart';
import 'package:proctor/pages/register.dart';
import 'package:proctor/student/register.dart';
import 'package:proctor/student/signin.dart';


class Authenticate extends StatefulWidget {  
  
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  
  bool showSignin = true ;
  String usertype = "";
  void toggleForm(){
    setState(() => showSignin = !showSignin);
  }


 void redirect(userType){
  setState(() => usertype = userType);
  }


  @override
  Widget build(BuildContext context) {
    if(usertype == "admin")
    { return Container(
      color: Colors.orange,
      child: Text('This is admin Page'),
    ); 
      
    }
    else if(usertype == "teacher")
    {
      if (showSignin){
        return Container(
        child: TeacherLogin(toggleForm: toggleForm, redirect: redirect),
        );
      }
      else{
        return Container(
        child: RegisterTeacher(toggleForm: toggleForm, redirect: redirect),
        );
      }
    }
    else{
      if (showSignin){
        return Container(
        child: StudentLogin(toggleForm: toggleForm, redirect: redirect),
        );
      }
      else{
        return Container(
        child: RegisterStudent(toggleForm: toggleForm, redirect: redirect),
        );
      }
    }
    
  }     
}