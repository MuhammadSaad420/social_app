import 'package:flutter/material.dart';

import '../constant.dart';

class ReusedMaterialButton extends StatelessWidget {
  final title;
  final function;
  const ReusedMaterialButton({@required this.title, @required this.function});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Container(
          height: 30,
          width: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: kPurpleColor,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
      onPressed: function,
    );
  }
}
