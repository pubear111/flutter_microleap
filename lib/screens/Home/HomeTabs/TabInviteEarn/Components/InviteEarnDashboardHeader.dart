import 'package:flutter/material.dart';
import '../../../../../const/colors.dart';
import 'package:email_validator/email_validator.dart';

class InviteEarnDashboardHeader extends StatefulWidget {
  InviteEarnDashboardHeaderState createState() => new InviteEarnDashboardHeaderState();
}

class InviteEarnDashboardHeaderState extends State<InviteEarnDashboardHeader> {

  bool isValidEmailAddress;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isValidEmailAddress = false;
  }

  void emailTextFieldOnChange(String text) {
    bool isValid = false;

    if(text.isEmpty) {
      isValid = false;
    } else {
      isValid = EmailValidator.validate(text);
    }

    setState(() {
      isValidEmailAddress = isValid;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      // height: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white
        ),
        child: Column(
          children: [
            Container(
                width: double.infinity,
                height: 50.0,
                child:  Center(
                  child: Text(
                    "Invite & Earn",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                )
            ),
            Container(
                width: double.infinity,
                // height: 50.0,
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                child:  Center(
                  child: Text(
                    "Invite users to microLEAP and enjoy free credits ! Invite your friends today and when they are approved, you'll earn RM 10 worth of microLEAP credits",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: CustomColors.primaryBackgroundBlack
                    ),
                  ),
                )
            ),
            Container(
              // height: 60.0,
              margin: EdgeInsets.only(left: 12.0, right: 12.0, bottom: 18.0, top: 24.0),
              padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 12.0),
              decoration: BoxDecoration(
                color: CustomColors.textFieldContainer,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      "Enter Email",
                      style: TextStyle(
                        color: CustomColors.textFieldTitle,
                        fontSize: 13.0
                      ),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                      // border: InputBorder.none,
                        hintText: 'Email',
                        border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.lightGreen
                            )
                        ),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.green
                            )
                        ),
                        suffixIcon: isValidEmailAddress ? Icon(
                          Icons.check_circle,
                          color: Colors.green,
                        ) : null
                    ),
                    onChanged: (text) {
                      emailTextFieldOnChange(text);
                    },
                  ),
                ],
              )
            )
          ],
        ),
      ),
    );
  }
}
