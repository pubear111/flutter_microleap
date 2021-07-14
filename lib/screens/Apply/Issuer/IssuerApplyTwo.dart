import 'package:flutter/material.dart';
import 'package:mircoleap/screens/Apply/Issuer/IssuerApplyTemplate.dart';
import 'Components/IssuerApplyTwoBody.dart';
import '../../../global_components/DismissKeyboardContainer.dart';

class IssuerApplyTwo extends StatefulWidget {
  IssuerApplyTwoState createState() => IssuerApplyTwoState();
}

class IssuerApplyTwoState extends State<IssuerApplyTwo> {
  Widget build(BuildContext context) {
    return DismissKeyboardContainer(
      child: IssuerApplyTemplate(
          child: IssuerApplyTwoBody()
      ),
    );
  }
}