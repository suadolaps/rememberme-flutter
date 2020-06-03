abstract class LoginScreenEvent {}

class LoginScreenEventSubmit extends LoginScreenEvent {
  final String email;
  LoginScreenEventSubmit(this.email);
}