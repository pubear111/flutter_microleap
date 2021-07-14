import 'package:flutter/material.dart';

class SelectorFooter extends StatelessWidget {
  final Function() onNextTapped;
  Color backgroundColor;
  Color textColor = Colors.white;

  SelectorFooter(
      {Key key, this.onNextTapped, this.backgroundColor, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.only(right: 25.0, bottom: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Spacer(),
          InkWell(
            child: Row(
              children: [
                Container(
                    child: Text(
                      "Next",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: textColor),
                    ),
                    margin: EdgeInsets.only(
                      right: 8.0,
                    )),
                Icon(
                  Icons.arrow_forward,
                  color: textColor,
                ),
              ],
            ),
            onTap: () => onNextTapped(),
          )
        ],
      ),
      color: backgroundColor,
      constraints: BoxConstraints.tightForFinite(
          width: size.width, height: size.height / 10),
    );
  }
}
