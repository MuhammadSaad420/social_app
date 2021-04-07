import 'package:flutter/material.dart';
import 'package:social_app/Layout/nav_bar_layout.dart';
import 'package:social_app/routes/routes.dart';

class DashBoard extends StatelessWidget {
  final fName;
  final lName;
  final email;

  const DashBoard({Key key, this.fName, this.lName, this.email})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            FrontScreen(
              fName: fName,
              lName: lName,
            ),
            NavBarLayout(
              fName: fName,
              lName: lName,
              email: email,
            ),
          ],
        ),
      ),
    );
  }
}
