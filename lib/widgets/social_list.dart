import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/constant.dart';

class SocialListWidget extends StatelessWidget {
  const SocialListWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        CircleAvatar(
          radius: 30,
          child: Icon(
            FontAwesomeIcons.facebook,
            color: Colors.white,
          ),
          backgroundColor: kPurpleColor,
        ),
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.red,
          child: Icon(FontAwesomeIcons.google, color: Colors.white),
        ),
        CircleAvatar(
          radius: 30,
          child: Icon(FontAwesomeIcons.linkedin, color: Colors.white),
          backgroundColor: kPurpleColor,
        ),
        CircleAvatar(
          radius: 30,
          child: Icon(FontAwesomeIcons.instagram, color: Colors.white),
          backgroundColor: kPurpleColor,
        ),
        CircleAvatar(
          radius: 30,
          child: Icon(
            FontAwesomeIcons.twitter,
            color: Colors.white,
          ),
          backgroundColor: kPurpleColor,
        ),
      ],
    );
  }
}
