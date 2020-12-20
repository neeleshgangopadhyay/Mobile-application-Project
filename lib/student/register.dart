import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proctor/pages/login.dart';
import 'package:proctor/service/auth.dart';
import 'package:proctor/student/forgetpassword.dart';
import 'package:proctor/student/home_page.dart';
import '../common/loading.dart';

class RegisterStudent extends StatefulWidget {
  final Function toggleForm;
  RegisterStudent({this.toggleForm});

  @override
  _RegisterStudentState createState() => _RegisterStudentState();
}

class _RegisterStudentState extends State<RegisterStudent> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();



  final AuthService _auth = AuthService();
  String name = "";
  String email = "";
  String password = "";
  int sem = 1 ;
  String course = "";
  String contact = "";
  AuthCredential credential ;
  String regerror = "";
  bool loading = false ;
  final _formKey = GlobalKey<FormState>();
  
  @override
  Widget build(BuildContext context) {
    return loading? Loading() :Scaffold
      (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Student Sign Up'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign Up'),
            onPressed: (){
              widget.toggleForm();
            },
          ),
        ],
      ),
      
      body: SafeArea
        (
        child: ListView
          (
          padding: EdgeInsets.symmetric(horizontal: 25.0,vertical:10.0),
          children: <Widget>
          [
            SizedBox(height: 50.0),
            Column
              (
              children: <Widget>
              [
                Image.asset('images/Login.png'),
                SizedBox(height: 40.0),
                Text('STUDENT Sign Up'),
              ],
            ),
            
            Form( 
              key: _formKey,
              child: Column(
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: nameController,
                      validator: (val) => val.isEmpty ? 'Enter email': null ,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        fillColor: Colors.blue[50],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          borderSide: BorderSide(color : Colors.black, width : 2.0), 
                        ),
                        labelText: 'Email',
                      ),
                      onChanged: (val) {
                        setState(() => email = val);
                      }
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: TextFormField(
                      obscureText: true,
                      validator: (val) => val.length < 6 ? 'Enter more than 6 characters': null ,
                      controller: passwordController,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        fillColor: Colors.blue[50],
                        filled: true,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(1.0)),
                          borderSide: BorderSide(color : Colors.black, width : 2.0), 
                        ),
                        labelText: 'Password',
                      ),
                      onChanged: (val) {
                        setState(() => password = val);    
                      }
                    ),
                  ),
                  SizedBox(
                    height:10.0,
                    child: Text( 
                      '$regerror',
                        style:TextStyle(color: Colors.red, fontSize: 10),
                      ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () async {
                          //forgot password screen
                          Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => ForgetPassword()),
                            );//push context
                        },
                        textColor: Colors.blue,
                        child: Text('Forgot Password?'),
                        ),
                       Container (
                        height: 50,
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child :RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: Text('Email Login'),
                          onPressed: () async {
                          if(_formKey.currentState.validate()){
                            setState(() =>  loading = true);
                            print('email $email password $password');
                            dynamic result = await _auth.registeremailpassword(name, email, password, sem, course, contact);
                            if (result == null){
                              setState(() {
                                  loading = false ;
                                  regerror =  'Something Went Wrong' ;
                                } );
                            }    
                           }
                          },
                        ),
                      ),
                     
                      RaisedButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        child: Text(' Google Login'),
                        onPressed: () async {
                          dynamic result = await _auth.signInGoogle(credential);
                          if(result==null){
                          print('error signing in');
                          }
                          else{
                          print('signed in $result');
                          print(result.uid);
                          Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => HomePage()),
                          );//push context
                          } 
                        },
                      ),
                      FlatButton( 
                        onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(
                          builder: (context) => TeacherLogin()),
                          );
                        },
                        textColor: Colors.blue,
                        child: Text('Click here for the student login page'),
                      ),
                    ],
                  )
                ]
              )
            ),
          ],

        ),
      ),
    );
  }
}