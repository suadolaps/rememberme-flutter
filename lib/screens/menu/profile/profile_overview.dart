import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:remember_me/blocs/authentication/authentication.dart';
import 'package:remember_me/screens/menu/profile/settings/settings_overview.dart';
import 'package:remember_me/screens/onboarding/onboarding_1.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/widgets.dart';

class ProfileOverview extends StatelessWidget {
  static const String id = 'profile_overview_screen';
  final String pageTitle;
  final int _levelNumber = 5;
  final String _levelDescription = 'Zen Master';

  ProfileOverview({this.pageTitle}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Container(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    splashColor: Colors.transparent,
                    highlightColor: kTertiaryBlue.withOpacity(0.6),
                    onPressed: () {
                      BlocProvider.of<AuthenticationBloc>(context).add(AuthenticationLoggedOut());
                      Navigator.of(context).pushNamed(Onboarding1.id);
                    },
                    child: Text(
                      'LOG OUT',
                      style: kTopButtonStyle.copyWith(
                        fontSize: 19,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.blueGrey,
                      child: Text('SA'),
                      radius: 44,
                    ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    pageTitle,
                    style: kProfileNameStyle,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Container(

                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: kSecondaryGreen,
                ),
                margin: EdgeInsets.symmetric(horizontal: 70),
                padding: EdgeInsets.all(8.0),
                alignment: Alignment.center,
                child: Text(
                  'Level $_levelNumber: $_levelDescription',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: kSecondaryWhite,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 40.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Badge(
                      icon: Icon(
                        Icons.all_inclusive,
                        size: 35.0,
                      ),
                    ),
                    Badge(
                      icon: Icon(
                        Icons.album,
                        size: 35.0,
                      ),
                    ),
                    Badge(
                      icon: Icon(
                        Icons.color_lens,
                        size: 35.0,
                      ),
                    ),
                  ],
                ),
              ),
              Column(children: <Widget>[
                ProfileSubMenu(
                  menuTitle: 'Achievements',
                  onPressed: (){},
                  icon: Icon(Icons.star,
                    color: kPrimaryBlue,
                    size: 30.0,),
                ),
                ProfileSubMenu(
                  menuTitle: 'Buddies',
                  onPressed: (){},
                  icon: Icon(Icons.people,
                    color: kPrimaryBlue,
                    size: 30.0,),
                ),
                ProfileSubMenu(
                  menuTitle: 'Letters to Allah',
                  onPressed: (){},
                  icon: Icon(Icons.folder_special,
                    color: kPrimaryBlue,
                    size: 30.0,),
                ),
                ProfileSubMenu(
                  menuTitle: 'My Intention',
                  onPressed: (){},
                  icon: Icon(CupertinoIcons.pen,
                    color: kPrimaryBlue,
                    size: 30.0,),
                ),
                ProfileSubMenu(
                  menuTitle: 'Settings',
                  onPressed: (){
                    Navigator.of(context)
                        .pushNamed(SettingsOverview.id);
                  },
                  icon: Icon(Icons.settings,
                    color: kPrimaryBlue,
                    size: 30.0,),
                ),
              ],),
            ],
          ),
        ),
      ),
    );
  }
}



