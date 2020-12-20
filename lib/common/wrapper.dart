//returns to main  auth status and homepage or authenticate
import 'package:proctor/common/authentication/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:proctor/models/users.dart';
import 'package:proctor/student/home_page.dart';
import 'package:provider/provider.dart';

class UserType extends StatefulWidget {
  @override
  _UserTypeState createState() => _UserTypeState();
}

enum Utype { admin, teacher, student }

class _UserTypeState extends State<UserType> {
  Utype _val = Utype.student ;
  @override
  Widget build(BuildContext context) {
    return ButtonBar(
      children: <Widget>[
        ListTile(
          title: const Text('I am an Admin'),
          leading: Radio(
            value: Utype.admin,
            groupValue: _val,
            onChanged: (Utype value) {
              setState(() {
                _val = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('I am a Teacher'),
          leading: Radio(
            value: Utype.teacher,
            groupValue: _val,
            onChanged: (Utype value) {
              setState(() {
                _val = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('I am a Student'),
          leading: Radio(
            value: Utype.student,
            groupValue: _val,
            onChanged: (Utype value) {
              setState(() {
                _val = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    final user = Provider.of<AppUsers>(context);
    //provides app user to pages.

    if (user==null)
    {
      
      return Authenticate();
    }
    else
    {
      return HomePage();
    }

    // return either the Home or Authenticate widget
    
    
  }
}
