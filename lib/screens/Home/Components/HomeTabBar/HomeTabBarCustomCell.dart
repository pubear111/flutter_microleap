import 'package:flutter/material.dart';
import '../../../../const/colors.dart';

class HomeTabBarCustomCell extends StatefulWidget {
  Icon iconName;
  String tabTitle;

  HomeTabBarCustomCell(Icon iconName, String tabTitle) {
    this.iconName = iconName;
    this.tabTitle = tabTitle;
  }

  HomeTabBarCustomCellState createState() => new HomeTabBarCustomCellState();
}

class HomeTabBarCustomCellState extends State<HomeTabBarCustomCell> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: double.infinity,
      padding: EdgeInsets.only(top: 8.0),
      child: Tab(
        child: Column(
          children: [
            Center(
              child: widget.iconName,
            ),
            SizedBox(
              height: 4.0,
            ),
            Expanded(
              child:  Text(
                widget.tabTitle,
                style: TextStyle(
                  fontSize: 10.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}