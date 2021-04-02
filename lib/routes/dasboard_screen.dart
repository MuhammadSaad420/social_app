import 'package:flutter/material.dart';

class DashBoard extends StatelessWidget {
  final fName;
  final lName;

  const DashBoard({Key key, this.fName, this.lName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Text(fName + ' ' + lName),
        ),
      ),
    );
  }
}
