import 'dart:convert';

import 'package:flutter/material.dart';

class FundingListDetailsFooter extends StatefulWidget {
  String item;
  List<dynamic> qna;

  FundingListDetailsFooter(String item) {
    this.item = item;
    this.qna = json.decode(item)['qna'];
  }

  FundingListDetailsFooterState createState() =>
      new FundingListDetailsFooterState();
}

class FundingListDetailsFooterState extends State<FundingListDetailsFooter> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      color: Colors.white,
      // table view
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: widget.qna.length,
          itemBuilder: (BuildContext context, int index) {
            // cell container
            return Container(
              width: double.infinity,
              padding: EdgeInsets.only(left: 12.0, right: 12.0),
              margin: EdgeInsets.only(top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      widget.qna[index]['question'] ?? '',
                      style: TextStyle(
                          fontWeight: FontWeight.w800, fontSize: 12.0),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.qna[index]['answer'] ?? '',
                      style: TextStyle(
                          // fontWeight: FontWeight.w800,
                          fontSize: 12.0,
                          height: 1.5),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
