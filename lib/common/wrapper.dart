//returns to main  auth status and homepage or authenticate
import 'package:proctor/common/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:proctor/models/users.dart';
import 'package:proctor/student/home_page.dart';
import 'package:provider/provider.dart';

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

/*
return Container(
      color: Colors.blueGrey[50],
      child: ButtonBar(
        children: <Widget>[
          ElevatedButton(
            onPressed: (){
              String usertype = "admin";
              redirect(usertype);
            },
            child: Text('Admin')
          ),
          ElevatedButton(
            onPressed: (){
              String usertype = "teacher";
              redirect(usertype);
            },
            child: Text("Teacher")
          ),
          ElevatedButton(
            onPressed: (){
              String usertype = "student";
              redirect(usertype);
            },
            child: Text("Student")
          ),
        ],

      ),

    );*/