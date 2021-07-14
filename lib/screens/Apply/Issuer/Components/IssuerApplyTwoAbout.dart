import 'package:flutter/material.dart';

class IssuerApplyTwoAbout extends StatefulWidget {
  IssuerApplyTwoAboutState createState() => IssuerApplyTwoAboutState();
}

class IssuerApplyTwoAboutState extends State<IssuerApplyTwoAbout> {
  bool confirmChecked = false;
  bool isApplyingAsGroup = true;

  void onPurposeTextFieldChange(String text) {
  }

  void onAboutBusinessChange(String text) {}

  void onConfirmCheckBoxTap() {
    setState(() {
      confirmChecked = !confirmChecked;
    });
  }

  void onApplyingAsGroupYesTap() {
    setState(() {
      isApplyingAsGroup = true;
    });
  }

  void onApplyingAsGroupNoTap() {
    setState(() {
      isApplyingAsGroup = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 48.0),
      padding: EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "Tell us a bit about your business",
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 8.0),
          Container(
            child: underlinedTextField(
                onPurposeTextFieldChange, "Purpose of Funds"),
          ),
          Container(
              margin: EdgeInsets.only(top: 14.0),
              child: Row(
                children: [
                  customCheckBox(
                      this.onConfirmCheckBoxTap, this.confirmChecked),
                  SizedBox(width: 12.0),
                  Flexible(
                    child: Text(
                      "I confirm that I am not hosted on any other P2P platforms for the same purpose.",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                    ),
                  )
                ],
              )),
          const SizedBox(height: 16.0),
          Container(
            child:
                underlinedTextField(onPurposeTextFieldChange, "What do you do"),
          ),
          groupApplicationYesNo(),
        ],
      ),
    );
  }

  Widget underlinedTextField(Function(String) onChange, String hint) {
    return TextField(
      decoration: InputDecoration(
        // border: InputBorder.none,
        hintText: '${hint}',
        border: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.lightGreen)),
        focusedBorder:
            UnderlineInputBorder(borderSide: BorderSide(color: Colors.green)),
      ),
      onChanged: (text) {
        onChange(text);
      },
    );
  }

  Widget groupApplicationYesNo() {
    return Container(
      margin: EdgeInsets.only(top: 36.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
              text: TextSpan(
                  style: DefaultTextStyle.of(context).style,
                  children: <TextSpan>[
                TextSpan(
                    text: "Are you applying as part of a ",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "group",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500)),
                TextSpan(
                    text: "?",
                    style:
                        TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
              ])),
          Container(
              margin: EdgeInsets.only(top: 14.0),
              child: Row(
                children: [
                  customCheckBox(
                      this.onApplyingAsGroupYesTap, this.isApplyingAsGroup),
                  SizedBox(width: 12.0),
                  Flexible(
                    child: Text(
                      "Yes",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                    ),
                  )
                ],
              )),
          Container(
              margin: EdgeInsets.only(top: 14.0),
              child: Row(
                children: [
                  customCheckBox(
                      this.onApplyingAsGroupNoTap, !this.isApplyingAsGroup),
                  SizedBox(width: 12.0),
                  Flexible(
                    child: Text(
                      "No",
                      style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }

  Widget customCheckBox(Function() onCheckBoxTap, bool checkedValue) {
    return InkWell(
      child: Container(
        width: 20.0,
        height: 20.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: Colors.grey[800], width: 1.5),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 1.0, vertical: 1.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5),
              border: Border.all(color: Colors.white, width: 2.0),
              color: checkedValue ? Colors.green : Colors.transparent),
        ),
      ),
      onTap: () {
        onCheckBoxTap();
      },
    );
  }
}
