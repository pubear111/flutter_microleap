import 'package:flutter/material.dart';
import 'Components/IssuerApplyOneBody.dart';
import 'IssuerApplyTemplate.dart';

class IssuerApplyOne extends StatefulWidget {
  IssuerApplyOneState createState() => IssuerApplyOneState();
}

class IssuerApplyOneState extends State<IssuerApplyOne> {

  @override
  Widget build(BuildContext context) {
    return IssuerApplyTemplate(
      child: IssuerApplyOneBody()
    );
  }
}

