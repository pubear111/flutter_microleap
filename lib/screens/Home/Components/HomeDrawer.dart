import 'package:flutter/material.dart';

import 'package:url_launcher/url_launcher.dart';

import '../../Drawers/Profile/Profile.dart';

import '../../../const/colors.dart';

class HomeDrawer extends StatelessWidget {
  List<String> drawerList = [
    "My Profile",
    "MicroLEAP Islamic",
    "Why Invest",
    "Auto Invest",
    "MicroInsurance",
    "FAQ",
    "Terms & Conditions"
  ];

  // call when drawer cell is tapped
  void drawerCellTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        Navigator.pop(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Profile()));
        break;
      case 1:
        _launchURL(
            'https://www.microleapasia.com/mobile/microleapislamic.html');
        break;
      case 2:
        _launchURL('https://www.microleapasia.com/mobile/invest.html');
        break;
      case 3:
        _launchURL('https://www.microleapasia.com/mobile/autoinvest.html');
        break;
      case 4:
        _launchURL('https://www.microleapasia.com/mobile/microinsurance.html');
        break;
      case 5:
        break;
      case 6:
        _launchURL(
            'https://www.microleapasia.com/mobile/MCLP-Terms-Conditions.pdf');
        break;
    }
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                // boxShadow:[
                //   BoxShadow(
                //     color: Colors.black.withOpacity(0.8),
                //     spreadRadius: 5,
                //     blurRadius: 7,
                //     offset: Offset(0, 3),
                //   )
                // ],
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(12.0),
                    bottomRight: Radius.circular(12.0))),
            width: size.width / 2.0,
            height: double.infinity,
            margin: const EdgeInsets.only(bottom: 48.0),
            child: Column(
              children: [
                Container(
                  height: 60.0,
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 12.0),
                  child: Image.asset(
                    "assets/logo.png",
                  ),
                ),
                const SizedBox(height: 12.0),
                Expanded(
                  child: drawerListBuilder(),
                )
              ],
            )));
  }

  Widget drawerListBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: drawerList.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: InkWell(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "${drawerList[index]}",
                      ),
                    ),
                    Container(
                      height: 1.0,
                      margin: EdgeInsets.only(top: 8.0),
                      color: CustomColors.textFieldTitle,
                    )
                  ],
                ),
                onTap: () {
                  drawerCellTapped(index, context);
                },
              ));
        });
  }
}
