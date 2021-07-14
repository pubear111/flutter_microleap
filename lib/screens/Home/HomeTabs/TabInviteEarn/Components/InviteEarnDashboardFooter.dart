import 'package:flutter/material.dart';

import 'InviteEarnDashboardFooterShareCell.dart';

class InviteEarnDashboardFooter extends StatefulWidget {
  InviteEarnDashboardFooterState createState() =>
      InviteEarnDashboardFooterState();
}

class InviteEarnDashboardFooterState extends State<InviteEarnDashboardFooter> {
  // Button index:
  // 1 - Facebook
  // 2 - Twitter
  // 3 - Instagram
  void shareButtonTapped(int buttonIndex) {
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Share",
              style: TextStyle(color: Colors.white),
            ),
          ),
          InviteEarnDashboardFooterShareCell(
              buttonType: 1, onShareButtonTapped: this.shareButtonTapped),
          InviteEarnDashboardFooterShareCell(
              buttonType: 2, onShareButtonTapped: this.shareButtonTapped),
          InviteEarnDashboardFooterShareCell(
              buttonType: 3, onShareButtonTapped: this.shareButtonTapped),
          SizedBox(height: 32.0)
        ],
      ),
    );
  }
}
