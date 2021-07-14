import 'package:flutter/material.dart';
import 'package:mircoleap/model/PorfolioCarouselModel.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../../../../../const/colors.dart';

class PortfolioDashboardCarouselCell extends StatefulWidget {
  PortfolioCarouselModel carouselItem;

  PortfolioDashboardCarouselCell(PortfolioCarouselModel carouselItem) {
    this.carouselItem = carouselItem;
  }

  PortfolioDashboardCarouselCellState createState() => new PortfolioDashboardCarouselCellState();
}

class PortfolioDashboardCarouselCellState extends State<PortfolioDashboardCarouselCell> {

  double progressPercentage = 0;

  void calculatePercentage(double percentage) {

    // the percentage
    double originalProgressPercentage = percentage;
    double scaledProgressPercentage = (originalProgressPercentage / 100) * 65;
    double parsedDecimalProgressPercentage = double.parse((scaledProgressPercentage).toStringAsFixed(0)) / 100;

    this.setState(() {
      progressPercentage = parsedDecimalProgressPercentage;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculatePercentage(widget.carouselItem.percentage);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: [
          Container(
            height: 36.0,
            padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
            child: Row(
              children: [
                Text(
                  "for",
                  style: TextStyle(
                    color: Color(0xFFB6BCC8),
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 4.0),
                  child: Text(
                    "Tunku Danny",
                    style: TextStyle(
                      fontSize: 14.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              child: Stack(
                children: [
                  // progression bar widget should be replaced here
                  Container(
                    // padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0),
                      child: Center(
                        child: CircularPercentIndicator(
                          startAngle: 243.0,
                          radius: 300.0,
                          lineWidth: 15.0,
                          animation: false,
                          percent: 0.65,
                          circularStrokeCap: CircularStrokeCap.round,
                          progressColor: CustomColors.primaryBackgroundBlue,
                          backgroundColor: Colors.transparent,
                        ),
                      )
                  ),
                  Container(
                    // padding: EdgeInsets.only(left: 18.0, right: 18.0, top: 12.0),
                    child: Center(
                      child: CircularPercentIndicator(
                        startAngle: 243.0,
                        radius: 300.0,
                        lineWidth: 15.0,
                        animation: true,
                        percent: progressPercentage,
                        circularStrokeCap: CircularStrokeCap.round,
                        progressColor: Colors.green,
                        backgroundColor: Colors.transparent,
                      ),
                    )
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // SizedBox(height: 48.0,),
                      Container(
                        margin: EdgeInsets.only(top: 96.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                  widget.carouselItem.title1
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 4.0),
                              child: Text(
                                widget.carouselItem.title2,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Text(
                                "RM",
                                style: TextStyle(
                                  fontSize: 32.0,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                widget.carouselItem.amount,
                                style: TextStyle(
                                  fontSize: 32.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 12.0),
                      Container(
                        child: Text(
                          widget.carouselItem.subtitle,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF828FA4),
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 42.0),
                        padding: EdgeInsets.symmetric(horizontal: 18.0),
                        height: 36.0,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Text(
                                    widget.carouselItem.progressStart,
                                    style: TextStyle(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.w500
                                    )
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: Text(
                                  widget.carouselItem.progressEnd,
                                  textAlign: TextAlign.right,
                                  style: TextStyle(
                                      fontSize: 13.0,
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}



