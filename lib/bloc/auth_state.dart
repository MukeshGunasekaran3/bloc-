part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthSucess extends AuthState {
  final String userid;

  AuthSucess(this.userid);
}

final class AuthFailure extends AuthState {
  final String reason;

  AuthFailure(this.reason);
}

final class AuthLoading extends AuthState {}
