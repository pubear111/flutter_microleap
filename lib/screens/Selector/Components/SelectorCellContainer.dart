import 'package:flutter/material.dart';

import '../../../const/colors.dart';
import 'SelectorCell.dart';

class SelectorCellContainer extends StatefulWidget {
  String imageString;
  String cellTitle;
  String cellDescription;
  bool isSelected;

  SelectorCellContainer(String imageString, String cellTitle,
      String cellDescription, bool isSelected) {
    this.imageString = imageString;
    this.cellTitle = cellTitle;
    this.cellDescription = cellDescription;
    this.isSelected = isSelected;
  }

  @override
  SelectorCellContainerState createState() => new SelectorCellContainerState();
}

class SelectorCellContainerState extends State<SelectorCellContainer> {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 340,
      width: size.width,
      padding: EdgeInsets.only(top: 4.0, left: 24.0, right: 24.0, bottom: 4.0),
      child: Stack(
        children: [
          Visibility(
              visible: widget.isSelected,
              child: Container(
                decoration: BoxDecoration(
                    color: CustomColors.selectorBlue,
                    borderRadius: BorderRadius.all(Radius.circular(12.0))),
              )),
          Container(
            child: SelectorCell(
                widget.imageString, widget.cellTitle, widget.cellDescription),
            decoration: BoxDecoration(
                color: widget.isSelected ? Colors.white : Colors.lightBlue[100],
                borderRadius: BorderRadius.all(Radius.circular(12.0))),
            padding: EdgeInsets.all(28.0),
            margin: EdgeInsets.all(8.0),
          )
        ],
      ),
    );
  }
}
