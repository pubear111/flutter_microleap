import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StatusBarStyleContainer extends StatelessWidget {

  final Widget child;

  StatusBarStyleContainer({
    this.child
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: this.child,
    );
  }
}