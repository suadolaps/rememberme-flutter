import 'package:flutter/material.dart';

class ProfileOverview extends StatelessWidget {
  static const String id = 'profile_overview_screen';
  final String text;

  ProfileOverview({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center (
        child: Text('My text is: $text'),
      ),
    );
  }
}