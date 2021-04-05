import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
    DateTime _lastQuitTime;
    return WillPopScope(
      onWillPop: () async {
        if (_lastQuitTime == null ||
            DateTime.now().difference(_lastQuitTime).inSeconds > 1) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Press again Back Button to exit'),
            ),
          );
          _lastQuitTime = DateTime.now();
          return false;
        } else {
          print('sign out');
          SystemNavigator.pop();
          return true;
        }
      },
      child: Scaffold(
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
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
