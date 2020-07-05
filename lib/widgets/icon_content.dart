import 'package:flutter/material.dart';
import 'package:remember_me/utilities/constants.dart';

class IconContent extends StatelessWidget {
  final AssetImage themeIcon;
  final String themeName;
  final Color colour;

  IconContent({@required this.themeIcon, @required this.themeName, @required this.colour});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          alignment: Alignment.center,
          width: 150.0,
          height: 140.0,
          child: Image(
            image: themeIcon,
            fit: BoxFit.contain,
            height: 120.0,
            alignment: Alignment.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom:8.0,),
          child: Text(themeName,
            style: kCardLabelStyle.copyWith(
                color: colour,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}