import 'package:flutter/material.dart';
import 'package:remember_me/utilities/colours.dart';

class Badge extends StatelessWidget {
  final Icon icon;

  Badge({@required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: kSecondaryPink.withOpacity(0.7),
          borderRadius: BorderRadius.circular(20.0,)
      ),
      child: icon,
    );
  }
}