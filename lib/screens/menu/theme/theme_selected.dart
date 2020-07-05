import 'package:flutter/material.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/widgets.dart';

class ThemeSelected extends StatelessWidget {
  static const String id = 'theme_selected_screen';

  final String themeName;
  final Image themeIcon;
  final String bodyText;
  final String bodyCaption;
  final Function onPressed;

  ThemeSelected({@required this.themeName, @required this.themeIcon,
    @required this.bodyText, @required this.bodyCaption, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 15.0, left: 15.0),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/themes/theme-bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TopButton(
                      buttonName: 'BACK',
                      onPressed: () {
                        Navigator.pop(context);
                      }
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    themeName,
                    style: kMenuTitleStyle.copyWith(
                        fontWeight: FontWeight.w800
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: themeIcon,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 20.0, left: 40.0, right: 40.0, bottom: 20.0),
                      child: Text(
                        bodyText,
                        style: kThemeBodyStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      child: Text(
                        bodyCaption,
                        style: kThemeCaptionStyle,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 40.0),
                      child: RoundedButton(
                        buttonTitle: 'BEGIN',
                        onPressed: onPressed,
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
