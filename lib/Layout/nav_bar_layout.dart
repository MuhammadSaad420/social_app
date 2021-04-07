import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_app/Model/custom_clipper.dart';
import 'package:social_app/constant.dart';
import 'package:social_app/routes/contact_screen.dart';
import 'package:social_app/routes/routes.dart';
import 'package:social_app/widgets/widgets.dart';

class NavBarLayout extends StatefulWidget {
  final fName;
  final lName;
  final email;

  const NavBarLayout({Key key, this.fName, this.lName, this.email})
      : super(key: key);
  @override
  _NavBarLayoutState createState() => _NavBarLayoutState();
}

class _NavBarLayoutState extends State<NavBarLayout> {
  bool isOpened = false;
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
                          height: 20,
                        ),
                        ListTile(
                          title: Text(
                            widget.fName == null
                                ? " "
                                : widget.fName + ' ' + widget.lName == null
                                    ? " "
                                    : widget.lName,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w800),
                          ),
                          subtitle: Text(
                            widget.email == null ? " " : widget.email,
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
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => ContactScreen()),
                            );
                          },
                        ),
                        buildDivider(),
                        MenuItem(
                          icon: Icons.exit_to_app,
                          title: "Logout",
                          onTap: () {
                            buildShowDialog(context);
                          },
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

  Future buildShowDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('Warning!'),
        content: Text('Are you sure you want to logout?'),
        actions: [
          ReusedMaterialButton(
              title: 'No',
              function: () {
                Navigator.pop(context);
              }),
          ReusedMaterialButton(
              title: 'Yes',
              function: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('email');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              })
        ],
      ),
    );
  }

  Divider buildDivider() {
    return Divider(
      height: 20,
      thickness: 0.5,
      color: Colors.white.withOpacity(0.3),
      indent: 20,
      endIndent: 20,
    );
  }
}
