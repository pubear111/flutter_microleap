import 'package:flutter/material.dart';
import '../../../Selector/Components/SelectorFooter.dart';
import '../../../../global_components/CustomScrollViewBuilder.dart';
import 'IssuerApplyTwoAbout.dart';
import 'IssuerApplyTwoScreenProgress.dart';
import '../../../../const/routerpath.dart';

class IssuerApplyTwoBody extends StatefulWidget {
  IssuerApplyTwoBodyState createState() => IssuerApplyTwoBodyState();
}

class IssuerApplyTwoBodyState extends State<IssuerApplyTwoBody> {

  void onNextTap() {
    Navigator.pushNamed(context, RouterPath.IssuerApplyTwoToIssuerApplyComplete);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollViewBuilder(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          pageHeader("Funding Amount:", "RM 10,000"),
          pageHeader("Monthly Payment:", "RM 933"),
          IssuerApplyTwoScreenProgress(),
          IssuerApplyTwoAbout(),
          SelectorFooter(
            onNextTapped: this.onNextTap,
            backgroundColor: Colors.transparent,
            textColor: Colors.grey[800],
          )
        ],
      )
    );
  }

  Widget pageHeader(String title, String content) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      child: Column(
        children: [
          Container(
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan> [
                  TextSpan(
                    text: "${title} ",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w300
                    )
                  ),
                  TextSpan(
                    text: "${content}",
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600
                    )
                  )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}