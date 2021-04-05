import 'package:flutter/material.dart';
import 'package:social_app/widgets/widgets.dart';

class FrontScreen extends StatefulWidget {
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  int _currentIndex = 0;

  final List<Widget> _children = [
    AllPostWidget(),
    MyPostWidget(),
    ProfileWidget()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        elevation: 20,
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('All Posts'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            title: Text('My Posts'),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
