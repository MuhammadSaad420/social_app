import 'package:flutter/material.dart';

class ReusableDetailWidget extends StatelessWidget {
  final upperTitle;
  final lowerTitle;
  const ReusableDetailWidget({this.upperTitle, this.lowerTitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          upperTitle,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 7,
        ),
        Text(
          lowerTitle,
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black38),
        )
      ],
    );
  }
}
