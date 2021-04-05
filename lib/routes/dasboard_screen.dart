import 'package:flutter/material.dart';
import 'package:social_app/Layout/nav_bar_layout.dart';
import 'package:social_app/routes/routes.dart';

class DashBoard extends StatelessWidget {
  final fName;
  final lName;

  const DashBoard({Key key, this.fName, this.lName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        FrontScreen(),
        NavBarLayout(),
      ],
    ));
  }
}
