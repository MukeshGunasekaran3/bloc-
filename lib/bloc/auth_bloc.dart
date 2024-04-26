import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      if (event.pass.isNotEmpty && event.userid.isNotEmpty) {
        await Future.delayed(Duration(seconds: 1));
        print("entered");
        return emit(AuthSucess('${event.pass} - ${event.userid}'));
      } else {
        return emit(AuthFailure('fields are empty'));
      }
    });
    on<LogoutEvent>((event, emit) async {
      emit(AuthLoading());

      return emit(AuthInitial());
    });
  }
  @override
  void onChange(Change<AuthState> change) {
    // TODO: implement onChange
    print(change);
  }
}
