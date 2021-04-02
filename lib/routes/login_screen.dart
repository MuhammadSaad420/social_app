import 'dart:convert';
import 'dart:io';
import 'package:social_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:social_app/widgets/social_list.dart';
import 'package:social_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _key = GlobalKey<FormState>();
  String password;
  String email;
  var appBar = AppBar(
    title: Text("App"),
  );

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
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Container(
            height: isportrait(context)
                ? _pageSize - (_appBarSize + _notifySize)
                : null,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset('images/login.png'),
                Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.mail),
                          hintText: "Email",
                        ),
                        validator: _validateEmail,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          icon: Icon(Icons.vpn_key),
                          hintText: "Password",
                        ),
                        obscureText: true,
                        validator: _validatePassword,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgotScreen(),
                                ),
                              );
                            },
                            child: Text(
                              'Forgot Password',
                            ),
                          ),
                        ],
                      ),
                      ReusableButton(
                        function: () async {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_key.currentState.validate()) {
                            setState(() {});
                            checkUser();
                          }
                        },
                        textColor: Colors.white,
                        title: 'Login',
                        backgroundColor: kPurpleColor,
                        border: Colors.transparent,
                      ),
                    ],
                  ),
                ),
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
                  height: isportrait(context) ? 0 : 10,
                ),
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

  String _validateEmail(String value) {
    RegExp emailpattern = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$",
        caseSensitive: false,
        multiLine: false);
    if (value.isEmpty) {
      return "Field cannot be empty";
    } else if (!emailpattern.hasMatch(value)) {
      return "Enter a valid email";
    } else {
      email = value;
      return null;
    }
  }

  String _validatePassword(String value) {
    if (value.length < 8) {
      return "At least 8 chars!";
    } else {
      password = value;
      return null;
    }
  }

  void checkUser() async {
    final response = await http.post(
      Uri.parse(
          'http://3.131.4.14/api/v1/sessions?email=$email&password=$password'),
    );
    if (response.statusCode == 201) {
      print('working fine');

      //return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
