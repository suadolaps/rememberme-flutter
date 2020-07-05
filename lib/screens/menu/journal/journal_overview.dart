import 'package:flutter/material.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';

class JournalOverview extends StatelessWidget {
  static const String id = 'journal_overview_screen';
  final String pageTitle;

  JournalOverview({this.pageTitle}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only( bottom: 20.0, left: 30.0, right: 10.0),
          child: Container (
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/journal/journal-bg.png'),
                fit: BoxFit.fitWidth,
              ),
            ),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  alignment: Alignment.topRight,
                  child: FlatButton(
                    onPressed: (){},
                    child: Icon(
                      Icons.calendar_today,
                      color: kPrimaryBlue,
                    ),
                  ),
                ),
                Text(
                  pageTitle,
                style: kMenuTitleStyle,),
                Container(),
                Container(),
                Container(
                  decoration: BoxDecoration(
                    color: kSecondaryGreen,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [BoxShadow(
                      color: kSecondaryGrey.withOpacity(0.7),
                      spreadRadius: 4,
                      blurRadius: 5,
                      offset: Offset(2, 5), // changes position of shadow
                    ),],
                  ),
                  margin: EdgeInsets.only(
                    top: 20.0,
                    right: 20.0
                  ),
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Reflect',
                          style: TextStyle(
                            color: kSecondaryWhite,
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0,),
                        child: Text(
                          'When was the last time you sought forgiveness from Allah?',
                          style: TextStyle(
                            color: kSecondaryWhite,
                            height: 1.75,
                            fontSize: 20.0
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
