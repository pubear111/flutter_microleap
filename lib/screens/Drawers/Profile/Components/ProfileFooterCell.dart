import 'package:flutter/material.dart';

import '../../../../const/colors.dart';

class ProfileFooterCell extends StatelessWidget {
  final int buttonType;
  final Function(int) onButtonTapped;

  TextStyle textStyle = TextStyle(
      fontSize: 14.0,
      color: CustomColors.primaryBackgroundBlack,
      fontWeight: FontWeight.w800);

  TextStyle subtitleTextStyle = TextStyle(
    fontSize: 12.0,
    color: Colors.grey,
  );

  ProfileFooterCell({
    Key key,
    this.buttonType,
    this.onButtonTapped,
  }) : super(key: key);

  void onCellButtonTapped() {
    if (buttonType == 1) {
      onButtonTapped(1);
    } else if (buttonType == 2) {
      onButtonTapped(2);
    } else {
      onButtonTapped(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), color: Colors.white),
        height: 60.0,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        margin: EdgeInsets.only(top: 12.0),
        child: InkWell(
          child: Row(
            children: [
              Container(
                width: 40.0,
                height: 40.0,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(8.0)),
                child: Icon(Icons.add),
              ),
              Expanded(
                  child: Container(
                      margin: EdgeInsets.only(left: 14.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [mainTitle(), subtitle()],
                      ))),
              Container(
                width: 30.0,
                child: Icon(
                  Icons.arrow_forward_ios,
                  size: 18.0,
                  color: Colors.grey,
                ),
              )
            ],
          ),
          onTap: () {
            onCellButtonTapped();
          },
        ));
  }

  Widget mainTitle() {
    if (buttonType == 1) {
      return Text(
        "Profile Settings",
        style: textStyle,
      );
    } else if (buttonType == 2) {
      return Text(
        "Privacy",
        style: textStyle,
      );
    } else {
      return Text(
        "Notifications",
        style: textStyle,
      );
    }
  }

  Widget subtitle() {
    if (buttonType == 1) {
      return Text(
        "Update and modify your profile",
        style: subtitleTextStyle,
      );
    } else if (buttonType == 2) {
      return Text(
        "Change your password",
        style: subtitleTextStyle,
      );
    } else {
      return Text(
        "Change your notification settings",
        style: subtitleTextStyle,
      );
    }
  }
}
