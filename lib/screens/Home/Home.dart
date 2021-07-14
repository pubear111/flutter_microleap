import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../const/variables.dart';
import '../../global_components/DisableSwipeToPop.dart';
import 'Components/HomeDrawer.dart';
import 'Components/HomeTabBar/HomeTabBar.dart';
import 'HomeTabs/TabFundingList/FundingListDashboard.dart';
import 'HomeTabs/TabInviteEarn/InviteEarnDashboard.dart';
import 'HomeTabs/TabLeague/LeagueDashboard.dart';
import 'HomeTabs/TabPortfolio/PortfolioDashboard.dart';

class Home extends StatefulWidget {
  HomeState createState() => new HomeState();
}

class HomeState extends State<Home> with SingleTickerProviderStateMixin {
  TabController _tabController;
  // Color backgroundColor;
  // double heightRatio;

  // Function to detect tab click to change the background
  void tabClick() {
    /*
    if(_tabController.indexIsChanging) {
      switch (_tabController.index) {
        case 0:
          setState(() {
            backgroundColor = Color(0xFF00FF00);
            heightRatio = 1.0;
          });
          break;
        case 1:
          setState(() {
            backgroundColor = Color(0xFF242944);
            heightRatio = 1.0;
          });
          break;
        case 2:
          setState(() {
            backgroundColor = Color(0xFF008800);
            heightRatio = 1.0;
          });
          break;
        case 3:
          setState(() {
            backgroundColor = Color(0xFF4F5988);
            heightRatio = 1.0;
          });
          break;
      }
    }
    */
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DisableSwipeToPop(
        child: Container(
      color: Color(0xFFF5F5F6),
      child: DefaultTabController(
          length: 4,
          child: Stack(
            children: [
              TabBarView(
                physics: NeverScrollableScrollPhysics(),
                controller: _tabController,
                children: [
                  Container(
                    color: CustomColors.primaryBackgroundBlue,
                  ),
                  Container(
                    color: CustomColors.primaryBackgroundGreen,
                  ),
                  Container(
                    color: CustomColors.primaryBackgroundBlack,
                  ),
                  Container(
                    color: CustomColors.primaryBackgroundBlue,
                  ),
                ],
              ),
              Scaffold(
                  backgroundColor: Colors.transparent,
                  bottomNavigationBar: HomeTabBar(_tabController),
                  drawer: HomeDrawer(),
                  appBar: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0.0,
                  ),
                  body: Stack(
                    children: [
                      TabBarView(
                        physics: NeverScrollableScrollPhysics(),
                        controller: _tabController,
                        children: [
                          FundingListDashboard(),
                          PortfolioDashboard(),
                          LeagueDashboard(),
                          InviteEarnDashboard(),
                        ],
                      )
                    ],
                  )),
            ],
          )),
    ));
  }
}
