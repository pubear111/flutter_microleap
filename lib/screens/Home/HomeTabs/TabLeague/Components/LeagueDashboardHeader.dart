import 'package:flutter/material.dart';
import 'package:mircoleap/const/variables.dart';

import '../../../../../const/colors.dart';
import '../../../../../global_components/CustomButton.dart';

class LeagueDashboardHeader extends StatefulWidget {
  LeagueDashboardHeaderState createState() => new LeagueDashboardHeaderState();
}

class LeagueDashboardHeaderState extends State<LeagueDashboardHeader> {
  TextStyle textHeaderStyle = TextStyle(
    color: CustomColors.rankBlue,
  );

  TextStyle textBodyStyle = TextStyle(
      color: CustomColors.rankBlue,
      fontSize: 15.0,
      fontWeight: FontWeight.w700);

  BoxDecoration boxDecoration = new BoxDecoration(
    color: CustomColors.buttonLightBlue,
    borderRadius: BorderRadius.circular(10.0),
  );

  EdgeInsets leftButtonEdgeInsets =
      new EdgeInsets.only(left: 20.0, bottom: 18.0, right: 8.0);
  EdgeInsets rightButtonEdgeInsets =
      new EdgeInsets.only(left: 8.0, bottom: 18.0, right: 20.0);
  TextStyle textStyle = new TextStyle(
      color: Colors.black, fontWeight: FontWeight.w300, fontSize: 16.0);

  // buttons on tapped callback
  void leagueButtonsOnTapped(int buttonID) {
    if (buttonID == 1) {
      debugPrint("leaderboard tapped");
    } else {
      debugPrint("league details tapped");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 140.0,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
          decoration: boxDecoration,
          child: Column(
            children: [
              Container(
                child: Text(
                  "Welcome to the league of Extraordinary Investors",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: CustomColors.primaryBackgroundBlack,
                      fontSize: 15.0,
                      fontWeight: FontWeight.w700),
                ),
                padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
              ),
              Expanded(
                  child: Center(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white),
                  width: double.infinity,
                  margin: EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    children: [
                      Container(
                        color: Colors.black,
                        width: 100.0,
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.only(right: 24.0),
                        height: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            rankPointsLabel("Your Rank:", Global().leagueRank),
                            rankPointsLabel("Your Points:", Global().leaguePoints.toString())
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ))
            ],
          ),
          padding: EdgeInsets.only(left: 18.0, right: 18.0),
        ),
        Container(
          child: Row(
            children: [
              Expanded(
                  child: CustomButton(
                buttonID: 1,
                boxDecoration: boxDecoration,
                edgeInsets: leftButtonEdgeInsets,
                buttonHeight: 35.0,
                textStyle: textStyle,
                buttonText: "Leaderboard",
                handleOnTapped: this.leagueButtonsOnTapped,
              )),
              Expanded(
                  child: CustomButton(
                buttonID: 2,
                boxDecoration: boxDecoration,
                edgeInsets: rightButtonEdgeInsets,
                buttonHeight: 35.0,
                textStyle: textStyle,
                buttonText: "League Details",
                handleOnTapped: this.leagueButtonsOnTapped,
              ))
            ],
          ),
        )
      ],
    );
  }

  Widget rankPointsLabel(String titleStr, String descriptionStr) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            titleStr,
            style: textHeaderStyle,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 4.0),
          child: Text(descriptionStr, style: textBodyStyle),
        )
      ],
    );
  }
}
