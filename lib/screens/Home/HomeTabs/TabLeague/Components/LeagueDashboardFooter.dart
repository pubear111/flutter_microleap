import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../const/colors.dart';
import 'LeagueDashboardFooterTabBarView.dart';

class LeagueDashboardFooter extends StatefulWidget {
  List<dynamic> currentLeaguePoints;
  List<dynamic> prevLeaguePoints;

  LeagueDashboardFooter(List current, List prev) {
    this.currentLeaguePoints = current;
    this.prevLeaguePoints = prev;
    debugPrint('$prev');
  }

  LeagueDashboardFooterState createState() => new LeagueDashboardFooterState();
}

class LeagueDashboardFooterState extends State<LeagueDashboardFooter> {
  TabController _tabController;

  List<String> months = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  String current = '';
  String prev = '';
  String year = '';

  @override
  void initState() {
    super.initState();
    _getTabBarInfo();
  }

  _getTabBarInfo() {
    var now = new DateTime.now();
    current = months[now.month - 1];
    if (now.month > 2) {
      prev = months[now.month - 2];
    } else {
      prev = 'December';
    }
    year = now.year.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextStyle tabBarTextStyle = TextStyle(
      color: CustomColors.primaryBackgroundGreen,
    );

    return Container(
        child: DefaultTabController(
      length: 4,
      child: Wrap(
        children: [
          Container(
            height: 30.0,
            color: CustomColors.primaryBackgroundBlack,
            child: TabBar(
              controller: _tabController,
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: TextStyle(
                color: CustomColors.primaryBackgroundGreen,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: TextStyle(
                color: CustomColors.primaryBackgroundGreen,
                fontWeight: FontWeight.w200,
              ),
              indicatorColor: CustomColors.primaryBackgroundGreen,
              tabs: [
                Text(
                  current,
                  style: tabBarTextStyle,
                ),
                Text(
                  prev,
                  style: tabBarTextStyle,
                ),
                Text(
                  year,
                  style: tabBarTextStyle,
                ),
                Text(
                  "All Time",
                  style: tabBarTextStyle,
                ),
              ],
            ),
          ),
          Container(
            height: 480,
            child: TabBarView(
              controller: _tabController,
              children: [
                LeagueDashboardFooterTabBarView(widget.currentLeaguePoints),
                LeagueDashboardFooterTabBarView(widget.prevLeaguePoints),
                LeagueDashboardFooterTabBarView([]),
                LeagueDashboardFooterTabBarView([])
              ],
            ),
          )
        ],
      ),
    ));
  }
}
