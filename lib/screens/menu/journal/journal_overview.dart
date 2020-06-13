import 'package:flutter/material.dart';

class JournalOverview extends StatelessWidget {
  static const String id = 'journal_overview_screen';
  final String text;

  JournalOverview({this.text}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center (
        child: Text('My text is: $text'),
      ),
    );
  }
}
