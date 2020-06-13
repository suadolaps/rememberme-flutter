import 'package:flutter/material.dart';
import 'package:remember_me/screens/home/home_overview.dart';
import 'package:remember_me/screens/login/login_screen.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/screens/onboarding/onboarding_2.dart';
import 'package:remember_me/screens/register/genderselect_page.dart';
import 'package:remember_me/screens/register/intention/add_intention.dart';
import 'package:remember_me/screens/register/intention/intention.dart';
import 'package:remember_me/screens/register/journey_start.dart';
import 'package:remember_me/screens/register/name_input_page.dart';
import 'package:remember_me/screens/register/user_detail.dart';
import 'package:remember_me/screens/register/verify_email.dart';
import 'package:remember_me/screens/splash_page.dart';
import 'package:remember_me/screens/menu_destination.dart';
import 'package:remember_me/screens/theme/theme_overview.dart';

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
        LoginScreen.id: (context) => LoginScreen(),
        NameInput.id: (context) => NameInput(),
        JourneyStart.id: (context) => JourneyStart(),
        Intention.id: (context) => Intention(),
        AddIntention.id: (context) => AddIntention(),
        UserDetail.id: (context) => UserDetail(),
        VerifyEmail.id: (context) => VerifyEmail(),
        MenuDestination.id: (context) => MenuDestination(),
        HomeOverview.id: (context) => HomeOverview(),
        ThemeOverview.id: (context) => ThemeOverview(),
      },
    );
  }
}
