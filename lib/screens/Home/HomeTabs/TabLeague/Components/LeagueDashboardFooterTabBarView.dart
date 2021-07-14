import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../../const/colors.dart';

class LeagueDashboardFooterTabBarView extends StatefulWidget {
  List<dynamic> leaguePoints;

  LeagueDashboardFooterTabBarView(List points) {
    this.leaguePoints = points;
  }

  LeagueDashboardFooterTabBarViewState createState() =>
      new LeagueDashboardFooterTabBarViewState();
}

class LeagueDashboardFooterTabBarViewState
    extends State<LeagueDashboardFooterTabBarView> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Wrap(
        // color: Colors.red,
        // height: 480,
        children: [
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: widget.leaguePoints.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.only(left: 18.0, right: 8.0, top: 8.0),
                  height: 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            child: Text(
                              widget.leaguePoints[index]['leagueName'],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 12.0),
                            ),
                          ),
                          Container(
                            child: Text(
                               widget.leaguePoints[index]['position'],
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 8.0),
                        color: Colors.red,
                        height: double.infinity,
                        width: 4.0,
                      ),
                      Expanded(
                          child: Container(
                        child: FractionallySizedBox(
                            widthFactor: 1,
                            heightFactor: 1.0,
                            alignment: Alignment.topLeft,
                            child: Container(
                              color: CustomColors.leagueProgressColor,
                              padding: EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.leaguePoints[index]['points'].toString(),
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            )),
                        height: double.infinity,
                      ))
                    ],
                  ),
                );
              }),
        ]);
  }
}
