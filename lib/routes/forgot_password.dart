import 'package:flutter/material.dart';
import 'package:social_app/routes/login_screen.dart';
import 'package:social_app/widgets/widgets.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class ForgotScreen extends StatefulWidget {
  @override
  _ForgotScreenState createState() => _ForgotScreenState();
}

class _ForgotScreenState extends State<ForgotScreen> {
  final _key = GlobalKey<FormState>();

  String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: appBar,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
              child: Container(
                // height: isportrait(context)
                //     ? _pageSize - (_appBarSize + _notifySize)
                //     : null,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Image.asset('images/forgot.png'),
                          Text(
                            'Forgot Password',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Text(
                            'Enter the email address associated with the account',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: isportrait(context) ? 0 : 10,
                    // ),
                    Container(
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.mail),
                                hintText: "Email",
                              ),
                              validator: _validateEmail,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    ReusableButton(
                      function: () async {
                        if (_key.currentState.validate()) {
                          setState(() {});
                          bool success = await forgotPassword();
                          if (success) {
                            showDialog(
                              context: context,
                              builder: (_) => AlertDialog(
                                title: Text('Password Reset'),
                                content: Text(
                                    'Check your email address to reset password'),
                                actions: [
                                  MaterialButton(
                                    child: Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        height: 30,
                                        width: 60,
                                        color: kPurpleColor,
                                        child: Center(
                                          child: Text(
                                            "ok",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                        ),
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginScreen()));
                                    },
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      },
                      textColor: Colors.white,
                      title: 'Proceed',
                      backgroundColor: kPurpleColor,
                      border: Colors.transparent,
                    ),
                  ],
                ),
              ),
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

  Future<bool> forgotPassword() async {
    print(email);
    final response = await http.put(
      Uri.parse('http://3.131.4.14/api/v1/users/forgot_password?email=$email'),
    );
    if (response.statusCode == 201) {
      print('working fine');
      return true;
    } else {
      throw Exception('Failed to load data');
    }
  }
}
