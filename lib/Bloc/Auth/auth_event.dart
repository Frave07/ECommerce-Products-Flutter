part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  LoginEvent(this.email, this.password);
}

class LogOutEvent extends AuthEvent {}

class CheckLoginEvent extends AuthEvent {}

