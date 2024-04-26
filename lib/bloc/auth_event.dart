part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class LoginEvent extends AuthEvent {
  final String userid;
  final String pass;

  LoginEvent(this.userid, this.pass);
}

final class LogoutEvent extends AuthEvent {}
