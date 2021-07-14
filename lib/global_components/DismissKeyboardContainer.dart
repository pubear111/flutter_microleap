import 'package:flutter/material.dart';

class DismissKeyboardContainer extends StatelessWidget {

  final Widget child;
  DismissKeyboardContainer({this.child});

  @override
  Widget build(BuildContext context) {
    Widget current = child;
    return GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: current,
    );
  }
}