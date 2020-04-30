import 'package:flutter/material.dart';

class ArrowButton extends StatelessWidget {
  ArrowButton({@required this.onPress});

  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 15.0,
        right: 5.0,
      ),
      child: Container(
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            backgroundColor: Color(0xFFE5ECFC),
            splashColor: Color(0xFFE5ECFC),
            elevation: 0.0,
            highlightElevation: 2.0,
            child: Image(
              width: 35.0,
              image: AssetImage(
                  '/Users/suadkamardeen/Suad/Developer/AndroidStudioProjects/remember_me/assets/images/register/arrow.png'),
            ),
            onPressed: onPress,
          ),
        ),
      ),
    );
  }
}
