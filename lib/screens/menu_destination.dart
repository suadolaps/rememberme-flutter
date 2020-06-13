import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:remember_me/screens/theme/theme_overview.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';

class MenuDestination extends StatefulWidget {
  static const String id = 'menu_destination_screen';

  @override
  _MenuDestinationState createState() => _MenuDestinationState();
}

class _MenuDestinationState extends State<MenuDestination> {

  int _selectedIndex = 0;
  final List<Widget> _children = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ThemeOverview(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: kPrimaryBlue,
        unselectedItemColor: kSecondaryGrey,
        selectedLabelStyle: kMenuNameStyle,
        iconSize: 35.0,
        onTap: _onItemTapped,
        items: [
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


      ),

    );
  }
}
