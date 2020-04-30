import 'package:flutter/material.dart';
import 'package:remember_me/widgets/gender_card.dart';
import 'package:remember_me/widgets/arrow_button.dart';

enum Gender {
  male,
  female,
}

class GenderSelect extends StatefulWidget {
  static const String id = 'gender_select_screen';

  @override
  _GenderSelectState createState() => _GenderSelectState();
}

class _GenderSelectState extends State<GenderSelect> {
  Gender selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ArrowButton(
        onPress: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/register/bg-gender.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Choose your gender',
                  style: TextStyle(
                    color: Color(0xFF0D47B8),
                    fontSize: 36.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: GenderCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        colour: selectedGender == Gender.male
                            ? Color(0xFFFBEAE3).withOpacity(0.63)
                            : Colors.transparent,
                        cardChild: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image(
                            image: AssetImage(
                                '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/register/male.png'),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GenderCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.female;
                          });
                        },
                        colour: selectedGender == Gender.female
                            ? Color(0xFFFBEAE3).withOpacity(0.63)
                            : Colors.transparent,
                        cardChild: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Image(
                            image: AssetImage(
                                '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/register/female.png'),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
