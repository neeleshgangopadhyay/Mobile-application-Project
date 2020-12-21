import 'package:firebase_auth/firebase_auth.dart';
import 'package:proctor/models/students.dart';
import 'package:proctor/service/auth.dart';
import 'package:provider/provider.dart';
import 'package:proctor/service/database.dart';
import 'account_page.dart';
import 'home1_page.dart';
import 'course_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    BlogsPage(), CoursePage(), AccountPage(),
  ];
  int _selectedIndex = 0;
  void _onPageChanged(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  void _onItemTapped(int selectedIndex){
    _pageController.jumpToPage(selectedIndex);
  }
  final AuthService _auth = AuthService();
  final dbuser = FirestoreService();
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Student>>.value(
      value: FirestoreService().users,//add uid ifps
      child: Scaffold(
           backgroundColor: Colors.white,
          appBar: AppBar(
            title : Text('Proctor'),
            backgroundColor: Colors.blue,
            elevation : 0.0 ,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.exit_to_app_rounded),
                onPressed: () async {
                  await _auth.signout();
                }, 
                label :Text('logout'),
              ),
              FlatButton.icon(
                icon: Icon(Icons.exit_to_app_rounded),
                onPressed: () async {
                  dbuser.getusertype(FirebaseAuth.instance.currentUser.uid);
                }, 
                label :Text('usesrtype'),
              ),
              
            ],
          ),
          body: PageView(
              controller: _pageController,
              children: _screens,
              onPageChanged: _onPageChanged,
              //physics: NeverScrollableScrollPhysics(),
            ),
            

          bottomNavigationBar: BottomNavigationBar(
              onTap: _onItemTapped,
              items:[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home,
                    color: _selectedIndex ==0 ? Colors.blue: Colors.grey,
                  ),
                  label:'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book,
                    color: _selectedIndex ==1 ? Colors.blue: Colors.grey,
                  ),
                  label:'Courses',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person,
                    color: _selectedIndex ==2 ? Colors.blue: Colors.grey,
                  ),
                  label: 'Account',
                ),
              ] ),
      ),
    );

  }
}