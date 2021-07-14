import 'package:flutter/material.dart';
import 'package:mircoleap/model/Country.dart';
import 'DismissKeyboardContainer.dart';

class CountryPicker extends StatefulWidget {
  final Function(String) onNationalitySelected;

  CountryPicker({this.onNationalitySelected});

  CountryPickerState createState() => CountryPickerState();
}

class CountryPickerState extends State<CountryPicker> {

  List<Country> country = List.from(Country.ALL);
  List<Country> filteredCountry;

  initState() {
    country.sort((a, b) => a.name.compareTo(b.name));
    filteredCountry = country;
  }

  onSearchtextChanged(String text) {
    filteredCountry.clear();
    if(text.isEmpty) {
      filteredCountry = List.from(Country.ALL);
      filteredCountry.sort((a, b) => a.name.compareTo(b.name));
      setState(() {});
      return;
    }

    List.from(Country.ALL).forEach((element) {
      if(element.name.toString().toLowerCase().contains(text)) {
        filteredCountry.add(element);
      }
    });
    setState(() {});
  }
  
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DismissKeyboardContainer(
      child: Scaffold(
          backgroundColor: Color.fromRGBO(105, 105, 105, 0.8),
          body: Container(
              child: SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Container(
                  height: size.height - 192,
                  margin: EdgeInsets.symmetric(horizontal: 36, vertical: 96),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 8.0, bottom: 4.0),
                          height: 20.0,
                          child: IconButton(
                            onPressed: () => {
                              Navigator.pop(context)
                            },
                            icon: Icon(
                                Icons.clear
                            ),
                          ),
                        ),
                        Container(
                          height: 35.0,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 14.0,
                            ),
                            decoration: InputDecoration(
                              hintText: "Find Country",
                              contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                            ),
                            onChanged: onSearchtextChanged,
                          ),
                        ),
                        Container(
                            child: Expanded(
                              child: countryListBuilder()
                            )
                        )
                      ],
                    ),
                  ),
                ),
              )
          )
      ),
    );
  }

  Widget countryListBuilder() {
    return SingleChildScrollView(
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: filteredCountry.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              child: Container(
                height: 40.0,
                child: Text(
                    "${filteredCountry[index].name}"
                ),
              ),
              onTap: () {
                String selectedCountryName = filteredCountry[index].name;
                Navigator.pop(context, selectedCountryName);
              },
            );
          },
        )
    );
  }
}