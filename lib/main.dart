import 'package:flutter/material.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/screens/onboarding/onboarding_2.dart';
import 'package:remember_me/screens/register/genderselect_page.dart';
import 'package:remember_me/screens/splash_page.dart';

void main() => runApp(RememberMe());

class RememberMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Muli',
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Onboarding1.id: (context) => Onboarding1(),
        Onboarding2.id: (context) => Onboarding2(),
        GenderSelect.id: (context) => GenderSelect(),
      },
    );
  }
}
