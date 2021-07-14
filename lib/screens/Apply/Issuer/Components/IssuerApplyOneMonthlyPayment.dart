import 'package:flutter/material.dart';

class IssuerApplyOneMonthlyPayment extends StatelessWidget {

  static TextStyle paymentDetailsCellTextStyle = TextStyle(
    fontSize: 13.0,
    fontWeight: FontWeight.w700
  );

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            child: const Text(
              "Your Monthly Payment is",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.w700
              ),
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 18.0, bottom: 12.0),
              width: double.infinity,
              child: Text(
                "RM 933",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w800,
                    color: Colors.green
                ),
              )
          ),
          Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey,
          ),
          SizedBox(height: 18.0),
          paymentDetails("Total Cost of Funds", "RM 12,000"),
          paymentDetails("Total Return", "RM 1,200"),
          paymentDetails("** Hosting Fee", "RM 800"),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            child: Wrap(
              children: [
                Text(
                  "This is an indicative 10% per annum, actual interest / profit rate will only ve determined when we run the credit score.",
                  style: TextStyle(
                      fontSize: 12.0,
                      color: Colors.grey[600]
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget paymentDetails(String detailsTitle, String detailsValue) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                "${detailsTitle}",
                style: paymentDetailsCellTextStyle,
              ),
            )
          ),
          Expanded(
            child: Container(
              child: Text(
                "${detailsValue}",
                textAlign: TextAlign.end,
                style: paymentDetailsCellTextStyle,
              ),
            )
          )
        ],
      ),
    );
  }
}