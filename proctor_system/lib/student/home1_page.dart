import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class BlogsPage extends StatefulWidget {
  BlogsPage({Key key}): super(key: key);

  @override
  _BlogsPageState createState() => _BlogsPageState();
}

class _BlogsPageState extends State<BlogsPage> {





  @override
  Widget build(BuildContext context) {

    final student = Provider.of<QuerySnapshot>(context);
    for(var doc in student.documents)
    {}




    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(

      ),
    );
  }
}
