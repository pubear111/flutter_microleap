import 'package:flutter/material.dart';
import 'IssuerApplyTemplate.dart';

class IssuerApplyComplete extends StatefulWidget {
  IssuerApplyCompleteState createState() => IssuerApplyCompleteState();
}

class IssuerApplyCompleteState extends State<IssuerApplyComplete> {
  @override
  Widget build(BuildContext context) {
    return IssuerApplyTemplate(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 48.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Wrap(
                  children: [
                    const Text(
                      "Thank you for your application!",
                      style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(height: 36.0),
              applicationDetails("Funding Amount:", "RM 10,000"),
              applicationDetails("Monthly Payment:", "RM 933"),
              SizedBox(height: 18.0),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child: Wrap(
                  children: [
                    Text(
                      "Please allow us 2 business day to process your application. You'll be notified via the app on the next steps. In the meantime, feel free to experience our app!",
                      style: TextStyle(
                          fontSize: 13.0
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              SizedBox(height: 48.0),
              InkWell(
                child: Container(
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Center(
                    child: Text(
                      "Explore App",
                      style: TextStyle(
                        fontSize: 24.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
    );
  }

  Widget applicationDetails(String title, String content) {
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
                        fontWeight: FontWeight.w300,
                        decoration: TextDecoration.none,
                        color: Colors.black
                      ),
                    ),
                    TextSpan(
                      text: "${content}",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w600,
                        decoration: TextDecoration.none,
                        color: Colors.black
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