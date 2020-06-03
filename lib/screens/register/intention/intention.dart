import 'package:flutter/material.dart';
import 'package:remember_me/screens/register/intention/add_intention.dart';
import 'package:remember_me/screens/register/user_detail.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/rounded_button.dart';

class Intention extends StatelessWidget {
  static const String id = 'intention';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/register/bg-intention.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 40.0,
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'My Intention',
                      style: kLoginTitleStyle.copyWith(
                        fontSize: 36.0,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                    bottom: 30.0,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Beginning a journey towards building a consistent relationship with Allah requires you to make a commitment to yourself and your Rabb.',
                      style: kLoginBodyStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    bottom: 60.0,
                  ),
                  child: Image(
                    image: AssetImage(
                        'assets/images/register/female-intention.png'),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    RoundedButton(
                      buttonTitle: 'ADD',
                      onPressed: () {
                        Navigator.pushNamed(context, AddIntention.id);
                      },
                    ),
                    FlatButton(
                      child: Text(
                        'SKIP'.toUpperCase(),
                        style: kBottomButtonStyle,
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed(UserDetail.id);
                      },
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
