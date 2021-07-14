import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {

  List<String> buttonTitle;
  EdgeInsets containerPadding;
  Function(int) onButtonTapped;
  String sectionTitle;
  bool isImportant;

  RadioButton({
    this.buttonTitle,
    this.onButtonTapped,
    this.containerPadding,
    this.isImportant,
    @required this.sectionTitle,
  }): assert(sectionTitle != null);

  RadioButtonState createState() => RadioButtonState();
}

class RadioButtonState extends State<RadioButton> {

  int selectedButtonID = 0;

  void onButtonSelect(int index) {
    this.setState(() {
      selectedButtonID = index;
    });
    this.widget.onButtonTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: widget.containerPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              children: [
                Text(
                  "${widget.sectionTitle}",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500
                  ),
                ),
                Visibility(
                  visible: widget.isImportant,
                  child: Container(
                    margin: EdgeInsets.only(left: 4.0),
                    child: Icon(
                      Icons.assignment_late_rounded,
                      size: 13.0,
                    ),
                  )
                )
              ],
            )
          ),
          Container(
            height: 60.0,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.buttonTitle.length,
                itemBuilder: (BuildContext context, int index) {
                  return Wrap(
                    children: [
                      FlatButton(
                        color: selectedButtonID == index ? Colors.white : Colors.grey[200],
                        shape: RoundedRectangleBorder(
                          side: BorderSide(
                              color: selectedButtonID == index ? Colors.blue : Colors.grey[400],
                              width: 1.5,
                              style: BorderStyle.solid
                          ),
                        ),
                        onPressed: () => {
                          onButtonSelect(index)
                        },
                        child: Text(
                          "${widget.buttonTitle[index]}",
                          style: TextStyle(
                              fontSize: 12.0
                          ),
                        ),
                      )
                    ],
                  );
                }
            ),
          )
        ],
      ),
    );
  }
}