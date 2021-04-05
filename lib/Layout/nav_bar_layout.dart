import 'package:flutter/material.dart';
import 'package:social_app/Model/custom_clipper.dart';
import 'package:social_app/constant.dart';
import 'package:social_app/widgets/widgets.dart';

class NavBarLayout extends StatefulWidget {
  @override
  _NavBarLayoutState createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  bool isOpened = true;
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Positioned(
      top: 0,
      bottom: 0,
      left: 0,
      right: isOpened ? 0 : screenWidth - 45,
      child: Row(
        children: [
          Expanded(
            child: isOpened
                ? Container(
                    color: kPurpleColor,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        ListTile(
                          title: Text(
                            "Saad",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            "saad.oraxtech@gmail.com",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          leading: CircleAvatar(
                            child: Icon(
                              Icons.perm_identity,
                              color: Colors.white,
                            ),
                            radius: 40,
                          ),
                        ),
                        buildDivider(),
                        MenuItem(
                          icon: Icons.contact_mail,
                          title: "Contact Us",
                          onTap: () {},
                        ),
                        buildDivider(),
                        MenuItem(
                          icon: Icons.exit_to_app,
                          title: "Logout",
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: kPurpleColor,
                  ),
          ),
          Align(
            alignment: Alignment(0, -0.9),
            child: InkWell(
              onTap: () {
                print('working');
                setState(() {
                  isOpened = !isOpened;
                });
              },
              child: ClipPath(
                clipper: CustomMenuClipper(),
                child: Container(
                  height: 110,
                  width: 40,
                  color: kPurpleColor,
                  child: Icon(
                    isOpened ? Icons.close : Icons.menu,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      height: 64,
      thickness: 0.5,
      color: Colors.white.withOpacity(0.3),
      indent: 32,
      endIndent: 32,
    );
  }
}
