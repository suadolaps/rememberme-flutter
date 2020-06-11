import 'package:flutter/material.dart';
import 'package:remember_me/screens/register/user_detail.dart';
import 'package:remember_me/utilities/colours.dart';
import 'package:remember_me/utilities/constants.dart';

import 'package:remember_me/screens/register/intention/intention.dart';
import 'package:remember_me/widgets/rounded_button.dart';
import 'package:remember_me/widgets/top_button.dart';

class AddIntention extends StatelessWidget {
  static const String id = 'add_intention';
  String intention;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/register/bg-intention.png'),
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: TopButton(
                  buttonName: 'BACK',
                  onPressed: () {
                    Navigator.pop(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Intention(),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5.0,
                  left: 20.0,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'My Intention',
                    style: kLoginTitleStyle.copyWith(
                      fontSize: 36.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 20.0,
                  left: 20.0,
                ),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Why have you decided to commit to this?',
                    style: kLoginBodyStyle.copyWith(
                      color: kTertiaryGrey,
                    ),
                  ),
                ),
              ),
              Row(
                children: <Widget>[],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 30.0,
                  ),
                  child: Container(
                    child: intentionTextField(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: RoundedButton(
                  buttonTitle: 'DONE',
                  onPressed: () {
                    Navigator.of(context).pushNamed(UserDetail.id);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget intentionTextField() {
    return TextField(
      keyboardType: TextInputType.multiline,
      style: kInputTextStyle,
      autocorrect: true,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0.0),
        border: InputBorder.none,
        hintText: 'Ya Allah I intend to begin this journey...',
      ),
      cursorColor: kPrimaryBlue,
      toolbarOptions: ToolbarOptions(
        cut: true,
        copy: true,
        selectAll: true,
        paste: true,
      ),
      maxLines: null,
      onChanged: (value) {
        intention = value;
      },
    );
  }
}
