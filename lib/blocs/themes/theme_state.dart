import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

import 'package:remember_me/repositories/models/models.dart';

abstract class ThemeState extends Equatable {
  const ThemeState();

  @override
  List<Object> get props => [];
}

class ThemeNameEmpty extends ThemeState{}

class ThemeNameLoading extends ThemeState{}

class ThemeNameLoaded extends ThemeState{
  final Themes themes;

  const ThemeNameLoaded({@required this.themes}) : assert(themes != null);

  @override
  List<Object> get props => [themes];
}

class ThemeNameError extends ThemeState{}