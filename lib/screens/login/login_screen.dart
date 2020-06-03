import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_me/models/field_error.dart';
import 'package:remember_me/blocs/email/login_screen_bloc.dart';
import 'package:remember_me/blocs/email/login_screen_event.dart';
import 'package:remember_me/blocs/email/login_screen_state.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/widgets/rounded_button.dart';
import 'package:remember_me/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenBloc _bloc;
  String email;
  String _password;
  bool hidePassword = true;
  final _emailController = TextEditingController();

  @override
  void initState() {
    this._bloc = LoginScreenBloc();
    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _bloc.close();
    super.dispose();
  }

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
          child: BlocBuilder<LoginScreenBloc, LoginScreenState>(
            bloc: this._bloc,
            builder: (context, state){
              if (state.isBusy) {
                return CircularProgressIndicator();
              }
              return Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Image(
                      image: AssetImage('assets/images/login/login.png'),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0, left: 20.0),
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
                      left: 20.0,
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
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 15.0,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      controller: this._emailController,
                      style: TextStyle(
                        color: this._hasEmailError(state) ? Colors.red : kPrimaryBlack,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(0.0),
                        hintText: 'Enter your email address',
                        hintStyle: TextStyle(color: this._hasEmailError(state) ? Colors.red : kTertiaryGrey,),
                        labelText: 'Email address',
                        labelStyle: TextStyle(
                          color: this._hasEmailError(state) ? Colors.red : kTertiaryGrey,
                        ),
                        enabledBorder: this._renderBorder(state),
                        focusedBorder: this._renderBorder(state),
                        prefixIcon: Icon(
                          Icons.mail_outline,
                          color: kPrimaryBlue,
                          size: 20.0,
                        ),
                      ),
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                  if (this._hasEmailError(state)) ...[
                    Text(
                      this._emailErrorText(state.emailError),
                      style: TextStyle(color: Colors.red,),
                      textAlign: TextAlign.left,
                    ),
                  ],
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      horizontal: 20.0,
                    ),
                    child: passwordField(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                  ),
                  RoundedButton(
                    buttonTitle: 'LOG IN',
                    onPressed: () => this._bloc.add(LoginScreenEventSubmit(this._emailController.text),),
                  ),
                  FlatButton(
                    child: Text(
                      'Forgot Password'.toUpperCase(),
                      style: kBottomButtonStyle,
                    ),
                    onPressed: () {},
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  bool _hasEmailError(LoginScreenState state) => state.emailError != null;

  UnderlineInputBorder _renderBorder(LoginScreenState state) => UnderlineInputBorder(
    borderSide: BorderSide(
      color: this._hasEmailError(state) ? Colors.red : kPrimaryBlue,
      width: 0.5,
    ),
  );

  String _emailErrorText(FieldError error) {
    switch(error){
      case FieldError.Empty:
        return 'Enter an email address';
      case FieldError.Invalid:
        return 'Invalid email address';
      default:
        return '';
    }
  }




  Widget passwordField() {
    return TextField(
      obscureText: hidePassword,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0.0),
          hintText: 'Password',
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
      onChanged: (value) {
        _password = value;
      },
    );
  }
}
