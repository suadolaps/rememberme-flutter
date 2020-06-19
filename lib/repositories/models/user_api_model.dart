class UserLogin {
  String email;
  String password;
  String firstName;

  UserLogin({this.email, this.password, this.firstName});

  Map <String, dynamic> toDatabaseJson() => {
    "email": this.email,
    "password": this.password,
    "first name": this.firstName,
  };

  factory UserLogin.fromJson(Map<String, dynamic> json) {
    return UserLogin(
      email: json['email'],
      password: json['password'],
    );
  }
}

class Token{
  String token;

  Token({this.token});

  factory Token.fromJson(Map<String, dynamic> json) {
    return Token(
        token: json['token']
    );
  }
}
