import 'package:flutter/material.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/utilities/colours.dart';

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
        Image(
          image: themeIcon,
          fit: BoxFit.fitWidth,
          width: 150.0,
          color: Colors.red,
          colorBlendMode: BlendMode.multiply,
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