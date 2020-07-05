import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:remember_me/blocs/bottom_navigation/bottom_navigation.dart';
import 'package:remember_me/screens/menu/menu.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';

class MenuDestination extends StatelessWidget {
  static const String id = 'menu_destination_screen';


  @override
  Widget build(BuildContext context) {
    final BottomNavigationBloc bottomNavigationBloc =
      BlocProvider.of<BottomNavigationBloc>(context);

    return BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
      bloc: bottomNavigationBloc,
      builder: (context, BottomNavigationState state) {
        return Scaffold(
          body: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state){
              if (state is PageLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ThemeOverviewLoaded){
                return ThemeOverview(pageTitle: state.text);
              }
              if (state is HomeOverviewLoaded){
                return HomeOverview(number: state.number);
              }
              if (state is JournalOverviewLoaded) {
                return JournalOverview(pageTitle: state.text);
              }
              if (state is FavouritesOverviewLoaded) {
                return FavouritesOverview(text: state.text,);
              }
              if (state is ProfileOverviewLoaded) {
                return ProfileOverview(pageTitle: state.text,);
              }
              return Container();
            },
          ),
          bottomNavigationBar: BlocBuilder<BottomNavigationBloc, BottomNavigationState>(
            builder: (context, state) {
              return BottomNavigationBar(
                currentIndex: bottomNavigationBloc.currentIndex,
                selectedItemColor: kPrimaryBlue,
                unselectedItemColor: kSecondaryGrey,
                selectedLabelStyle: kMenuNameStyle,
                iconSize: 35.0,
                onTap: (index) => bottomNavigationBloc.add(PageTapped(index: index)),
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps,
                    ),
                    title: Text('Themes',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book,
                    ),
                    title: Text('Journal',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.circle_filled,
                    ),
                    title: Text('Home',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite,
                    ),
                    title: Text('Favourites',
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person,
                    ),
                    title: Text('Profile',
                    ),
                  ),
                ],


              );
            },
          ),
        );
      },
    );
  }
}
