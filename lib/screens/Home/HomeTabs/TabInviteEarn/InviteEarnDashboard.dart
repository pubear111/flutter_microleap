import 'package:flutter/material.dart';
import 'Components/InviteEarnDashboardHeader.dart';
import 'Components/InviteEarnDashboardFooter.dart';
import '../../../../global_components/DismissKeyboardContainer.dart';

class InviteEarnDashboard extends StatefulWidget {
  InviteEarnDashboardState createState() => new InviteEarnDashboardState();
}

class InviteEarnDashboardState extends State<InviteEarnDashboard> with AutomaticKeepAliveClientMixin {

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DismissKeyboardContainer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                "Invite & Earn",
                style: Theme.of(context).textTheme.headline1,
              ),
              padding: EdgeInsets.only(left: 18.0),
            ),
            InviteEarnDashboardHeader(),
            InviteEarnDashboardFooter()
          ],
        ),
      ),
    );
  }
}
