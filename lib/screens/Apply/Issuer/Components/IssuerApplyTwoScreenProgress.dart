import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class IssuerApplyTwoScreenProgress extends StatelessWidget {
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
                child: Text(
                  "Please enter the relevant information to complete your application in 6 simple steps.",
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey[600]
                  ),
                ),
              )
            ],
          ),
          Container(
            child: Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 3.5),
                  child: LinearPercentIndicator(
                    animation: true,
                    lineHeight: 3.0,
                    animationDuration: 100,
                    percent: 0.2,
                    linearStrokeCap: LinearStrokeCap.butt,
                    progressColor: Colors.green,
                    backgroundColor: Colors.grey[300],
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      progressCheckpoint(Colors.green),
                      progressCheckpoint(Colors.green),
                      progressCheckpoint(Colors.grey[300]),
                      progressCheckpoint(Colors.grey[300]),
                      progressCheckpoint(Colors.grey[300]),
                      progressCheckpoint(Colors.grey[300]),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget progressCheckpoint(Color color) {
    return Container(
      height: 10.0,
      width: 10.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: color,
      ),
    );
  }
}