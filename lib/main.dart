import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_me/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:remember_me/repositories/home_repository.dart';
import 'package:remember_me/repositories/repositories.dart';
import 'package:remember_me/screens/menu/home/home_overview.dart';
import 'package:remember_me/screens/login/login_screen.dart';
import 'package:remember_me/screens/menu/menu.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/screens/onboarding/onboarding_2.dart';
import 'package:remember_me/screens/register/genderselect_page.dart';
import 'package:remember_me/screens/register/intention/add_intention.dart';
import 'package:remember_me/screens/register/intention/intention.dart';
import 'package:remember_me/screens/register/journey_start.dart';
import 'package:remember_me/screens/register/name_input_page.dart';
import 'package:remember_me/screens/register/user_detail.dart';
import 'package:remember_me/screens/register/verify_email.dart';
import 'package:remember_me/screens/splash_page.dart';
import 'package:remember_me/screens/menu/menu_destination.dart';
import 'package:remember_me/screens/menu/theme/theme_overview.dart';


class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }
}

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  runApp(RememberMe());
}

class RememberMe extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Muli',
      ),
      initialRoute: SplashScreen.id,
      routes: {
        SplashScreen.id: (context) => SplashScreen(),
        Onboarding1.id: (context) => Onboarding1(),
        Onboarding2.id: (context) => Onboarding2(),
        GenderSelect.id: (context) => GenderSelect(),
        LoginScreen.id: (context) => LoginScreen(),
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
        ThemeOverview.id: (context) => ThemeOverview(),
        FavouritesOverview.id: (context) => FavouritesOverview(),
        ProfileOverview.id: (context) => ProfileOverview(),
        JournalOverview.id: (context) => JournalOverview(),
      },
    );
  }
}

