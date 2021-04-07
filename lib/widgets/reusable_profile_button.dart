import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final title;
  final backgroundColor;
  final textColor;
  final border;

  const ReusableButton(
      {this.title, this.backgroundColor, this.textColor, this.border});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.3,
      height: MediaQuery.of(context).size.width / 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: backgroundColor,
        border: border,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 18, color: textColor),
        ),
      ),
    );
  }
}
