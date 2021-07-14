import 'package:flutter/material.dart';
import 'package:mircoleap/services/rest_api.dart';

import 'Components/FundingListCarouselWidget.dart';

class FundingListDashboard extends StatefulWidget {
  FundingListDashboardState createState() => new FundingListDashboardState();
}

class FundingListDashboardState extends State<FundingListDashboard>
    with AutomaticKeepAliveClientMixin {
  List<dynamic> conventional;
  List<dynamic> islamic;
  var noteTypes = [];

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _getNotes();
  }

  _getNotes() {
    ApiService.getNotes().then((value) => {
          conventional =
              value.where((i) => i['noteType'] == 'conventional').toList(),
          islamic = value.where((i) => i['noteType'] == 'islamic').toList(),
          setState(() => noteTypes = [conventional, islamic]),
        });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Wrap(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(left: 18.0),
          child: Text(
            "Funding List",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: noteTypes.length,
            itemBuilder: (BuildContext context, int index) {
              return FundingListCarouselWidget(index, noteTypes[index]);
            }),
        Container(
          height: 36.0,
        )
      ],
    ));
  }
}
