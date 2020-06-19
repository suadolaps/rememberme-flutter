import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:remember_me/repositories/models/models.dart';


abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStarted extends AuthenticationEvent {}

class AuthenticationLoggedIn extends AuthenticationEvent {
  final User user;

  const AuthenticationLoggedIn({@required this.user});

  @override
  List<Object> get props => [user];

  @override
  String toString() => 'LoggedIn { user: $user.username.toString() }';

}

class AuthenticationLoggedOut extends AuthenticationEvent {}