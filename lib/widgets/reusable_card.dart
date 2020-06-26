import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget cardChild;
  final Function onPress;

  ReusableCard({@required this.colour, @required this.cardChild, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      splashColor: Colors.transparent,
      padding: EdgeInsets.all(0),
      onPressed: onPress,
      child: Container(
        margin: EdgeInsets.only(right:7.5, bottom: 15.0, top: 15.0, left: 7.5,),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: cardChild,
      ),
    );
  }
}
