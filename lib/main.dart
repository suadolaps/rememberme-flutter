import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_me/blocs/authentication/authentication.dart';
import 'package:remember_me/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:remember_me/blocs/login/login.dart';
import 'package:remember_me/blocs/themes/theme.dart';
import 'package:remember_me/repositories/api/theme_api_client.dart';
import 'package:remember_me/repositories/repositories.dart';
import 'package:remember_me/simple_bloc_delegate.dart';
import 'screens/screens.dart'; 

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(BlocProvider<AuthenticationBloc>(
    create: (context) {
      return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
    },
      child: RememberMe(userRepository: userRepository),),);
}

class RememberMe extends StatelessWidget {
  final UserRepository userRepository;
  final ThemeRepository themeRepository = ThemeRepository(
    themeApiClient: ThemeApiClient(
      httpClient: http.Client(),
    ),
  );

  RememberMe({Key key, @required this.userRepository}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Muli',
      ),
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationSuccess) {
            print('hi!');
          }
          if (state is AuthenticationFailure) {
            return Onboarding1(userRepository: userRepository,);
          }
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }
          return SplashScreen();
        },
      ),
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Onboarding1.id: (context) => Onboarding1(userRepository: userRepository,),
        Onboarding2.id: (context) => Onboarding2(),
        GenderSelect.id: (context) => GenderSelect(),
        LoginScreen.id: (context) => BlocProvider(
          create: (context) => LoginBloc(
            userRepository: userRepository,
            authenticationBloc: BlocProvider.of<AuthenticationBloc>(context),
          ),
            child: LoginScreen(),),
        NameInput.id: (context) => NameInput(),
        JourneyStart.id: (context) => JourneyStart(),
        Intention.id: (context) => Intention(),
        AddIntention.id: (context) => AddIntention(),
        UserDetail.id: (context) => UserDetail(),
        VerifyEmail.id: (context) => VerifyEmail(),
        MenuDestination.id: (context) => BlocProvider(
            create: (context) => BottomNavigationBloc(
              homeRepository: HomeRepository(),
              themeRepository: ThemeRepository(),
              journalRepository: JournalRepository(),
              profileRepository: ProfileRepository(),
              favouritesRepository: FavouritesRepository(),
            ),
            child: MenuDestination(),),
        HomeOverview.id: (context) => HomeOverview(),
        ThemeOverview.id: (context) => BlocProvider(
          create: (context) => ThemeBloc(
            themeRepository: themeRepository,
          ),
          child: ThemeOverview(),),
        FavouritesOverview.id: (context) => FavouritesOverview(),
        ProfileOverview.id: (context) => ProfileOverview(),
        JournalOverview.id: (context) => JournalOverview(),
      },
    );
  }
}

