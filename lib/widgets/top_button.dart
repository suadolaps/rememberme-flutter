import 'package:flutter/material.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';

class TopButton extends StatelessWidget {
  final Function onPressed;
  final String buttonName;

  TopButton({@required this.onPressed, @required this.buttonName});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Row(
        children: <Widget>[
          Icon(
            Icons.arrow_back_ios,
            color: kPrimaryBlue,
            size: 16.0,
          ),
          Text(
            buttonName,
            style: kTopButtonStyle,
            textAlign: TextAlign.left,
          ),
        ],
      ),
      onPressed: onPressed,
    );
  }
}