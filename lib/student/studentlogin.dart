import 'home_page.dart';
import 'forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:proctor_system/pages/login.dart';


class StudentLoginPage extends StatefulWidget {
  StudentLoginPage({Key key}): super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<StudentLoginPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

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
                Image.asset('images/Login.png'),
                SizedBox(height: 40.0),
                Text('STUDENT LOGIN'),
              ],
            ),
            Container
              (
              padding: EdgeInsets.all(10),
              child: TextField
                (
                controller: nameController,
                decoration: InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container
              (
              padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField
                (
                obscureText: true,
                controller: passwordController,
                decoration: InputDecoration
                  (
                  border: OutlineInputBorder(),
                  labelText: 'Password',
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
                        builder: (context) => forgetpassword()),);
                  },
                  textColor: Colors.blue,
                  child: Text('Forgot Password?'),
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
                      onPressed: () {
                        Navigator.push(context, new MaterialPageRoute(
                            builder: (context) => HomePage()),);
                      },
                    )
                ),
                FlatButton
                  (
                  onPressed: () {
                    Navigator.push(context, new MaterialPageRoute(
                        builder: (context) => LoginPage()),);
                  },
                  textColor: Colors.blue,
                  child: Text('Click here for the student login page'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

}
