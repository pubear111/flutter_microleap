import 'package:flutter/material.dart';

class InvestorApplicationTextField extends StatelessWidget {
  TextEditingController controller;
  String sectionTitle;
  EdgeInsets contentPadding;

  final textController = TextEditingController();

  InvestorApplicationTextField(
      {this.controller, this.sectionTitle, this.contentPadding});

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
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey[500]),
                      borderRadius: BorderRadius.circular(2.0))),
            ),
          ),
        ],
      ),
    );
  }
}
