import 'dart:ui';

import 'package:flutter/material.dart';
import 'HomeTabBarCustomCell.dart';
import '../../../../const/colors.dart';

class HomeTabBar extends StatefulWidget {
   TabController _tabController;

   // HomeTabBar({this.onTabChange});
   HomeTabBar(TabController tabController) {
     this._tabController = tabController;
   }

   HomeTabBarState createState() => new HomeTabBarState();
}

class HomeTabBarState extends State<HomeTabBar> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 70.0,
      padding: EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow:[
          BoxShadow(
            color: Colors.grey.withOpacity(0.9),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          )
        ]
      ),
      child: TabBar(
        controller: widget._tabController,
        indicator: BoxDecoration(),
        labelColor: CustomColors.tabBarSelectedColor,
        unselectedLabelColor: Colors.black,
        indicatorColor: Colors.transparent,
        tabs: [
          HomeTabBarCustomCell(Icon(Icons.ac_unit), "Funding List"),
          HomeTabBarCustomCell(Icon(Icons.ac_unit), "Portfolio"),
          HomeTabBarCustomCell(Icon(Icons.ac_unit), "League"),
          HomeTabBarCustomCell(Icon(Icons.ac_unit), "Invite & Earn"),
        ],
      ),
    );
  }
}