import 'package:flutter/material.dart';
import 'package:remember_me/utilities/colours.dart';

class ProfileSubMenu extends StatelessWidget {
  final String menuTitle;
  final Function onPressed;
  final Icon icon;

  ProfileSubMenu({@required this.menuTitle, @required this.onPressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
      child: FlatButton(
        padding: EdgeInsets.all(0),
        splashColor: Colors.transparent,
        highlightColor: kTertiaryBlue.withOpacity(0.7),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: Container(
                decoration: BoxDecoration(
                  color: kTertiaryBlue.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                padding: EdgeInsets.all(10.0),
                child: icon,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 60.0),
              child: Text(
                menuTitle,
                style: TextStyle(
                  color: kPrimaryBlack,
                  fontSize: 19.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}