import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../const/routerpath.dart';
import 'FundingListCarouselCell.dart';

class FundingListCarouselWidget extends StatefulWidget {
  int index;
  List<dynamic> noteTypeArr;

  FundingListCarouselWidget(int index, List item) {
    this.index = index;
    this.noteTypeArr = item;
  }

  FundingListCarouselWidgetState createState() =>
      new FundingListCarouselWidgetState();
}

class FundingListCarouselWidgetState extends State<FundingListCarouselWidget> {
  void didSelectCarouselCell(i) {
    String id = json.decode(json.encode(i))['id'];
    Navigator.pushNamed(
        context, RouterPath.FundingListDashboardToFundingListDetails,
        arguments: json.encode(i));
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        // height: 460.0,
        margin: EdgeInsets.only(top: 18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 40.0,
              padding: EdgeInsets.only(left: 18.0, top: 4.0),
              child: Text(
                widget.index == 0 ? 'Conversational' : 'Islamic',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
            Container(
              height: 340.0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: double.infinity,
                  enableInfiniteScroll: false,
                  viewportFraction: 0.92,
                ),
                items: widget.noteTypeArr.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        child: FundingListCarouselCell(i),
                        onTap: () => didSelectCarouselCell(i),
                      );
                    },
                  );
                }).toList(),
              ),
            )
          ],
        ));
  }
}
