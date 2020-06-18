import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

import 'package:remember_me/repositories/repositories.dart';
import 'package:remember_me/repositories/models/models.dart';
import 'package:remember_me/blocs/themes/theme.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final ThemeRepository themeRepository;

  ThemeBloc({this.themeRepository});

  @override
  ThemeState get initialState => ThemeNameEmpty();

  @override
  Stream<ThemeState> mapEventToState(ThemeEvent event) async* {
    if (event is GetThemeNames){
      yield ThemeNameLoading();
      try {
        final Themes themes = await themeRepository.getThemeNames();
        yield ThemeNameLoaded(themes: themes);
      } catch(_) {
        yield ThemeNameError();
      }
    }
  }

}