import 'package:flutter/material.dart';
import '../../../../../const/colors.dart';

class PortfolioDashboardRowButtons extends StatelessWidget {

  TextStyle textStyle = TextStyle(
      color: CustomColors.selectorBlue,
      fontSize: 15.0,
      fontWeight: FontWeight.w700
  );

  Function(int) onButtonTapped;

  // Constructor
  PortfolioDashboardRowButtons({
    Key key,
    this.onButtonTapped
  }) : super (key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90.0,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.buttonLightBlue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.only(left: 24.0, top: 18.0, bottom: 18.0, right: 8.0),
                height: double.infinity,
                child: buttonInkWell("Add Funds", 0)
            ),
          ),
          Expanded(
            child: Container(
                decoration: BoxDecoration(
                  color: CustomColors.buttonLightBlue,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                margin: EdgeInsets.only(left: 8.0, top: 18.0, bottom: 18.0, right: 24.0),
                height: double.infinity,
                child: buttonInkWell("Auto Invest", 1)
            ),
          )
        ],
      ),
    );
  }

  Widget buttonInkWell(String buttonTitle, int buttonID) {
    return InkWell(
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20.0),
            child: Icon(Icons.ac_unit_rounded),
          ),
          Expanded(
              child: Container(
                child: Text(
                  buttonTitle,
                  textAlign: TextAlign.center,
                  style: textStyle,
                ),
              )
          )
        ],
      ),
      onTap: () => onButtonTapped(buttonID),
    );
  }
}
