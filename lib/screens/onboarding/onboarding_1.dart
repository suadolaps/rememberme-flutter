import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:remember_me/blocs/authentication/authentication.dart';
import 'package:remember_me/repositories/repositories.dart';
import 'package:remember_me/screens/login/login_screen.dart';
import 'package:remember_me/screens/onboarding/onboarding_2.dart';
import 'package:remember_me/blocs/login/login.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';

import 'package:remember_me/widgets/rounded_button.dart';

class Onboarding1 extends StatelessWidget {
  static const String id = 'onboarding_screen_1';
  final UserRepository userRepository;

  Onboarding1({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context){
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
            userRepository: userRepository,
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(
            top: 60.0,
            left: 20.0,
            right: 20.0,
            bottom: 50.0,
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
                      color: kPrimaryBlue,
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
                padding: const EdgeInsets.only(top: 10.0),
                child: Image(
                  image: AssetImage('assets/images/onboarding/onboarding1.png'),
                  fit: BoxFit.fitHeight,
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
                        Navigator.of(context).pushNamed(LoginScreen.id);
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
      ),
    );
  }
}
