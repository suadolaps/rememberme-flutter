import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/screens/register/intention/intention.dart';
import 'package:remember_me/screens/register/verify_email.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/widgets/rounded_button.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/top_button.dart';

class UserDetail extends StatefulWidget {
  static const String id = 'user_detail_screen';
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  final _formKey = GlobalKey<FormState>();
  String _email;
  String _password;
  bool hidePassword = true;

  void _togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

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
                alignment: Alignment.bottomCenter,
            ),
          ),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                TopButton(
                  buttonName: 'BACK',
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Intention(),
                      ),
                    );
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 10.0,),
                  child: Image(
                    image: AssetImage('assets/images/register/female-nearly.png'),
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24.0, left: 20.0),
                  child: Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Nearly there...',
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
                      'Thank you for staying with us this far Sumayya. To keep your entries secure and track your progress, please create an account.',
                      style: kLoginBodyStyle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,),
                  child: emailInput(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,),
                  child: passwordInput(),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 15.0,),
                  child: passwordInput()
                ),
                Container(
                  margin: EdgeInsets.only(top: 15.0),
                ),
                RoundedButton(
                  buttonTitle: 'SIGN UP',
                  onPressed: () {
                    if(_formKey.currentState.validate()){
                      _formKey.currentState.save();
                    }
                    Navigator.of(context).pushNamed(VerifyEmail.id);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget emailInput() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        hintText: 'Enter your email address',
        labelText: 'Email address',
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
        prefixIcon: Icon(
          Icons.mail_outline,
          color: kPrimaryBlue,
          size: 20.0,
        ),
      ),
      textInputAction: TextInputAction.next,
      validator: (email) => EmailValidator.validate(email) ? null: "Invalid email address",
      onSaved: (email) => _email = email,
    );
  }

  Widget passwordInput() {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: hidePassword,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        hintText: 'Enter your password',
        labelText: 'Password',
        labelStyle: TextStyle(
          color: kTertiaryGrey,
        ),
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
        suffixIcon: GestureDetector(
          onTap: () {
            _togglePasswordVisibility();
          },
          child: Icon(
            hidePassword ? Icons.visibility_off : Icons.visibility,
            color: hidePassword ? kSecondaryGrey : kPrimaryBlue,
            size: 20.0,
          ),
        ),),
      textInputAction: TextInputAction.done,
      validator: (password){
        Pattern pattern =  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
        RegExp regex = new RegExp(pattern);
        if (!regex.hasMatch(password))
          return 'Invalid password';
        else
          return null;
      },
      onSaved: (password) => _password = password,
    );
  }
}

