import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mircoleap/Screens/Login/Login.dart';

class Splash extends StatefulWidget {
  SplashState createState() => new SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => Login())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Text(
        "Microleap",
        style: TextStyle(fontSize: 24),
      ),
    ));
  }
}
