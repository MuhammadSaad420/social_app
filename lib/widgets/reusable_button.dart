import 'package:flutter/material.dart';

class ReusableButton extends StatelessWidget {
  final title;
  final function;
  final backgroundColor;
  final textColor;
  final border;
  const ReusableButton(
      {@required this.title,
      @required this.backgroundColor,
      @required this.border,
      @required this.textColor,
      @required this.function});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: function,
      child: Container(
        width: MediaQuery.of(context).size.width / 2.5,
        height: 45,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20, color: textColor, fontWeight: FontWeight.bold),
          ),
        ),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: border),
        ),
      ),
    );
  }
}
