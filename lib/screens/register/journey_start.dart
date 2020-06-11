import 'package:flutter/material.dart';
import 'package:remember_me/screens/register/intention/intention.dart';
import 'package:remember_me/screens/register/name_input_page.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/widgets/arrow_button.dart';
import 'package:remember_me/widgets/top_button.dart';

class JourneyStart extends StatelessWidget {
  static const String id = 'journey_start_screen';

  final String name;

  JourneyStart({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ArrowButton(
        onPress: () {
          Navigator.pushNamed(context, Intention.id);
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/register/bg-name.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TopButton(
                  buttonName: 'BACK',
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NameInput(),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 180,),
              Padding(
                padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                ),
                child: Container(
                  child: Image(
                    image: AssetImage('assets/images/register/female.png'),
                    width: 180.0,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 40.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  'Let\'s get this journey started $name!',
                  style: kMainTitleStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
