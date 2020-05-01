import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

enum SelectedGender { male, female }

class GenderBloc extends Bloc<SelectedGender, Image> {
  Image maleImage = Image(
    image: AssetImage('assets/images/register/male.png'),
  );

  @override
  Image get initialState => Image(
        image: AssetImage('assets/images/register/female.png'),
      );

  @override
  Stream<Image> mapEventToState(SelectedGender event) async* {
    switch (event) {
      case SelectedGender.female:
        yield state;
        break;

      case SelectedGender.male:
        yield maleImage;
        break;
    }
  }
}
