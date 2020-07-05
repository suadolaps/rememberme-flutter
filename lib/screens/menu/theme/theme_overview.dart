
import 'package:flutter/material.dart';
import 'package:remember_me/screens/menu/theme/theme_selected.dart';
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Row(
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
                        onPress: ()  {
                          Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ThemeSelected(
                                  themeName: 'His Names',
                                  themeIcon: Image(
                                    image: AssetImage('assets/images/themes/sub-menu/his-names.png'),
                                    width: 220.0,
                                  ),
                                  bodyText: 'He is Allah, the Creator, the Inventor, the Fashioner; to Him belong the best names. Whatever is in the heavens and earth is exalting Him. And He is the Exalted in Might, the Wise.',
                                  bodyCaption: 'Surah al-Hashr 59:24',
                                  onPressed: (){},
                                ),
                          ),
                          );
                        },
                      ),
                      ReusableCard(
                        cardChild: IconContent(
                          themeIcon: AssetImage(
                              'assets/images/themes/forgive.png'),
                          themeName: 'Forgiveness',
                          colour: kSecondaryWhite,
                        ),
                        colour: kSecondaryGreen,
                        onPress: () {
                          Navigator.push(context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ThemeSelected(
                                    themeName: 'Forgiveness',
                                    themeIcon: Image(
                                      image: AssetImage('assets/images/themes/sub-menu/forgive.png'),
                                      width: 220.0,
                                    ),
                                    bodyText: 'Verily, Allah loves those who repent and those who purify themselves.',
                                    bodyCaption: 'Surah al-Baqarah 2:222',
                                    onPressed: (){},
                                  ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
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
                      onPress: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ThemeSelected(
                                  themeName: 'Prayer',
                                  themeIcon: Image(
                                    image: AssetImage('assets/images/themes/sub-menu/prayer.png'),
                                    width: 220.0,
                                  ),
                                  bodyText: 'The Prophet, peace be upon him, said: “The key to Paradise is prayer; the key to prayer is wudhu (ablution).”',
                                  bodyCaption: 'Musnad Ahmad',
                                  onPressed: (){},
                                ),
                          ),
                        );
                      },
                    ),
                    ReusableCard(
                      cardChild: IconContent(
                        themeIcon: AssetImage(
                            'assets/images/themes/patience.png'),
                        themeName: 'Patience',
                        colour: kPrimaryBlack,
                      ),
                      colour: kSecondaryPink,
                      onPress: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ThemeSelected(
                                  themeName: 'Patience',
                                  themeIcon: Image(
                                    image: AssetImage('assets/images/themes/sub-menu/patience.png'),
                                    width: 220.0,
                                  ),
                                  bodyText: 'The one who practices Sabr will never be deprived of success, even though it may take a long time.',
                                  bodyCaption: 'Imam Ali',
                                  onPressed: (){},
                                ),
                          ),
                        );
                      },
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
                      onPress: () {
                        Navigator.push(context,
                          MaterialPageRoute(
                            builder: (context) =>
                                ThemeSelected(
                                  themeName: 'Reliance',
                                  themeIcon: Image(
                                    image: AssetImage('assets/images/themes/sub-menu/reliance.png'),
                                    width: 220.0,
                                  ),
                                  bodyText: 'The Prophet, peace be upon him, said: “If you relied on Allah as you should rely on Him, He would provide you sustenance as He provides for the birds; they go out in the morning with empty stomachs and come back in the evening with full stomachs.”',
                                  bodyCaption: 'At-Tirmidhi',
                                  onPressed: (){},
                                ),
                          ),
                        );
                      },
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




