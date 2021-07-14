import 'package:flutter/material.dart';

import '../../../global_components/DismissKeyboardContainer.dart';
import '../../../global_components/StatusBarStyleContainer.dart';
import 'Components/ApplicantsDetails.dart';
import 'Components/InvestorApplyPercentageIndicator.dart';

class InvestorApply extends StatefulWidget {
  InvestorApplyState createState() => InvestorApplyState();
}

class InvestorApplyState extends State<InvestorApply> {
  double percentage = 1.0;
  double percentage2 = 0;

  Widget build(BuildContext context) {
    return DismissKeyboardContainer(
      child: StatusBarStyleContainer(
        child: Scaffold(
            appBar: new AppBar(
              title: Container(
                height: 40.0,
                width: double.infinity,
                margin: const EdgeInsets.only(right: 56.0),
                child: Image.asset(
                  "assets/logo.png",
                ),
              ), // You can add title here
              leading: new IconButton(
                icon: new Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0.0, //No shadow
            ),
            body: SafeArea(
              child: Column(
                children: [
                  InvestorApplyPercentageStateWrapper(
                      child: InvestorApplyPercentageIndicator(),
                      percentage2: this.percentage2,
                      percentage: this.percentage),
                  /*
                  InkWell(
                    child: Text("click here to simulate"),
                    onTap: () {
                      setState(() {
                        percentage2 = 1.0;
                        // if(pageIndex == 0 && pageIndex <= 1) {
                        //   pageIndex = pageIndex + 1;
                        //   percentage = 1.0;
                        // } else {
                        //   percentage2 = 1.0;
                        // }
                        //
                      });
                    },
                  ),
                  */
                  Expanded(child: ApplicantsDetails())
                ],
              ),
            )),
      ),
    );
  }
}
