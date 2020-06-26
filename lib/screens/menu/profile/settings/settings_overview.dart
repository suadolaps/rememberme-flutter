import 'package:flutter/material.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/widgets.dart';

class SettingsOverview extends StatelessWidget {
  static const String id = 'settings_overview_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TopButton(
                      buttonName: 'BACK',
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'Settings',
                    style: kMenuTitleStyle.copyWith(
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
