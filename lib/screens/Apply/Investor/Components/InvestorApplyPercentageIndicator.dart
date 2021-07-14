import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class InvestorApplyPercentageIndicator extends StatelessWidget {

  TextStyle textStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 12.0
  );

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      width: size.width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.0, top: 4.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Become an Investor",
                    style: textStyle,
                  )
                ),
                Expanded(
                  child: Text(
                    "Step 2",
                    textAlign: TextAlign.end,
                    style: textStyle,
                  )
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 4.0),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 0, top: 4.0),
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: InvestorApplyPercentageStateWrapper.of(context).percentage == 0.0 ? Colors.green : Colors.transparent,
                            width: 1.5
                        ),
                        color: Colors.transparent,
                      ),
                      width: (size.width - 36) / 2,
                      height: 8.0,
                      child: LinearPercentIndicator(
                        animation: true,
                        lineHeight: 5.0,
                        animationDuration: 100,
                        percent: InvestorApplyPercentageStateWrapper.of(context).percentage,
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Colors.green,
                        backgroundColor: Colors.transparent,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 0.0, top: 4.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: InvestorApplyPercentageStateWrapper.of(context).percentage2 == 0.0 ? Colors.green : Colors.transparent,
                              width: 1.5
                          ),
                          color: InvestorApplyPercentageStateWrapper.of(context).percentage2 == 0.0 ? Colors.transparent : Colors.green,
                        ),
                        height: InvestorApplyPercentageStateWrapper.of(context).percentage2 == 0.0 ? 8.0 : 6.0,
                        child: LinearPercentIndicator(
                          animation: true,
                          lineHeight: 5.0,
                          animationDuration: 100,
                          percent: InvestorApplyPercentageStateWrapper.of(context).percentage2,
                          linearStrokeCap: LinearStrokeCap.butt,
                          progressColor: Colors.green,
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                  ),
                  Expanded(
                      child: Container(
                        width: 15.0,
                        height: 15.0,
                        decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle
                        ),
                      )
                  ),
                  Container(
                    width: 15.0,
                    height: 15.0,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        shape: BoxShape.circle
                    ),
                  )
                ],
              ),
            ],
          )
        ],
      )
    );
  }
}

class InvestorApplyPercentageStateWrapper extends InheritedWidget {
  static of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InvestorApplyPercentageStateWrapper>();

  final double percentage;
  final double percentage2;

  InvestorApplyPercentageStateWrapper({
    Key key,
    @required Widget child,
    @required this.percentage,
    @required this.percentage2,
  }) : assert(percentage != null),
        assert(percentage2 != null),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InvestorApplyPercentageStateWrapper oldWidget) {
    if(this.percentage != oldWidget.percentage ||
        this.percentage2 != oldWidget.percentage2
    ){
      return true;
    } else {
      return false;
    }
  }
}