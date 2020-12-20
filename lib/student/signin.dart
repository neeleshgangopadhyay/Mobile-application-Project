import 'package:firebase_auth/firebase_auth.dart';
import 'package:proctor/service/auth.dart';
import 'package:proctor/student/forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:proctor/pages/login.dart';
import 'package:proctor/common/loading.dart';
import 'package:proctor/student/home_page.dart';

 
class StudentLogin extends StatefulWidget {
  
  StudentLogin({this.toggleForm}) ;
  final Function toggleForm;
  @override
  _StudentLoginState createState() => _StudentLoginState();
}

class _StudentLoginState extends State<StudentLogin> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String regerror = "";
  bool loading = false ;
  String email = "";
  String password = "";
  AuthCredential credential ;

  @override
  Widget build(BuildContext context) {
    return loading? Loading() : Scaffold
      (
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0.0,
        title: Text('Sign In'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Register'),
            onPressed:(){
              widget.toggleForm();
            }
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
                Text('STUDENT LOGIN'),
              ],
            ),
            
            Form(
              key: _formKey, 
              child: Column(
                children: <Widget> [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: TextFormField(
                      validator: (val) => val.isEmpty ? 'Enter email': null ,
                      controller: nameController,
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
                      validator: (val) => val.length < 6 ? 'Enter more than 6 characters': null ,
                      obscureText: true,
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
                          child: Text(' Continue without logging in.'),
                          onPressed: () async {
                            dynamic result = await _auth.signInAnonymous();
                            if(result==null){
                            print('error signing in');
                            }
                            else{
                              print('signed in $result');
                              print(result.displayName);
                            } 
                          },
                        ),
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
                              dynamic result = await _auth.signinEmailpassword(email, password);
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
                        child: Text('Click here for the Teacher login page'),
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
