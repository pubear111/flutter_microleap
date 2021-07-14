import 'package:flutter/material.dart';

class Navigationbar extends StatelessWidget {

  final Color iconColor;
  final Color backgroundColor;

  const Navigationbar({
    this.iconColor,
    this.backgroundColor
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: iconColor
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      elevation: 0.0,
      backgroundColor: backgroundColor,
    );
  }
}