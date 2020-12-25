import 'package:flutter/material.dart';
import 'studentlogin.dart';
import 'forgetpassword.dart';



class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: forgetpassword(),
    );
  }
}