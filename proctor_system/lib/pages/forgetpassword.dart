import 'package:proctor_system/service/auth.dart';

import 'login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class forgetpassword extends StatefulWidget {
  forgetpassword({Key key}): super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<forgetpassword> {
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
                Text('SIGN UP PAGE'),
              ],
            ),
            Container
              (
              padding: EdgeInsets.all(10),
              child:
              Form(
                key : _formkey,
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
                    //forgot password screen
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => LoginPage()),);
                  },
                  textColor: Colors.blue,
                  child: Text('Back to login screen'),
                ),
                Container
                  (
                    height: 50,
                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: RaisedButton
                      (
                      textColor: Colors.white,
                      color: Colors.blue,
                      child: Text('REGISTER'),
                      onPressed: () async {
                           if(_formkey.currentState.validate())
                             {
                                dynamic result = await _auth.registerWithEmailAndPassword(email, password);
                                 if(result == null)
                                   {
                                       setState(() => error = 'please supply a valid email');

                                   }

                             }
                      },
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
