import 'package:flutter/material.dart';
import 'package:remember_me/screens/register/genderselect_page.dart';
import 'package:remember_me/screens/register/journey_start.dart';
import 'package:remember_me/utilities/constants.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/widgets/arrow_button.dart';
import 'package:remember_me/widgets/top_button.dart';

class NameInput extends StatelessWidget {
  static const String id = 'name_input_screen';
  String name;
  NameInput({this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ArrowButton(
        onPress: () {
          if (name != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => JourneyStart(
                  name: name,
                ),),
            );
          } else {
              return;
          }
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TopButton(
                  buttonName: 'BACK',
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GenderSelect(),
                      ),
                    );
                  },
                ),
              ),
                SizedBox(height: 180,),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0,
                    right: 20.0,),
                  child: Container(
                  child: Image(
                    image: AssetImage('assets/images/register/female.png'),
                    width: 150.0,
                  ),
              ),
                ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: Text(
                  'What\'s your name?',
                  style: kMainTitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  bottom: 15.0,
                  left: 20.0,
                  right: 20.0,
                ),
                child: nameField(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameField() {
    return TextField(
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        labelText: 'Enter your name',
        labelStyle: TextStyle(
          fontSize: 20.0,
          color: kTertiaryGrey,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: kPrimaryBlue,
            width: 0.9,
          ),
        ),
      ),
      onChanged: (value) {
        name = value;
      },
    );
  }
}
