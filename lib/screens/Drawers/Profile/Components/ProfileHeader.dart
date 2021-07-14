import 'package:flutter/material.dart';

import '../../../../const/colors.dart';
import '../../../../const/variables.dart';

class ProfileHeader extends StatelessWidget {
  String name = Global().name;
  String email = Global().email;
  String leagueRank = Global().leagueRank;

  TextStyle textHeaderStyle = TextStyle(
    color: CustomColors.rankBlue,
  );

  TextStyle textBodyStyle = TextStyle(
      color: CustomColors.rankBlue,
      fontSize: 15.0,
      fontWeight: FontWeight.w700);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0), color: Colors.white),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 24.0),
              child: Container(
                height: 80.0,
                width: 120,
                decoration: BoxDecoration(
                    // color: Colors.yellow,
                    borderRadius: BorderRadius.circular(12.0),
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      colorFilter:
                          ColorFilter.mode(Colors.white, BlendMode.color),
                      image: AssetImage("assets/profile.png"),
                    )),
              ),
            ),
            Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w700,
                          color: CustomColors.primaryBackgroundBlack),
                    ),
                    Visibility(
                      child: Container(
                        margin: EdgeInsets.only(left: 4.0),
                        child: Icon(
                          Icons.check_circle,
                          color: Colors.blue,
                        ),
                      ),
                      visible: true,
                    )
                  ],
                )),
            SizedBox(height: 8.0),
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                email,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 13.0, color: Colors.grey),
              ),
            ),
            SizedBox(height: 12.0),
            Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: CustomColors.textFieldContainer,
              ),
              margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
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
                        leagueRankLabel("Your Rank:", leagueRank),
                      ],
                    ),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget leagueRankLabel(String titleStr, String descriptionStr) {
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
