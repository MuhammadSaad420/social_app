import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/constant.dart';

class ContactScreen extends StatelessWidget {
  var appBar = AppBar();
  bool isportrait(context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }

  @override
  Widget build(BuildContext context) {
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    var _appBarSize = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: isportrait(context)
                ? _pageSize - (_appBarSize + _notifySize)
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('images/contact.png'),
                ReusableInfoWidget(
                  title: 'Head Office',
                  icon: FontAwesomeIcons.building,
                  data: '0000-0000000',
                ),
                ReusableInfoWidget(
                  title: 'Fax',
                  icon: FontAwesomeIcons.fax,
                  data: '0000-0000000',
                ),
                ReusableInfoWidget(
                  title: 'General Managment',
                  icon: FontAwesomeIcons.locationArrow,
                  data: 'Johar town, Lahore',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReusableInfoWidget extends StatelessWidget {
  final title;
  final icon;
  final data;

  const ReusableInfoWidget({Key key, this.title, this.icon, this.data})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(color: kPurpleColor),
          ),
          SizedBox(
            height: 7,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            height: 60,
            width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    icon,
                    color: kPurpleColor,
                  ),
                ),
                Text(data)
              ],
            ),
          )
        ],
      ),
    );
  }
}
