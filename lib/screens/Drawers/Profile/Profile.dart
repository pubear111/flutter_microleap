import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/colors.dart';
import '../../../const/variables.dart';
import '../../../global_components/NavigationBar.dart';
import 'Components/ProfileFooter.dart';
import 'Components/ProfileHeader.dart';

class Profile extends StatefulWidget {
  ProfileState createState() => new ProfileState();
}

class ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    _getUser();
  }

  _getUser() async {
    final prefs = await SharedPreferences.getInstance();
    var user = json.decode(prefs.getString('user'));
    Global().uid = user['id'];
    Global().name = user['fullName'];
    Global().email = user['email'];
    Global().leagueRank = user['leagueRank'];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Container(
          color: CustomColors.primaryBackgroundBlue,
          height: size.height,
          width: double.infinity,
        ),
        SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Navigationbar(
                  iconColor: Colors.white,
                  backgroundColor: Colors.transparent,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  "Profile",
                                  style: Theme.of(context).textTheme.headline1,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.mode_edit,
                                      color: Colors.white,
                                    ),
                                  ],
                                )),
                              )
                            ],
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 18.0),
                        ),
                        ProfileHeader(),
                        SizedBox(height: 12.0),
                        ProfileFooter()
                      ],
                    ),
                  ),
                )
              ],
            ))
      ],
    ));
  }
}
