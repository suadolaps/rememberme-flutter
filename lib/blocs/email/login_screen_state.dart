import 'package:remember_me/repositories/models/field_error.dart';

class LoginScreenState {
  final bool isBusy;
  final FieldError emailError;
  final bool submissionSuccess;
  LoginScreenState({
    this.isBusy: false,
    this.emailError,
    this.submissionSuccess: false,
  });
}