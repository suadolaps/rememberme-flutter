import 'package:flutter/material.dart';
import 'package:remember_me/screens/menu/home/home_overview.dart';
import 'package:remember_me/screens/register/user_detail.dart';
import 'package:remember_me/screens/menu/menu_destination.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/rounded_button.dart';
import 'package:remember_me/widgets/top_button.dart';

class VerifyEmail extends StatefulWidget {
  static const String id = 'verify_email_screen';

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  String _verifyCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/register/bg-nearly.png',
              ),
              fit: BoxFit.fitWidth,
              alignment: Alignment.bottomCenter
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TopButton(
                  buttonName: 'BACK',
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetail(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                child: Image(
                  image: AssetImage('assets/images/register/verifymail.png'),
                  fit: BoxFit.fitWidth,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 24.0, left: 20.0),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Verify email',
                    style: kLoginTitleStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 12.0,
                  right: 15.0,
                  left: 20.0,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Enter the 4-digit code we sent to the  email address you provided.',
                    style: kLoginBodyStyle,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical:40.0, horizontal: 30.0),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(0.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: kPrimaryBlue,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 0.5,
                        color: kPrimaryBlue,
                      ),
                    ),
                    ),
                  style: TextStyle(
                    color: kPrimaryBlack,
                    fontSize: 45.0,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 45.0,
                  ),
                  textAlign: TextAlign.center,
                  showCursor: false,
                  textInputAction: TextInputAction.continueAction,
                  onSaved: (value) => _verifyCode = value,
                  ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30.0),
              ),
              RoundedButton(
                buttonTitle: 'CONTINUE',
                onPressed: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return CongratsAlert();
                    }
                  );
                },
              ),
              FlatButton(
                child: Text(
                  'RESEND CODE'.toUpperCase(),
                  style: kBottomButtonStyle,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CongratsAlert extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5.0,
      content:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text('You made it!'.toUpperCase(),
              style: TextStyle(
                  color: kPrimaryBlue,
                  fontSize: 30.0,
                  fontFamily: 'Muli',
                  fontWeight: FontWeight.bold
              ),),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Image(
              image: AssetImage('assets/images/register/confetti.png'),
              fit: BoxFit.fitWidth,
              width: 160.0,
            ),
          ),
          Text(
              'You are on your way towards building a relationship with Allah.',
            style: kLoginBodyStyle,
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Text(
              'Here, you can select a theme you\'d like to begin with. We recommend starting with His Names.',
              style: kLoginBodyStyle,
              textAlign: TextAlign.center,
            ),
          ),

          RoundedButton(
            buttonTitle: 'Let\'s go!'.toUpperCase(),
            onPressed: (){Navigator.of(context).pushNamed(MenuDestination.id);},
          )
        ],
      ),
    );
  }
}
