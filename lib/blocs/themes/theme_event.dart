import 'package:equatable/equatable.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class GetThemeNames extends ThemeEvent {
  const GetThemeNames();

  @override
  List<Object> get props => [];
}