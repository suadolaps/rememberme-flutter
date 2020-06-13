import 'package:flutter/material.dart';

class FavouritesOverview extends StatelessWidget {
  static const String id = 'favourites_overview_screen';
  final String text;

  FavouritesOverview({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Text('My text is: $text'),
      ),
    );
  }
}