import 'package:flutter/material.dart';

class DisableSwipeToPop extends StatelessWidget {

  Widget child;

  DisableSwipeToPop({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(//forbidden swipe in iOS(my ThemeData(platform: TargetPlatform.iOS,)
      onWillPop: () async {
        if (Navigator.of(context).userGestureInProgress)
          return false;
        else
          return true;
      },
      child: child,
    );
  }
}