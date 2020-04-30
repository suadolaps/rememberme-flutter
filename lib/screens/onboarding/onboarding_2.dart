import 'package:flutter/material.dart';
import 'package:remember_me/screens/register/genderselect_page.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/rounded_button.dart';

class Onboarding2 extends StatefulWidget {
  static const String id = 'onboarding_screen_2';

  @override
  _Onboarding2State createState() => _Onboarding2State();
}

class _Onboarding2State extends State<Onboarding2> {
  final int _numPages = 5;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 5.0),
      height: 8.0,
      width: 8.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF0D47B8) : Color(0xFF94A0AA),
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: FlatButton(
                onPressed: () {
                  setState(() {
                    _currentPage != _numPages
                        ? _pageController.jumpToPage(5)
                        : null;
                  });
                },
                child: Text(
                  'SKIP',
                  style: kTopButtonStyle,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _currentPage = page;
                  });
                },
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/onboarding/onboarding2.png'),
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30.0,
                            bottom: 20.0,
                          ),
                          child: Text(
                            'Reflect:\nA verse a day',
                            style: kOnboardingTitleStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: Text(
                            'Verses of the Qur’an to help you achieve your potential by placing Allah’s message central in your life.',
                            style: kOnboardingBodyStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/onboarding/onboarding3.png'),
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30.0,
                            bottom: 20.0,
                          ),
                          child: Text(
                            'Take Action',
                            style: kOnboardingTitleStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: Text(
                            'Daily prompts to inspire you towards reflection or an action that moves you closer to Allah.',
                            style: kOnboardingBodyStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/onboarding/onboarding4.png'),
                          fit: BoxFit.fill,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 30.0,
                            bottom: 20.0,
                          ),
                          child: Text(
                            'Grow Together',
                            style: kOnboardingTitleStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: Text(
                            'Begin your journey of spiritual growth with a friend or two and support each other when the going gets tough.',
                            style: kOnboardingBodyStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: AssetImage(
                              '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/onboarding/onboarding5.png'),
                          fit: BoxFit.fill,
                          height: 400.0,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: Text(
                            'The Remember Me\nJournal is inspired by:',
                            style: kOnboardingTitleStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 35.0),
                          child: Text(
                            '"So remember Me; \nI will remember you. \nAnd be grateful to Me\nand do not deny Me."',
                            style: kOnboardingBodyStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: Text(
                            'Surah al-Baqarah 2:152',
                            style: kCaptionStyle,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                          '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/onboarding/onboarding6.png',
                        ),
                        alignment: Alignment.topCenter,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'Allah will always outmatch\nyour efforts towards Him.',
                            style: kOnboardingTitleStyle,
                            textAlign: kOnboardingAlignment,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              top: 8.0,
                              bottom: 12.0,
                            ),
                            child: Text(
                              'What are you waiting for?',
                              style: kOnboardingBodyStyle,
                              textAlign: kOnboardingAlignment,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              ConstrainedBox(
                                constraints:
                                    const BoxConstraints(minWidth: 200.0),
                                child: RoundedButton(
                                  buttonTitle: 'GET STARTED',
                                  onPressed: () {
                                    Navigator.of(context)
                                        .pushNamed(GenderSelect.id);
                                  },
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 55.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
