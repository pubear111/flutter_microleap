import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mircoleap/services/rest_api.dart';

import 'Components/LeagueDashboardFooter.dart';
import 'Components/LeagueDashboardHeader.dart';

class LeagueDashboard extends StatefulWidget {
  LeagueDashboardState createState() => new LeagueDashboardState();
}

class LeagueDashboardState extends State<LeagueDashboard>
    with AutomaticKeepAliveClientMixin {
  String type = 'monthly';
  bool showHidden = true;
  String currentQuery = '';
  String prevQuery = '';
  List<dynamic> currentLeaguePoints = [];
  List<dynamic> prevLeaguePoints = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getLeaguePoints();
  }

  _getLeaguePoints() {
    var now = new DateTime.now();
    final dateFormat = new DateFormat('yyyy-MM-dd');
    var currentMonth = dateFormat.format(new DateTime(now.year, now.month, 1));
    var prevMonth = dateFormat.format(new DateTime(now.year, now.month - 1, 1));
    debugPrint('now =====>' + now.toString());
    currentQuery = 'type=' +
        type +
        '&month=' +
        currentMonth +
        '&showHidden=' +
        showHidden.toString();
    prevQuery = 'type=' +
        type +
        '&month=' +
        prevMonth +
        '&showHidden=' +
        showHidden.toString();
    ApiService.leaguePoints(currentQuery).then((value) => {
          setState(() => currentLeaguePoints = value),
          debugPrint(currentQuery + ' =====> $value')
        });
    ApiService.leaguePoints(prevQuery).then((value) => {
          setState(() => prevLeaguePoints = value),
          debugPrint(prevQuery + ' =====> $value')
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Wrap(
      children: [
        Container(
          child: Text(
            "League",
            style: Theme.of(context).textTheme.headline1,
          ),
          padding: EdgeInsets.only(left: 18.0),
        ),
        LeagueDashboardHeader(),
        LeagueDashboardFooter(currentLeaguePoints, prevLeaguePoints)
      ],
    ));
  }
}
