import 'package:flutter/material.dart';

import 'ProfileFooterCell.dart';

class ProfileFooter extends StatelessWidget {
  // Button index:
  // 1 - Facebook
  // 2 - Twitter
  // 3 - Instagram
  void onButtonTapped(int buttonIndex) {}

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "GENERAL",
              style: TextStyle(color: Colors.white),
            ),
          ),
          ProfileFooterCell(buttonType: 1, onButtonTapped: this.onButtonTapped),
          ProfileFooterCell(buttonType: 2, onButtonTapped: this.onButtonTapped),
          ProfileFooterCell(buttonType: 3, onButtonTapped: this.onButtonTapped),
          SizedBox(height: 32.0)
        ],
      ),
    );
  }
}
