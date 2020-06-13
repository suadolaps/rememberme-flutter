import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_me/blocs/authentication/authentication.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/rounded_button.dart';

class ProfileOverview extends StatelessWidget {
  static const String id = 'profile_overview_screen';
  final String pageTitle;

  ProfileOverview({this.pageTitle}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Text(
                    pageTitle,
                    style: kMenuTitleStyle,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                RoundedButton(
                  buttonTitle: 'LOG OUT',
                  onPressed: (){
                    BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut());
                    Navigator.of(context).pushNamed(Onboarding1.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}