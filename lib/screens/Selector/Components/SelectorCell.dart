import 'package:flutter/material.dart';

import '../../../const/colors.dart';

class SelectorCell extends StatefulWidget {
  String imageString;
  String cellTitle;
  String cellDescription;

  SelectorCell(String imageString, String cellTitle, String cellDescription) {
    this.imageString = imageString;
    this.cellTitle = cellTitle;
    this.cellDescription = cellDescription;
  }
  @override
  SelectorCellState createState() => new SelectorCellState();
}

class SelectorCellState extends State<SelectorCell> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        // color: Colors.blue[700],
        child: Center(
      child: Column(
        children: [
          SizedBox(
            height: 0.0,
          ),
          Image.asset(
            "assets/statistic.png",
            width: size.width * 0.40,
          ),
          SizedBox(
            height: 12.0,
          ),
          Align(
              alignment: Alignment.center,
              child: Text(
                "${widget.cellTitle}",
                style: TextStyle(
                  fontSize: size.height / 30,
                  fontWeight: FontWeight.w400,
                  color: CustomColors.selectorBlue,
                ),
                textAlign: TextAlign.center,
              )),
          SizedBox(
            height: 12.0,
          ),
          Container(
            padding: EdgeInsets.only(left: 26.0, right: 26.0),
            child: Text(
              "${widget.cellDescription}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15.0,
                  color: CustomColors.selectorBlue,
                  height: 1.5),
            ),
          ),
        ],
      ),
    ));
  }
}
