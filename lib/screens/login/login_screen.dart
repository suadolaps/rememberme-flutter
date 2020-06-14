import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_me/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:remember_me/blocs/login/login.dart';
import 'package:remember_me/repositories/favourites_repository.dart';
import 'package:remember_me/repositories/home_repository.dart';
import 'package:remember_me/repositories/journal_repository.dart';
import 'package:remember_me/repositories/models/field_error.dart';
import 'package:remember_me/blocs/email/login_screen.dart';
import 'package:remember_me/repositories/profile_repository.dart';
import 'package:remember_me/repositories/repositories.dart';
import 'package:remember_me/screens/screens.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/widgets/rounded_button.dart';
import 'package:remember_me/widgets/top_button.dart';
import 'package:remember_me/utilities/constants.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginScreenBloc _bloc;
  String email;
  bool hidePassword = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void initState() {
    this._bloc = LoginScreenBloc();
    super.initState();
  }


  void _togglePasswordVisibility() {
    setState(() {
      hidePassword = !hidePassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _emailController.text,
          password: _passwordController.text,
        ),
      );

    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(SnackBar(
            content: Text('${state.error}'),
            backgroundColor: Colors.redAccent,
          ),);
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
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
                          child: TopButton(
                              buttonName: 'BACK',
                              onPressed: () {
                                Navigator.pop(context);
                              }
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
                            autocorrect: false,
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
                          onPressed: () {
                            this._bloc.add(LoginScreenEventSubmit(this._emailController.text),);
                            state is! LoginInProgress ? _onLoginButtonPressed() : null;
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => BlocProvider<BottomNavigationBloc>(
                                  create: (context) {
                                    return BottomNavigationBloc(homeRepository: HomeRepository(),
                                      journalRepository: JournalRepository(),
                                    favouritesRepository: FavouritesRepository(),
                                    profileRepository: ProfileRepository(),
                                    themeRepository: ThemeRepository())
                                      ..add(PageTapped(index: 2));
                                  },
                                  child: MenuDestination(),
                                ),),
                            );
                          },
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
        },
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
      autocorrect: false,
      controller: _passwordController,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _bloc.close();
    super.dispose();
  }
}


