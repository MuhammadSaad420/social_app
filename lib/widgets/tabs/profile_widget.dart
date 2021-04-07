import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/constant.dart';
import 'package:social_app/widgets/grid_view_widget.dart';
import 'package:social_app/widgets/reusable_detail_widget.dart';
import 'package:social_app/widgets/reusable_profile_button.dart';

class ProfileWidget extends StatelessWidget {
  final fName;
  final lName;

  const ProfileWidget({Key key, this.fName, this.lName}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 0),
        child: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                // backgroundImage: NetworkImage(imageURL),
                radius: 35,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                fName + ' ' + lName,
                style: kUserNameStyle,
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                child: Text(
                  'bio',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 1,
              ),
              buildInfoWidget(),
              Divider(
                thickness: 1,
              ),
              buildButtons(),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Photos',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Row(
                        children: [
                          Icon(
                            FontAwesomeIcons.listUl,
                            size: 25,
                            color: Colors.black26,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(
                            Icons.grid_view,
                            size: 30,
                            color: Colors.black26,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                height: 300,
                child: GridViewWidget(),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding buildInfoWidget() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      child: Container(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ReusableDetailWidget(
              upperTitle: '438',
              lowerTitle: 'Posts',
            ),
            ReusableDetailWidget(
              upperTitle: '298',
              lowerTitle: 'Following',
            ),
            ReusableDetailWidget(
              upperTitle: '321K',
              lowerTitle: 'Followers',
            ),
          ],
        ),
      ),
    );
  }

  Container buildButtons() {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ReusableButton(
            title: 'Follow',
            textColor: Colors.white54,
            backgroundColor: kPurpleColor,
            border: null,
          ),
          ReusableButton(
            title: 'Message',
            textColor: Colors.black87,
            backgroundColor: null,
            border: Border.all(color: kPurpleColor),
          ),
        ],
      ),
    );
  }
}
