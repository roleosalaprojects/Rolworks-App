import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rolworks_pos/network/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rolworks_pos/app_utils/const.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    _checkIfLoggedIn();
    super.initState();
  }

  void _checkIfLoggedIn() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var token = localStorage.getString('token');
    if (token != null) {
      Navigator.pushNamed(context, "pos");
    }
  }

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBarDef("Login"),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Email",
                ),
                controller: emailController,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Password",
                  hintText: "Password",
                ),
                obscureText: true,
                enableSuggestions: false,
                autocorrect: false,
                controller: passwordController,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(20.0),
                child: OutlineButton(
                  borderSide: BorderSide.none,
                  child: Text("Not yet a member?"),
                  onPressed: () {
                    Navigator.pushNamed(context, "register");
                  },
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () async {
                  var data = [
                    {
                      'email': emailController.text,
                      'password': passwordController.text,
                    }
                  ];
                  var res = await Network().authData(data, '/login');
                  var body = json.decode(res.body);
                  print(body);
                  if (body['success']) {
                    SharedPreferences localStorage =
                        await SharedPreferences.getInstance();
                    localStorage.setString('token', jsonEncode(body['token']));
                    localStorage.setString('user', jsonEncode(body['user']));
                    // Push to new Route
                    Navigator.pushNamed(context, "pos");
                  } else {
                    print(body);
                  }
                },
                child: Text("Login"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
