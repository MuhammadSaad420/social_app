import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_app/widgets/reusable_button.dart';
import 'package:http/http.dart' as http;
import '../constant.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _key = GlobalKey<FormState>();
  String prefixUrl = r'http://3.131.4.14/api/v1/users/?user[email]=';
  String firstName;
  String lastName;
  String phoneNumber;
  String email;
  String password;
  String confirmPassword;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 20, 8, 0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Text(
                            'Sign Up',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          Text(
                            'Fill the details and create your account',
                            style: TextStyle(color: Colors.black45),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Form(
                        key: _key,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "First Name",
                              ),
                              validator: _validateFName,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Last Name",
                              ),
                              validator: _validateLName,
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(FontAwesomeIcons.mobile),
                                hintText: "Phone Number",
                              ),
                              validator: _validateNumber,
                            ),
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
                            TextFormField(
                              decoration: const InputDecoration(
                                icon: Icon(Icons.vpn_key),
                                hintText: "Confirm Password",
                              ),
                              obscureText: true,
                              validator: _confirmPassword,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            ReusableButton(
                              function: () {
                                //postUser();
                                if (_key.currentState.validate()) {
                                  setState(() {});
                                  print(email);
                                  print(password);
                                  postUser();
                                }
                              },
                              textColor: Colors.white,
                              title: 'Sign Up',
                              backgroundColor: kPurpleColor,
                              border: Colors.transparent,
                            ),
                          ],
                        ),
                      ),
                    )
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

  String _validatePassword(String value) {
    if (value.length < 8) {
      return "At least 8 chars!";
    } else {
      password = value;
      return null;
    }
  }

  String _validateFName(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    } else {
      firstName = value;
      return null;
    }
  }

  String _validateLName(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    } else {
      lastName = value;
      return null;
    }
  }

  String _validateNumber(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    } else {
      phoneNumber = value;
      return null;
    }
  }

  String _confirmPassword(String value) {
    if (value.isEmpty) {
      return "Field cannot be empty";
    } else if (value != password) {
      return "Passwords are not matching";
    } else {
      confirmPassword = value;
      return null;
    }
  }

  //http://3.131.4.14/api/v1/users/?user[email]=saadmalik42011@gmail.com&user[first_name]=saad&user[last_name]
  //=malik&user[phone]=945888944343&PushToken=pushasdfasd4cwerqwecda4qrcadqd3der3rqwer33qe&
  //user[password]=123456712&user[password_confirmation]=123456712
  void postUser() async {
    String url = prefixUrl + '''$email''';
    url = url + '''&user[first_name]=''' + firstName;
    url = url + '''&user[last_name]=''' + lastName;
    url = url + '''&user[phone]=''' + phoneNumber;
    url = url +
        '''&PushToken=pushasdfasd4cwerqwecda4qrcadqd3der3rqwer33qe&user[password]=''' +
        password;
    url = url + '''&user[password_confirmation]=''' + confirmPassword;
    print(url);

    final response = await http.post(
      Uri.parse(url),
    );
    if (response.statusCode == 201) {
      print('working fine');

      //return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load data');
    }
  }
}
