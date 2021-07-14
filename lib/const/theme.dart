import 'package:flutter/material.dart';

ThemeData AppTheme(BuildContext context) {
  return ThemeData(
    textTheme: TextTheme(
      headline1: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: Colors.white,
      )
    )
  );
}