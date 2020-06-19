import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:remember_me/repositories/models/models.dart';

final _base = 'http://192.168.1.2:8000/user';
final _userEndpoint = '/users/';
final _userURL = _base + _userEndpoint;

class RegisterApiClient{

  Future<UserLogin> createUser(UserLogin userLogin) async {
    print(_userURL);
    final http.Response response = await http.post(
      _userURL,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(userLogin.toDatabaseJson()),
    );
    if (response.statusCode == 200) {
      return UserLogin.fromJson(json.decode(response.body));
    } else {
      print(json.decode(response.body).toString());
      throw Exception(json.decode(response.body));
    }
  }
}