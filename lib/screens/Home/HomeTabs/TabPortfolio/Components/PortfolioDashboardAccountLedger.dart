import 'package:flutter/material.dart';
import '../../../../../const/colors.dart';
import '../../../../../global_components/CustomButton.dart';

class PortfolioDashboardAccountLedger extends StatefulWidget {
  PortfolioDashboardAccountLedgerState createState() => new PortfolioDashboardAccountLedgerState();
}

class PortfolioDashboardAccountLedgerState extends State<PortfolioDashboardAccountLedger> {

  BoxDecoration boxDecoration = new BoxDecoration(
    borderRadius: BorderRadius.circular(6.0),
    color: CustomColors.buttonLightBlue,
  );

  TextStyle textStyle = new TextStyle(
      color: CustomColors.selectorBlue,
      fontWeight: FontWeight.w700,
      fontSize: 16.0
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 4.0, right: 20.0),
            child: Text(
              "Account Ledger",
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20.0, top: 4.0, right: 20.0),
            margin: EdgeInsets.only(top: 12.0),
            child: Row(
              children: [
                Expanded(
                  child: CustomButton(
                    buttonText: "Day",
                    boxDecoration: boxDecoration,
                    edgeInsets: EdgeInsets.only(right: 8.0),
                    textStyle: textStyle,
                  )
                ),
                Expanded(
                  child: CustomButton(
                    buttonText: "Week",
                    boxDecoration: boxDecoration,
                    edgeInsets: EdgeInsets.symmetric(horizontal: 8.0),
                    textStyle: textStyle,
                  )
                ),
                Expanded(
                  child: CustomButton(
                    buttonText: "Month",
                    boxDecoration: boxDecoration,
                    edgeInsets: EdgeInsets.symmetric(horizontal: 8.0),
                    textStyle: textStyle,
                  )
                ),
                Expanded(
                  child: CustomButton(
                    buttonText: "Year",
                    boxDecoration: boxDecoration,
                    edgeInsets: EdgeInsets.only(left: 8.0),
                    textStyle: textStyle,
                  )
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 12.0),
            child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text("Column1", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
                    DataColumn(label: Text("Column2", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
                    DataColumn(label: Text("Column2", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
                    DataColumn(label: Text("Column2", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800))),
                  ],
                  rows: [
                    DataRow(cells: [
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                    ]),
                    DataRow(cells: [
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 1", style: TextStyle(color: Colors.white))),
                      DataCell(Text("row 1 col 2", style: TextStyle(color: Colors.white))),
                    ]),
                  ],
                ),
            ),
          )
        ],
      ),
    );
  }
}
