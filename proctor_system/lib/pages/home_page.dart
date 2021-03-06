

import 'account_page.dart';
import 'home1_page.dart' ;
import 'people_page.dart';
import 'package:flutter/material.dart';
import 'package:proctor_system/service/auth.dart';
import 'package:proctor_system/service/database.dart';
import 'package:provider/provider.dart';
import 'package:proctor_system/mode/teacher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}): super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController();
  List<Widget> _screens = [
    BlogsPage(), PeoplesPage(), AccountPage()
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

  @override
  Widget build(BuildContext context) {
    
    return StreamProvider< List<Teacher>>.value(

      value: DatabaseService().teacher,

      child: Scaffold(
        body:
        PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: _onPageChanged,
          physics: NeverScrollableScrollPhysics(),
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: _onItemTapped,
            items:[
              BottomNavigationBarItem(
                icon: Icon(Icons.home,
                  color: _selectedIndex ==0 ? Colors.blue: Colors.grey,
                ),
                title: Text('Home',
                  style: TextStyle(color: _selectedIndex ==0 ? Colors.blue: Colors.grey,),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.people,
                  color: _selectedIndex ==1 ? Colors.blue: Colors.grey,
                ),
                title: Text('People',
                  style: TextStyle(color: _selectedIndex ==1 ? Colors.blue: Colors.grey,),
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person,
                  color: _selectedIndex ==2 ? Colors.blue: Colors.grey,
                ),
                title: Text('Account',
                  style: TextStyle(color: _selectedIndex ==2 ? Colors.blue: Colors.grey,),
                ),
              ),
            ] ),
      ),
    );

  }
}
