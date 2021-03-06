import 'package:equatable/equatable.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState {}

class AuthenticationSuccess extends AuthenticationState {
//  final String displayName;
//
//  const AuthenticationSuccess(this.displayName);
//
//  @override
//  List<Object> get props => [displayName];
//
//  @override
//  String toString() => 'AuthenticationSuccess { displayName : $displayName}';
}

class AuthenticationFailure extends AuthenticationState {}

class AuthenticationInProgress extends AuthenticationState {}