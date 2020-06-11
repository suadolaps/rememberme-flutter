import 'package:flutter/material.dart';
import 'package:remember_me/screens/onboarding/onboarding_2.dart';
import 'package:remember_me/screens/register/name_input_page.dart';
import 'package:remember_me/widgets/gender_card.dart';
import 'package:remember_me/widgets/arrow_button.dart';
import 'package:remember_me/widgets/top_button.dart';
import 'package:remember_me/models/gender.dart';


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
        onPress: () {
          Navigator.of(context).pushNamed(NameInput.id);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/register/bg-gender.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: TopButton(
                    buttonName: 'BACK',
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Onboarding2(),
                        ),
                      );
                    },
                  ),
              ),
              SizedBox(height: 180,),
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
                            image:
                                AssetImage('assets/images/register/male.png'),
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
                            image:
                                AssetImage('assets/images/register/female.png'),
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
