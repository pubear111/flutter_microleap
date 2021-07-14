import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mircoleap/Screens/Selector/Selector.dart';
import 'package:mircoleap/screens/Home/Home.dart';
import 'package:mircoleap/services/rest_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../const/variables.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String email = '';
  String password = '';
  String warning = '';

  TextEditingController emailController =
      new TextEditingController(text: 'abc01@microleap.com'); //abc01@microleap.com
  TextEditingController passwordController =
      new TextEditingController(text: 'gE7rO7tI1#'); //gE7rO7tI1#

  void showInSnackBar(String value) {
    _scaffoldKey.currentState
        .showSnackBar(new SnackBar(content: new Text(value)));
  }

  _login() {
    email = emailController.text;
    password = passwordController.text;
    // debugPrint(email + ' =====> ' + password);

    if (_validate()) {
      ApiService.login(email, password).then((value) => {
            if (value == null)
              {showInSnackBar('Email or Password is incorrect')}
            else
              {
                _saveUser(value),
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => Home()))
              }
          });
    } else {
      showInSnackBar(warning);
    }
  }

  _validate() {
    bool valid = true;

    if (email.isEmpty) {
      valid = false;
      warning = 'Email should not be empty';
    } else if (password.isEmpty) {
      valid = false;
      warning = 'Password should not be empty';
    }

    return valid;
  }

  _saveUser(response) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = response['user'];
    prefs.setString('user', json.encode(user));
    Global().uid = user['id'];
    Global().name = user['fullName'];
    Global().email = user['email'];
    Global().leagueRank = user['leagueRank'];
    Global().leaguePoints = user['leaguePoints'];
    Global().loginUser = user;
    // debugPrint('login =====>' + jsonEncode(user));
  }

  _register() {
    Navigator.push(context, MaterialPageRoute(builder: (_) => Selector()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(2, 34, 49, 1),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Center(
                child: Container(
                    width: 200,
                    height: 150,
                    child: Image.asset('assets/logo.png')),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              margin: const EdgeInsets.only(top: 120.0),
              child: TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter valid email',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              margin: const EdgeInsets.only(top: 20.0),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    fillColor: Colors.red,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.white),
                    hintText: 'Enter secure password',
                    hintStyle: TextStyle(color: Colors.white)),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              margin: const EdgeInsets.only(top: 60.0),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                color: Color.fromRGBO(22, 144, 205, 1),
                onPressed: () => _login(),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            Container(
              width: 250,
              height: 50,
              margin: const EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: FlatButton(
                color: Color.fromRGBO(22, 144, 205, 1),
                onPressed: () => _register(),
                child: Text(
                  'Register',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
