import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

import './ImageScreen.dart';
import '../../../../../const/colors.dart';

class FundingListDetailsHeader extends StatefulWidget {
  String item;
  String businessName;
  String industry;
  String interestRate;
  String daysLeft;
  String percentageFunded;
  String photo;
  List<dynamic> gallery;

  FundingListDetailsHeader(String item) {
    this.item = item;
    this.businessName = json.decode(item)['businessName'];
    this.industry = json.decode(item)['industry'];
    this.interestRate = json.decode(item)['interestRate'].toString();
    this.daysLeft = json.decode(item)['daysLeft'].toString();
    this.percentageFunded = json.decode(item)['percentageFunded'].toString();
    this.photo =
        'https://img.stg.microleapasia.com/media/thumb/crop/240x160/x/' +
            json.decode(item)['ownersPhotoId'].toString();
    this.gallery = json.decode(item)['galleryIds'];
    if (this.gallery == null) {
      this.gallery = [json.decode(item)['ownersPhotoId']];
    }
    if (this.gallery.length == 0) {
      this.gallery = [json.decode(item)['ownersPhotoId']];
    }
    debugPrint('this.gallery =====>' + this.gallery.toString());
  }

  FundingListDetailsHeaderState createState() =>
      new FundingListDetailsHeaderState();
}

class FundingListDetailsHeaderState extends State<FundingListDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // Description section
        Container(
          width: double.infinity,
          child: Container(
            child: Container(
                margin: EdgeInsets.only(left: 18.0, right: 18.0, bottom: 12.0),
                // color: Colors.white,
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
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 2.0),
                                child: Text(widget.industry,
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.white)),
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
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white),
                              ),
                            ),
                            Container(
                              child: Text("rate of Return Per Annum",
                                  style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white)),
                            )
                          ],
                        ))
                      ],
                    ),
                    Visibility(
                        visible: true,
                        child: Container(
                          height: 32.0,
                          padding: EdgeInsets.only(top: 12.0),
                          child: Text(
                            "3LR3  , RM 50,000 for 36 Month term.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                                fontSize: 15.0),
                          ),
                        ))
                  ],
                )),
          ),
        ),
        // Progressive bar section
        Align(
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 35.0,
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
        ),
        // Image container section
        /*
        Container(
          height: 280.0,
          width: double.infinity,
          color: Colors.white,
          child: Image.network(
            widget.photo,
            fit: BoxFit.cover,
          ),
        ),
        */
        Container(
          height: 280.0,
          width: double.infinity,
          child: CarouselSlider(
            options: CarouselOptions(
              height: double.infinity,
              enableInfiniteScroll: false,
              viewportFraction: 1,
            ),
            items: widget.gallery.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: GestureDetector(
                        child: Image.network(
                            'https://img.stg.microleapasia.com/media/thumb/crop/240x160/x/' +
                                i.toString(),
                            fit: BoxFit.fill),
                      ));
                },
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}
