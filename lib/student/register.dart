import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proctor/service/auth.dart';
import 'package:proctor/student/home_page.dart';
import '../common/loading.dart';

class RegisterStudent extends StatefulWidget {
  final Function toggleForm;
  RegisterStudent({this.toggleForm, this.redirect});
  final Function redirect ;

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
            label: Text('Sign In'),
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
          padding: EdgeInsets.all(5.0),
          children: <Widget>
          [
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
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
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
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 10),
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

                   Container (
                    height: 50,
                    width:  500,
                    padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                    child :RaisedButton(
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Register with Email'),
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

                  ButtonBar(
                    children: <Widget>[
                      
                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: RaisedButton(
                          textColor: Colors.white,
                          color: Colors.blue[900],
                          child: Text(' Sign Up with Google'),
                          onPressed: () async {
                            dynamic result = await _auth.signInGoogle(credential);
                            if(result==null){
                            print('error Registering');
                            }
                            else{
                            print('Registered $result');
                            print(result.uid);
                            Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => HomePage()),
                            );//push context
                            } 
                          },
                        ),
                      ),

                      Container(
                        height: 50,
                        width: 500,
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        child: FlatButton( 
                          onPressed: () {
                            widget.redirect('teacher');
                          },
                          textColor: Colors.white,
                          color: Colors.blue[900],
                          child: Text('Are you a Teacher ?'),
                        ),
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