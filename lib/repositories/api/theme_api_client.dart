import 'dart:convert';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:remember_me/repositories/models/models.dart';

class ThemeApiClient {
  final _themeUrl = 'http://192.168.1.2:8000/theme';
  final http.Client httpClient;

  ThemeApiClient({@required this.httpClient}) : assert(httpClient != null);

  Future<Themes> getThemeNames() async {
    final themeResponse = await this.httpClient.get(_themeUrl);

    if (themeResponse.statusCode != 200) {
      throw Exception('error getting theme names');
    }

    final themes = jsonDecode(themeResponse.body);

    return Themes.fromJson(themes);
  }
}


