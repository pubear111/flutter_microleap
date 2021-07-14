import 'package:flutter/material.dart';
import '../../../../../const/colors.dart';

class InviteEarnDashboardFooterShareCell extends StatelessWidget {

  final int buttonType;
  final Function(int) onShareButtonTapped;

  TextStyle textStyle = TextStyle(
      fontSize: 14.0,
      color: CustomColors.primaryBackgroundBlack,
      fontWeight: FontWeight.w700
  );

  InviteEarnDashboardFooterShareCell({
    Key key,
    this.buttonType,
    this.onShareButtonTapped,
  }) : super(key: key);

  void onButtonTapped() {
    if(buttonType == 1) {
      onShareButtonTapped(1);
    } else if (buttonType == 2) {
      onShareButtonTapped(2);
    } else {
      onShareButtonTapped(3);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.white
        ),
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
                    color: CustomColors.textFieldContainer,
                    borderRadius: BorderRadius.circular(8.0)
                ),
                child: Icon(
                    Icons.add
                ),
              ),
              Expanded(
                  child: Center(
                      child: Container(
                        child: textButton(),
                      )
                  )
              )
            ],
          ),
          onTap: () {
            onButtonTapped();
          },
        )
    );
  }

  Widget textButton() {
    if(buttonType == 1) {
      return Text(
        "Share on Facebook",
        textAlign: TextAlign.center,
        style: textStyle,
      );
    } else if (buttonType == 2) {
      return Text(
        "Share on Twitter",
        textAlign: TextAlign.center,
        style: textStyle,
      );
    } else {
      return Text(
        "Share on Instagram",
        textAlign: TextAlign.center,
        style: textStyle,
      );
    }
  }
}
