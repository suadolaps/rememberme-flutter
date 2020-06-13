import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:remember_me/repositories/models/field_error.dart';
import 'package:remember_me/blocs/email/login_screen_event.dart';
import 'package:remember_me/blocs/email/login_screen_state.dart';
import 'package:remember_me/mixins/validation_mixin.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> with ValidationMixin {

  LoginScreenBloc();

  @override
  LoginScreenState get initialState => LoginScreenState();

  @override
  Stream<LoginScreenState> mapEventToState(LoginScreenEvent event) async* {
    if (event is LoginScreenEventSubmit) {
      yield LoginScreenState(isBusy: true);

      if (this.isFieldEmpty(event.email)) {
        yield LoginScreenState(emailError: FieldError.Empty);
        return;
      }

      if(!this.validateEmailAddress(event.email)){
        yield LoginScreenState(emailError: FieldError.Invalid);
        return;
      }

      yield LoginScreenState(submissionSuccess: true);
    }
  }

}