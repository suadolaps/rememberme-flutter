import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:remember_me/screens/onboarding/onboarding_2.dart';
import 'package:remember_me/utilities/constants.dart';

import 'package:remember_me/widgets/rounded_button.dart';

class Onboarding1 extends StatelessWidget {
  static const String id = 'onboarding_screen_1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 80.0,
          left: 20.0,
          right: 20.0,
          bottom: 90.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(
                top: 10.0,
              ),
              child: Text(
                'As-salamu alaykum',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF0D47B8),
                    fontSize: 32,
                    fontWeight: FontWeight.w800),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Text(
                'Congratulations on taking the first step towards building a relationship with Allah',
                style: kOnboardingBodyStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image(
                image: AssetImage(
                    '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/onboarding/onboarding1.png'),
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RoundedButton(
                    buttonTitle: 'LOG IN',
                    onPressed: () {
                      print('Hello');
                    },
                  ),
                  RoundedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(Onboarding2.id);
                    },
                    buttonTitle: 'REGISTER',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
