import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/routerpath.dart';
import '../../const/variables.dart';
import 'Components/SelectorCellContainer.dart';
import 'Components/SelectorFooter.dart';

class Selector extends StatefulWidget {
  SelectorState createState() => new SelectorState();
}

class SelectorState extends State<Selector> {
  bool isInvestSelected = true;
  bool isRaiseFundsSelected = false;

  @override
  void initState() {
    super.initState();
    this.isInvestSelected = true;
    this.isRaiseFundsSelected = false;
  }

  void onNextTapped() {
    if (isInvestSelected) {
      Global().isInvestor = true;
      Navigator.pushNamed(context, RouterPath.SelectorToInvestorApply);
    } else {
      Global().isInvestor = false;
      Navigator.pushNamed(context, RouterPath.SelectorToIssuerApplyOne);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: new AppBar(
        title: Text(''), // You can add title here
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: CustomColors.selectorBackgroundGreen, //You can make this transparent
        elevation: 0.0, //No shadow
      ),
      body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Positioned(
                  child: Container(
                height: size.height,
                width: size.width,
                color: CustomColors.selectorBackgroundGreen,
                padding: EdgeInsets.only(top: 48.0),
                child: SingleChildScrollView(
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        child: SelectorCellContainer(
                            "assets/statistic.png",
                            "INVEST",
                            "Invest and grow your capital. Win cash prizes with our league.",
                            isInvestSelected),
                        onTap: () => {
                          setState(() {
                            isRaiseFundsSelected = false;
                            isInvestSelected = true;
                          })
                        },
                      ),
                      InkWell(
                        child: SelectorCellContainer(
                            "assets/statistic.png",
                            "RAISE FUNDS",
                            "Raise up to RM 50,000 for your business",
                            isRaiseFundsSelected),
                        onTap: () => {
                          setState(() {
                            isInvestSelected = false;
                            isRaiseFundsSelected = true;
                          })
                        },
                      ),
                      SizedBox(
                        height: 60,
                      )
                    ],
                  ),
                ),
              )),
              Positioned(
                  bottom: 0,
                  child: SelectorFooter(
                    onNextTapped: this.onNextTapped,
                    backgroundColor: CustomColors.selectorBackgroundGreen,
                    textColor: Colors.white,
                  ))
            ],
          )),
    );
  }
}
