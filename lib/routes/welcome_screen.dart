import 'package:flutter/material.dart';
import 'package:social_app/routes/routes.dart';
import 'package:social_app/widgets/social_list.dart';
import 'package:social_app/widgets/widgets.dart';
import 'package:social_app/constant.dart';

class WelcomeScreen extends StatelessWidget {
  var appBar = AppBar();

  @override
  Widget build(BuildContext context) {
    var _pageSize = MediaQuery.of(context).size.height;
    var _notifySize = MediaQuery.of(context).padding.top;
    var _appBarSize = appBar.preferredSize.height;
    return Scaffold(
      appBar: appBar,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: SingleChildScrollView(
            child: Container(
              height: isportrait(context)
                  ? _pageSize - (_appBarSize + _notifySize)
                  : null,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset('images/welcome.png'),
                  Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SizedBox(
                    height: isportrait(context) ? 0 : 5,
                  ),
                  Text(kAppDescription,
                      textAlign: TextAlign.center, style: kDarkLightStyle),
                  SizedBox(
                    height: isportrait(context) ? 0 : 10,
                  ),
                  _buildRowOfButtons(context),
                  SizedBox(
                    height: isportrait(context) ? 0 : 10,
                  ),
                  Text(
                    'or via Social Media',
                    textAlign: TextAlign.center,
                    style: kDarkStyle,
                  ),
                  SizedBox(
                    height: isportrait(context) ? 0 : 10,
                  ),
                  SocialListWidget(),
                  SizedBox(
                    height: isportrait(context) ? 0 : 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account?',
                        textAlign: TextAlign.center,
                        style: kDarkLightStyle,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Signup',
                          textAlign: TextAlign.center,
                          style: kDarkStyle,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Row _buildRowOfButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        ReusableButton(
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            );
          },
          textColor: Colors.white,
          title: 'Login',
          backgroundColor: kPurpleColor,
          border: Colors.transparent,
        ),
        ReusableButton(
          function: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SignUpScreen(),
              ),
            );
          },
          textColor: Colors.black,
          title: 'Sign Up',
          backgroundColor: Colors.white,
          border: Colors.black,
        )
      ],
    );
  }

  bool isportrait(context) {
    return MediaQuery.of(context).orientation == Orientation.portrait;
  }
}
