import 'package:flutter/material.dart';
import '../../../../const/routerpath.dart';

class InvestorApplicationDropDown extends StatelessWidget {
  TextEditingController controller;
  String sectionTitle;
  EdgeInsets contentPadding;

  InvestorApplicationDropDown(
      {this.controller, this.sectionTitle, this.contentPadding});

  onNationalitySelected(BuildContext context) async {
    final result = await Navigator.pushNamed(context, RouterPath.CountryPicker);
    if (result != null) {
      controller.text = result;
    }
  }

  Widget build(BuildContext context) {
    return Container(
      padding: contentPadding,
      margin: EdgeInsets.only(bottom: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "${sectionTitle}",
              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 8.0),
                height: 35.0,
                child: TextField(
                  controller: controller,
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[300],
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 12.0, horizontal: 12.0),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[500]),
                          borderRadius: BorderRadius.circular(2.0))),
                ),
              ),
              InkWell(
                  child: Container(
                    margin: EdgeInsets.only(top: 8.0),
                    height: 35,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          width: 35.0,
                          margin: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.clear,
                            size: 18.0,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 8.0),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            size: 22.0,
                          ),
                        )
                      ],
                    ),
                  ),
                  onTap: () => {
                        // createOverlay(context)
                        onNationalitySelected(context)
                      })
            ],
          ),
        ],
      ),
    );
  }
}
