import 'package:flutter/material.dart';

import 'const/routerpath.dart';
import 'const/theme.dart';
import 'global_components/CountryPicker.dart';
import 'screens/Apply/Investor/InvestorApply.dart';
import 'screens/Apply/Issuer/IssuerApplyComplete.dart';
import 'screens/Apply/Issuer/IssuerApplyOne.dart';
import 'screens/Apply/Issuer/IssuerApplyTwo.dart';
import 'screens/Home/Home.dart';
import 'screens/Home/HomeTabs/TabFundingList/FundingListDetails.dart';
import 'screens/Splash/Splash.dart';

void main() {
  runApp(AppMain());
}

class AppMain extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme(context),
        home: Splash(),
        initialRoute: '/',
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case RouterPath.SelectorToInvestorApply:
              return MaterialPageRoute(builder: (context) => InvestorApply());
            case RouterPath.FundingListDashboardToFundingListDetails:
              return MaterialPageRoute(
                  builder: (context) =>
                      new FundingListDetails(item: settings.arguments));
            case RouterPath.CountryPicker:
              return createCountryPickerRoute();
            // return PageRouteBuilder(pageBuilder: (BuildContext context, _, __) => CountryPicker(), opaque: false, fullscreenDialog: true);
            case RouterPath.InvestorInformationToHome:
              return MaterialPageRoute(builder: (context) => Home());
            case RouterPath.SelectorToIssuerApplyOne:
              return MaterialPageRoute(builder: (context) => IssuerApplyOne());
            case RouterPath.IssuerApplyOneToIssuerApplyTwo:
              return MaterialPageRoute(builder: (context) => IssuerApplyTwo());
            case RouterPath.IssuerApplyTwoToIssuerApplyComplete:
              return MaterialPageRoute(
                  builder: (context) => IssuerApplyComplete());
            default:
              return null;
          }
        });
  }

  Route createCountryPickerRoute() {
    return PageRouteBuilder(
      opaque: false,
      pageBuilder: (context, animation, secondaryAnimation) => CountryPicker(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
