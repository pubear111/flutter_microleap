import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class IssuerApplyOneFundingTenorSelectors extends StatefulWidget {
  IssuerApplyOneFundingTenorSelectorsState createState() => IssuerApplyOneFundingTenorSelectorsState();
}

class IssuerApplyOneFundingTenorSelectorsState extends State<IssuerApplyOneFundingTenorSelectors> {
  List<String> fundingAmountList = ["6M", "112M", "18M", "24M", "30M", "36M"];
  int selectedButtonID = 0;

  void onButtonSelect(int index) {
    setState(() {
      selectedButtonID = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 6.0),
            child: RichText(
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: <TextSpan>[
                  TextSpan(
                    text: "Funding Tenor ",
                    style: TextStyle(
                    fontSize: 13.0,
                        fontWeight: FontWeight.w500
                    )
                  ),
                  TextSpan(
                    text: "(Month)",
                    style: TextStyle(
                      fontSize: 11.0,
                      fontWeight: FontWeight.w500
                    )
                  )
                ]
              ),
            )
          ),
          Container(
            height: 60.0,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: fundingAmountList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Wrap(
                    children: [
                      SizedBox(
                        width: (size.width - 40.0) / 6,
                        child: FlatButton(
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          color: selectedButtonID == index ? Colors.white : Colors.grey[200],
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: selectedButtonID == index ? Colors.blue : Colors.grey[400],
                                width: 1.5,
                                style: BorderStyle.solid
                            ),
                          ),
                          onPressed: () => {
                            onButtonSelect(index)
                          },
                          child: Text(
                            "${fundingAmountList[index]}",
                            style: TextStyle(
                                fontSize: 10.0
                            ),
                            softWrap: false,
                            // overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  );
                }
            ),
          ),
          Container(
            child: Wrap(
              children: [
                RichText(
                  text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: <TextSpan>[
                      const TextSpan(
                        text: "To have an indication of your monthly payments, please use our ",
                        style: TextStyle(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500
                        )
                      ),
                      TextSpan(
                        text: "Funding Calculator.",
                        style: TextStyle(
                          fontSize: 12.0,
                          decoration: TextDecoration.underline,
                          color: Colors.blueAccent,
                          fontWeight: FontWeight.w500
                        ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () => debugPrint('clicked =====>')
                      )
                    ]
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}