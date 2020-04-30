import 'package:flutter/material.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';

class SplashScreen extends StatelessWidget {
  static const String id = 'splash_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        child: GestureDetector(
          child: Text(
            'Remember Me',
            style: TextStyle(
              color: Color(0xFF0D47B8),
              fontFamily: 'Muli',
              fontSize: 45.0,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, Onboarding1.id);
          },
        ),
        alignment: FractionalOffset(0.5, 0.85),
      ),
    );
  }
}
