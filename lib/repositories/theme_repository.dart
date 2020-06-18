import 'package:remember_me/repositories/api/theme_api_client.dart';
import 'package:remember_me/repositories/models/models.dart';

class ThemeRepository {
  String _data;
  final ThemeApiClient themeApiClient;

  ThemeRepository({this.themeApiClient});

  Future<void> fetchData() async {
    // simulate real data fetching
    await Future.delayed(Duration(milliseconds: 600));
    // store dummy data
    _data = 'Themes';
  }

  String get data => _data;

  Future<Themes> getThemeNames() async{
    return await themeApiClient.getThemeNames();
  }
}