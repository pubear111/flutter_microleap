import 'package:flutter/material.dart';

import '../../../../const/colors.dart';
import '../../../../global_components/NavigationBar.dart';
import 'Components/FundingListDetailsFooter.dart';
import 'Components/FundingListDetailsHeader.dart';

class FundingListDetails extends StatefulWidget {
  final String item;
  FundingListDetails({Key key, @required this.item}) : super(key: key);
  FundingListDetailsState createState() => new FundingListDetailsState();
}

class FundingListDetailsState extends State<FundingListDetails> {
  @override
  void initState() {
    super.initState();
    _getNoteDetail();
  }

  _getNoteDetail() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: CustomColors.primaryBackgroundBlue,
          height: size.height * 0.8,
          width: double.infinity,
        ),
        SafeArea(
            bottom: false,
            child: Column(
              children: [
                const Navigationbar(
                  iconColor: Colors.white,
                  backgroundColor: Colors.transparent,
                ),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FundingListDetailsHeader(widget.item),
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.symmetric(
                            horizontal: 24.0, vertical: 12.0),
                        height: 80.0,
                        width: double.infinity,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Colors.blue,
                                width: 1,
                                style: BorderStyle.solid),
                          ),
                          onPressed: () => {debugPrint('clicked =====>')},
                          color: CustomColors.fundingDetailsButtonColor,
                          child: Text("INVEST NOW",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: CustomColors
                                      .fundingDetailButtonTextColor)),
                        ),
                      ),
                      FundingListDetailsFooter(widget.item)
                    ],
                  ),
                ))
              ],
            ))
      ],
    ));
  }
}
