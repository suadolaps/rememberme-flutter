import 'package:meta/meta.dart';

class UserRepository {
  Future<String> authenticate({
  @required String email, @required String password,
}) async {
    await Future.delayed(Duration(seconds: 1));
    return 'token';
  }

  Future<void> deleteToken() async {
    /// delete from keystore / keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<void> persistToken(String token) async {
    /// write to keystore / keychain
    await Future.delayed(Duration(seconds: 1));
    return;
  }

  Future<bool> hasToken() async {
    /// read from keystore / keychain
    await Future.delayed(Duration(seconds: 1));
    return false;
  }

  Future<void> signUp({String email, String password}) async {
    /// implement authentication for signup
  }

  Future<void> logOut() async {
    /// implement logout method to clear user profile from device
  }

  Future<bool> isLoggedIn() async {
    /// check if user is already authenticated
  }

  Future<String> getUser() async {
    /// retrieve user info
  }
}