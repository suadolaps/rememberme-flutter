import 'package:flutter/material.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/widgets/rounded_button.dart';
import 'package:remember_me/utilities/constants.dart';

class LoginScreen extends StatelessWidget {
  static const String id = 'login_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20.0,
          vertical: 20.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/register/bg-nearly.png',
              ),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: FlatButton(
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: kPrimaryBlue,
                          size: 16.0,
                        ),
                        Text(
                          'BACK',
                          style: kTopButtonStyle,
                          textAlign: TextAlign.left,
                        ),
                      ],
                    ),
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding1(),
                        ),
                      );
                    },
                  ),
                ),
                Image(
                  image: AssetImage('assets/images/login/login.png'),
                  fit: BoxFit.fitWidth,
                  height: 160.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Welcome back',
                      style: kLoginTitleStyle,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12.0,
                    right: 15.0,
                  ),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Enter your email address and password to sign in and continue on your journey.',
                      style: kLoginBodyStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 25.0,
                    bottom: 15.0,
                  ),
                  child: emailField(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: passwordField(),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30.0),
                ),
                RoundedButton(
                  buttonTitle: 'LOG IN',
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text(
                    'Forgot Password'.toUpperCase(),
                    style: kBottomButtonStyle,
                  ),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        hintText: 'Enter your email address',
        labelText: 'Email address',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryBlue,
            width: 0.5,
          ),
        ),
        prefixIcon: Icon(
          Icons.mail_outline,
          color: kPrimaryBlue,
          size: 20.0,
        ),
      ),
    );
  }

  Widget passwordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        hintText: 'Password',
        labelText: 'Password',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            width: 0.5,
            color: kPrimaryBlue,
          ),
        ),
        prefixIcon: Icon(
          Icons.lock_outline,
          color: kPrimaryBlue,
          size: 20.0,
        ),
      ),
    );
  }
}
