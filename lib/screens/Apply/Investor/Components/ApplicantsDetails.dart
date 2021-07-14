import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mircoleap/const/routerpath.dart';
import 'package:mircoleap/services/rest_api.dart';

import '../../../Selector/Components/SelectorFooter.dart';
import 'InvestorApplicationDropDown.dart';
import 'InvestorApplicationTextField.dart';
import 'RadioButton.dart';

class ApplicantsDetails extends StatefulWidget {
  ApplicantsDetailsState createState() => ApplicantsDetailsState();
}

class ApplicantsDetailsState extends State<ApplicantsDetails> {
  EdgeInsets contentPadding = EdgeInsets.symmetric(horizontal: 12.0);
  List<String> registeringAsArray = ["Individual", "Business"];
  List<String> section2Array = ["Retail", "Sophisticated"];
  List<String> isIslamicAccountArray = ["Yes", "No"];
  List<String> genderArray = ["Male", "Female"];
  final format = DateFormat("yyyy-MM-dd");
  DateTime selectedDate = DateTime.now();

  bool businessRegister = false;
  bool isIslamic = false;
  String gender = 'M';

  final fullNameController = TextEditingController();
  final nationController = TextEditingController();
  final nricNumberController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final dobController = TextEditingController();
  final businessRegisterationNumberController = TextEditingController();
  final businessRegisterationDateController = TextEditingController();

  void onRegisteringAsSelected(int buttonIndex) {
    if (buttonIndex == 1) {
      setState(() {
        businessRegister = true;
      });
    } else {
      setState(() {
        businessRegister = false;
      });
    }
  }

  void onSection2Selected(int buttonIndex) {}

  void onIslamicAccountSelected(int buttonIndex) {
    if (buttonIndex == 1) {
      isIslamic = false;
    } else {
      isIslamic = true;
    }
  }

  void onGenderSelected(int buttonIndex) {
    if (buttonIndex == 1) {
      gender = 'F';
    } else {
      gender = 'M';
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        initialDate: selectedDate,
        lastDate: DateTime(2100));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        dobController.text = format.format(selectedDate);
      });
  }

  void onClickDob() {
    _selectDate(context);
  }

  void onNextTapped() {
    var fullName =
        fullNameController.text != null ? fullNameController.text : 'Malaysia';
    var nation =
        nationController.text != null ? nationController.text : 'Malaysia';
    var nricNumber =
        nricNumberController.text != null ? nricNumberController.text : '';
    var mobileNumber =
        mobileNumberController.text != null ? mobileNumberController.text : '';
    var dob = dobController.text != null ? dobController.text : '';
    var businessRegisterationNumber =
        businessRegisterationNumberController.text != null
            ? businessRegisterationNumberController.text
            : '';
    var businessRegisterationDate =
        businessRegisterationDateController.text != null
            ? businessRegisterationDateController.text
            : '';
    final Map<String, dynamic> body = {
      "status": "new-application",
      "islamic": isIslamic,
      "applicantFullName": fullName,
      "applicantNationality": nation,
      "applicantGender": gender,
      "applicantNricNumber": nricNumber,
      "applicantMobile": mobileNumber,
      "applicantDob": dob,
      "businessRegistrationNumber": businessRegisterationNumber,
      "businessRegistrationDate": businessRegisterationDate
    };
    debugPrint('body =====> $body');
    ApiService.investorApplications(body).then((value) => {
          debugPrint('investorApplications =====> $value'),
          Navigator.pushNamed(context, RouterPath.InvestorInformationToHome)
        });
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        margin: EdgeInsets.only(top: 24.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: contentPadding,
                  child: Row(
                    children: [
                      Container(
                        width: 30.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.blue, width: 3.0),
                        ),
                        child: Center(
                          child: Text(
                            "1",
                            style:
                                TextStyle(fontSize: 12.0, color: Colors.blue),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(width: 18.0),
                      Text("Applicants Details",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                          ))
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(top: 12.0),
                height: 1.0,
                width: size.width,
                color: Colors.grey[400],
              ),
              SizedBox(height: 12.0),
              RadioButton(
                buttonTitle: registeringAsArray,
                containerPadding: this.contentPadding,
                sectionTitle: "Registering As",
                onButtonTapped: this.onRegisteringAsSelected,
                isImportant: false,
              ),
              RadioButton(
                buttonTitle: section2Array,
                containerPadding: this.contentPadding,
                sectionTitle: "*.",
                onButtonTapped: this.onSection2Selected,
                isImportant: true,
              ),
              RadioButton(
                buttonTitle: isIslamicAccountArray,
                containerPadding: this.contentPadding,
                sectionTitle: "Islamic Accounts Only.",
                onButtonTapped: this.onIslamicAccountSelected,
                isImportant: true,
              ),
              InvestorApplicationTextField(
                  controller: fullNameController,
                  sectionTitle: "Full Name as per NRIC / Passport",
                  contentPadding: this.contentPadding),
              InvestorApplicationDropDown(
                controller: nationController,
                sectionTitle: "Nationality",
                contentPadding: this.contentPadding,
              ),
              RadioButton(
                buttonTitle: genderArray,
                containerPadding: this.contentPadding,
                sectionTitle: "Gender",
                onButtonTapped: this.onGenderSelected,
                isImportant: false,
              ),
              InvestorApplicationTextField(
                  controller: nricNumberController,
                  sectionTitle: "NRIC Number",
                  contentPadding: this.contentPadding),
              InvestorApplicationTextField(
                  controller: mobileNumberController,
                  sectionTitle: "Mobile Number",
                  contentPadding: this.contentPadding),
              InkWell(
                onTap: () {
                  _selectDate(context);
                },
                child: Container(
                  padding: contentPadding,
                  margin: EdgeInsets.only(bottom: 18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          "DOB",
                          style: TextStyle(
                              fontSize: 12.0, fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 8.0),
                        height: 35.0,
                        child: TextField(
                          enabled: false,
                          controller: dobController,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[300],
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 12.0, horizontal: 12.0),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey[500]),
                                  borderRadius: BorderRadius.circular(2.0))),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                  visible: businessRegister,
                  child: InvestorApplicationTextField(
                      controller: businessRegisterationNumberController,
                      sectionTitle: "Business Registration Number",
                      contentPadding: this.contentPadding)),
              Visibility(
                  visible: businessRegister,
                  child: InvestorApplicationTextField(
                      controller: businessRegisterationDateController,
                      sectionTitle: "Business Registration Date",
                      contentPadding: this.contentPadding)),
              SizedBox(height: 24),
              SelectorFooter(
                  onNextTapped: onNextTapped, backgroundColor: Colors.white)
            ],
          ),
        ));
  }
}
