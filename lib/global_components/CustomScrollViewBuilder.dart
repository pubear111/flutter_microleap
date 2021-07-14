import 'package:flutter/material.dart';

class CustomScrollViewBuilder extends StatelessWidget {
  final Widget child;

  CustomScrollViewBuilder({
    @required this.child
  });

  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: child,
      ),
    );
  }
}