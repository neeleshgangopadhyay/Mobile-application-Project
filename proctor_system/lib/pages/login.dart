import 'package:proctor_system/service/auth.dart';

import 'home_page.dart';
import 'forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:proctor_system/student/studentlogin.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}): super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
   String email = '';
   String password = '';
   String error = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
      backgroundColor: Colors.white,
      body: SafeArea
        (
        child: ListView
          (
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>
          [
            SizedBox(height: 50.0),
            Column
              (
              children: <Widget>
              [
                Image.asset('assets/bmslogo.jpeg'),
                SizedBox(height: 40.0),
                Text('TEACHER LOGIN'),
              ],
            ),
            Container
              (
              padding: EdgeInsets.all(10),
              child:
              Form(
                key: _formkey,
                child:  TextFormField
                (
                  validator: (val) => val.isEmpty ? 'Enter an email' : null,
                  controller: nameController,
                decoration: InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'Email Id',
                ),
                 onChanged: (val){
                   setState(() => email = val);
                 },
              ),
            ),
            ),
            Container
              (
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child:
              Form(
              child:TextFormField
                (
                  validator: (val) => val.length < 6 ? 'Enter a password 6+ chars long' : null,
                  obscureText: true,
                controller: passwordController,
                  decoration: InputDecoration
                    (
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                  onChanged: (val){

                  setState(() => password = val);
                  }



              ),
            ),
            ),
            ButtonBar
              (
              children: <Widget>
              [
                FlatButton
                  (
                  onPressed: () {

                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => forgetpassword()),);
                  },
                  textColor: Colors.blue,
                  child: Text('Sign Up Page'),
                ),
                Container
                  (
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton
                      (
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('Login'),
                      onPressed: () async {
                        if(_formkey.currentState.validate())
                        {
                          dynamic result = await _auth.signInWithEmailAndPassword(email, password);
                          if(result == null)
                          {
                            setState(() => error = 'COULD NOT SIGN IN');

                          }
                          else
                            {
                              Navigator.push(context, new MaterialPageRoute(
                                  builder: (context) => HomePage()),);

                            }

                        }

                      },
                    )
                ),
                FlatButton
                  (
                  onPressed: () async {

                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => StudentLoginPage()),);
                  },
                  textColor: Colors.blue,
                  child: Text('Click here if you are a Student'),
                ),



              ],
            )
          ],
        ),
      ),
    );
  }

}
