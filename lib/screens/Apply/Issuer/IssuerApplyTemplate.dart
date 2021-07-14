import 'package:flutter/material.dart';
import '../../../global_components/StatusBarStyleContainer.dart';
import '../../../global_components/NavigationBar.dart';

class IssuerApplyTemplate extends StatelessWidget {
  final Widget child;

  IssuerApplyTemplate({
    @required this.child,
  });

  Widget build(BuildContext context) {
    return StatusBarStyleContainer(
      child: Scaffold(
          body: SafeArea(
            bottom: false,
            child: Column(
              children: [
                Container(
                  height: 40.0,
                  width: double.infinity,
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                ),
                const Navigationbar(
                  iconColor: Colors.black,
                  backgroundColor: Colors.transparent,
                ),
                Expanded(
                  child: child,
                )
              ],
            ),
          )
      ),
    );
  }
}