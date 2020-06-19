import 'package:meta/meta.dart';
import 'package:remember_me/dao/user_dao.dart';
import 'package:remember_me/repositories/api/login_api_client.dart';
import 'package:remember_me/repositories/models/models.dart';

class UserRepository {
  final userDao = UserDao();
  final loginApiClient = LoginApiClient();

  Future<User> authenticate({
    @required String email,
    @required String password,
  }) async {
    UserLogin userLogin = UserLogin(
      email: email,
      password: password,
    );
    Token token = await loginApiClient.getToken(userLogin);
    User user = User(
      id: 0,
      email: email,
      token: token.token,
    );
    return user;
  }

  Future<void> deleteToken({
    @required int id
}) async {
    /// delete from keystore / keychain
    await userDao.deleteUser(id);
  }

  Future<void> persistToken({
    @required User user
  }) async {
    /// write token with user to db
    await userDao.createUser(user);
  }

  Future<bool> hasToken() async {
    bool result = await userDao.checkUser(0);
    return result;
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