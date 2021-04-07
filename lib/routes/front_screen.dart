import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_app/widgets/widgets.dart';

class FrontScreen extends StatefulWidget {
  final fName;
  final lName;

  const FrontScreen({Key key, this.fName, this.lName}) : super(key: key);
  @override
  _FrontScreenState createState() => _FrontScreenState();
}

class _FrontScreenState extends State<FrontScreen> {
  String first;
  String last;
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _children = [
      AllPostWidget(),
      MyPostWidget(),
      ProfileWidget(
        fName: widget.fName,
        lName: widget.lName,
      )
    ];

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
