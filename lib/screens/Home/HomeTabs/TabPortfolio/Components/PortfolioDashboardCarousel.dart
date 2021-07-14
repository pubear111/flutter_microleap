import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'PortfolioDashboardCarouselCell.dart';
import '../../../../../model/PorfolioCarouselModel.dart';

class PortfolioDashboardCarousel extends StatefulWidget {
  PortfolioDashboardCarouselState createState() => new PortfolioDashboardCarouselState();
}

class PortfolioDashboardCarouselState extends State<PortfolioDashboardCarousel> {
  int _current = 0;
  List<PortfolioCarouselModel> portfolioCarouselList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PortfolioCarouselModel p1 = PortfolioCarouselModel("You've", "Invested", "6,390", "of RM 14,248 in available funds", "40% Pledged", "60% Invested", 30);
    PortfolioCarouselModel p2 = PortfolioCarouselModel("Available", "Funds", "14,248", "with RM 248 in microLEAP Credits", "0.1% Credits", "99.9% Funds", 65);
    portfolioCarouselList.add(p1);
    portfolioCarouselList.add(p2);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
          height: double.infinity,
              enableInfiniteScroll: false,
              viewportFraction: 0.92,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }
          ),
          items: portfolioCarouselList.map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: size.width,
                  margin: EdgeInsets.symmetric(horizontal: 8.0),
                  // padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0, bottom: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  child: PortfolioDashboardCarouselCell(i),
                );
              },
            );
          }).toList(),
        ),
        Align(
          alignment: FractionalOffset.bottomCenter,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: portfolioCarouselList.map((url) {
              int index = portfolioCarouselList.indexOf(url);
              return Container(
                width: 18.0,
                height: 5.0,
                margin: EdgeInsets.symmetric(vertical: 16.0, horizontal: 2.0,),
                decoration: BoxDecoration(
                  color: _current == index
                      ? Color.fromRGBO(0, 0, 0, 0.9)
                      : Color.fromRGBO(0, 0, 0, 0.4),
                  borderRadius: BorderRadius.circular(2.0),
                ),
              );
            }).toList(),
          ),
        )
      ],
    );
  }
}



