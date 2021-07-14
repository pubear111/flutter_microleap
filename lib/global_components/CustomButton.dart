import 'package:flutter/material.dart';
import '../const/colors.dart';

class CustomButton extends StatelessWidget {
  double buttonHeight;
  BoxDecoration boxDecoration;
  EdgeInsets edgeInsets;
  String buttonText;
  TextStyle textStyle;
  Function(int) handleOnTapped;
  int buttonID;

  CustomButton({
    Key key,
    this.buttonID,
    this.buttonHeight,
    this.boxDecoration,
    this.edgeInsets,
    this.buttonText,
    this.textStyle,
    this.handleOnTapped
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: buttonHeight ?? 30.0,
        decoration: boxDecoration ?? BoxDecoration(
          borderRadius: BorderRadius.circular(6.0),
          color: CustomColors.buttonLightBlue,
        ),
        margin: edgeInsets ?? null,
        child: InkWell(
            child: Center(
              child: Text(
                buttonText ?? "Label",
                style: textStyle ?? TextStyle(
                    color: CustomColors.selectorBlue,
                    fontWeight: FontWeight.w700,
                    fontSize: 16.0
                ),
                textAlign: TextAlign.center,
              ),
            ),
          onTap: () {
            handleOnTapped(this.buttonID);
          },
        )
    );
  }
}
