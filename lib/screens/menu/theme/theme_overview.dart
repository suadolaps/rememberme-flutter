import 'package:flutter/material.dart';
import 'package:remember_me/widgets/icon_content.dart';
import 'package:remember_me/widgets/reusable_card.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';

class ThemeOverview extends StatelessWidget {
  static const String id = 'theme_overview_screen';

  final String pageTitle;

  ThemeOverview({this.pageTitle}) : super();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
          child: Container(
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Container(
                  child: Text(
                    pageTitle,
                    style: kMenuTitleStyle,
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Container(
                  child: Text(
                    'Choose a theme to begin your journey',
                    style: kLoginBodyStyle.copyWith(
                      color: kSecondaryGrey,
                    ),
                  ),
                  alignment: Alignment.centerLeft,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ReusableCard(
                      cardChild: IconContent(
                        themeIcon: AssetImage(
                            'assets/images/themes/his-names.png'),
                        themeName: 'His Names',
                        colour: kSecondaryWhite,
                      ),
                      colour: kSecondaryGreen,
                      onPress: () {},
                    ),
                    ReusableCard(
                      cardChild: IconContent(
                        themeIcon: AssetImage(
                            'assets/images/themes/forgive.png'),
                        themeName: 'Forgiveness \n& \n Repentance',
                        colour: kSecondaryWhite,
                      ),
                      colour: kSecondaryGreen,
                      onPress: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ReusableCard(
                      cardChild: IconContent(
                        themeIcon: AssetImage(
                            'assets/images/themes/prayer.png'),
                        themeName: 'Prayer',
                        colour: kPrimaryBlack,
                      ),
                      colour: kSecondaryPink,
                      onPress: () {},
                    ),
                    ReusableCard(
                      cardChild: IconContent(
                        themeIcon: AssetImage(
                            'assets/images/themes/patience.png'),
                        themeName: 'Patience',
                        colour: kPrimaryBlack,
                      ),
                      colour: kSecondaryPink,
                      onPress: () {},
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    ReusableCard(
                      cardChild: IconContent(
                        themeIcon: AssetImage(
                            'assets/images/themes/reliance.png'),
                        themeName: 'Reliance',
                        colour: kSecondaryWhite,
                      ),
                      colour: kSecondaryGreen,
                      onPress: () {},
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



