import 'studentlogin.dart';
import 'package:flutter/material.dart';

class forgetpassword extends StatefulWidget {
  forgetpassword({Key key}): super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}
class _LoginPageState extends State<forgetpassword> {
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
                Image.asset('assets/bmslogo.jpeg'),
                SizedBox(height: 40.0),
                Text('FORGET PASSWORD'),
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
                  labelText: 'Enter the email here',
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
                        builder: (context) => StudentLoginPage()),);
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
                      child: Text('SENT'),
                      onPressed: () {

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
