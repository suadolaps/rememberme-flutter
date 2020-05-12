import 'package:flutter/material.dart';
import 'package:remember_me/utilities/colours.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({@required this.buttonTitle, @required this.onPressed});

  final Function onPressed;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: kPrimaryBlue,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          minWidth: 150.0,
          height: 42.0,
          child: Text(
            buttonTitle,
            style: TextStyle(
              color: kSecondaryWhite,
              fontWeight: FontWeight.w800,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
