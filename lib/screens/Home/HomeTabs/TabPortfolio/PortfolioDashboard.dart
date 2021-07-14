import 'package:flutter/material.dart';

import 'Components/PortfolioDashboardAccountLedger.dart';
import 'Components/PortfolioDashboardCarousel.dart';
import 'Components/PortfolioDashboardRowButtons.dart';

class PortfolioDashboard extends StatefulWidget {
  PortfolioDashboardState createState() => new PortfolioDashboardState();
}

class PortfolioDashboardState extends State<PortfolioDashboard>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  void fundsInvestButtonTapped(int buttonIndex) {
    if (buttonIndex == 0) {
      debugPrint("funds tapped");
    } else {
      debugPrint("invest tapped");
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Your Portfolio",
              style: Theme.of(context).textTheme.headline1,
            ),
            padding: EdgeInsets.only(left: 18.0),
          ),
          Container(
            padding: EdgeInsets.only(top: 18.0),
            // color: Colors.red,
            height: 370.0,
            width: double.infinity,
            child: PortfolioDashboardCarousel(),
          ),
          PortfolioDashboardRowButtons(
            onButtonTapped: (int buttonIndex) {
              fundsInvestButtonTapped(buttonIndex);
            },
          ),
          Container(
            // color: Colors.green,
            // height: 500.0,
            width: double.infinity,
            child: PortfolioDashboardAccountLedger(),
          ),
        ],
      )),
    );
  }
}
