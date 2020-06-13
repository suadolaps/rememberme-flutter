import 'package:flutter/material.dart';

class HomeOverview extends StatelessWidget {
  static const String id = 'home_overview_screen';
  final int number;

  HomeOverview({this.number}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      body: Center(
        child: Text('My number is: $number'),
      ),
    );
  }
}

