import 'dart:convert';

import 'package:flutter/material.dart';

import '../../../../../const/colors.dart';

class FundingListCarouselCell extends StatefulWidget {
  Object noteTypeItem;
  String businessName;
  String industry;
  String interestRate;
  String daysLeft;
  String percentageFunded;
  String photo;

  FundingListCarouselCell(Object item) {
    this.noteTypeItem = item;
    this.businessName = json.decode(json.encode(item))['businessName'];
    this.industry = json.decode(json.encode(item))['industry'];
    this.interestRate =
        json.decode(json.encode(item))['interestRate'].toString();
    this.daysLeft = json.decode(json.encode(item))['daysLeft'].toString();
    this.percentageFunded =
        json.decode(json.encode(item))['percentageFunded'].toString();
    this.photo =
        'https://img.stg.microleapasia.com/media/thumb/crop/240x160/x/' +
            json.decode(json.encode(item))['ownersPhotoId'].toString();
  }

  FundingListCarouselCellState createState() =>
      new FundingListCarouselCellState();
}

class FundingListCarouselCellState extends State<FundingListCarouselCell> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        // Content section
        Container(
            width: size.width,
            height: 320,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            // padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(
                        left: 18.0, right: 18.0, top: 12.0, bottom: 12.0),
                    // height: 70.0,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      widget.businessName,
                                      style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                  Container(
                                    child: Text(widget.industry,
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w600)),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  child: Text(
                                    widget.interestRate + "%",
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700,
                                        color: CustomColors
                                            .primaryBackgroundGreen),
                                  ),
                                ),
                                Container(
                                  child: Text("rate of Return Per Annum",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w600)),
                                )
                              ],
                            ))
                          ],
                        ),
                        Visibility(
                            visible: true,
                            child: Container(
                              height: 22.0,
                              padding: EdgeInsets.only(top: 6.0),
                              child: Text(
                                widget.daysLeft + " Days Left",
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                            ))
                      ],
                    )),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.white,
                    child: Image.network(
                      widget.photo,
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ],
            )),
        // Progression bar section
        Align(
          alignment: Alignment.bottomCenter,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 35.0,
                margin: EdgeInsets.symmetric(horizontal: 8.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(2.0),
                ),
                child: FractionallySizedBox(
                    widthFactor: double.parse(widget.percentageFunded) / 100,
                    heightFactor: 1.0,
                    alignment: Alignment.topLeft,
                    child: Container(
                      color: CustomColors.primaryBackgroundGreen,
                    )),
              ),
              Container(
                height: 35.0,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      widget.percentageFunded + "% Funded",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
