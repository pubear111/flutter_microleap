import 'package:flutter/material.dart';
import '../../../../global_components/CustomScrollViewBuilder.dart';
import 'IssuerApplyOneFundingTenorSelectors.dart';
import 'IssuerApplyOneMonthlyPayment.dart';
import '../../../Selector/Components/SelectorFooter.dart';
import '../../../../const/routerpath.dart';

class IssuerApplyOneBody extends StatefulWidget {
  IssuerApplyOneBodyState createState() => IssuerApplyOneBodyState();
}

class IssuerApplyOneBodyState extends State<IssuerApplyOneBody> {

  int selectedButtonID = 0;

  void onNextTap() {
    Navigator.pushNamed(context, RouterPath.IssuerApplyOneToIssuerApplyTwo);
  }

  static const TextStyle howMuchDoYouNeedStyle = TextStyle(
    fontSize: 26.0,
    fontWeight: FontWeight.w600
  );

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewBuilder(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          howMuchDoYouNeedHeader(),
          IssuerApplyOneFundingTenorSelectors(),
          IssuerApplyOneMonthlyPayment(),
          SelectorFooter(
            onNextTapped: this.onNextTap,
            backgroundColor: Colors.transparent,
            textColor: Colors.grey[800],
          )
        ],
      )
    );
  }

  Widget howMuchDoYouNeedHeader() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  child: const Text(
                    "How much do",
                    style: howMuchDoYouNeedStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: const Text(
                    "you need?",
                    style: howMuchDoYouNeedStyle,
                    textAlign: TextAlign.center,
                  ),
                )
              ],
            )
          ),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
               "Use our business Funding Calculator to find out how much you need. "
               "Move the Funding Amount and Rate of Return slide-rules, "
               "then choose your Funding Tenor to get an indication of your monthly repayments.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 13.0,
                height: 1.5
              ),
            ),
          )
        ],
      ),
    );
  }
}