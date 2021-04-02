import 'package:flutter/material.dart';
import 'package:social_app/routes/routes.dart';
import 'package:social_app/widgets/social_list.dart';

import 'package:social_app/widgets/widgets.dart';
import 'package:social_app/constant.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/welcome.png'),
                Text(
                  'Welcome',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Text(kAppDescription,
                    textAlign: TextAlign.center, style: kDarkLightStyle),
                Row(
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
                ),
                Text(
                  'or via Social Media',
                  textAlign: TextAlign.center,
                  style: kDarkStyle,
                ),
                SocialListWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      textAlign: TextAlign.center,
                      style: kDarkLightStyle,
                    ),
                    Text(
                      'Signup',
                      textAlign: TextAlign.center,
                      style: kDarkStyle,
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
