// ignore_for_file: depend_on_referenced_packages

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:rapid_task/models/authentication/user_model.dart';
import 'package:rapid_task/viewmodels/services/authentication/auth_service.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final AuthService authService = AuthService();

  AuthenticationBloc() : super(AuthenticationInitialState()) {

    on<SignUpUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user = await authService.signUpUser(
            event.email, event.password, event.username);
        if (user != null) {
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('create user failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
    on<SignInUser>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        final UserModel? user = await authService.signinuser(email: 
            event.email,password:  event.password);
        if (user != null) {
          emit(AuthenticationSuccessState(user));
        } else {
          emit(const AuthenticationFailureState('create user failed'));
        }
      } catch (e) {
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
    on<SignOut>((event, emit) async {
      emit(AuthenticationLoadingState(isLoading: true));
      try {
        authService.signOutUser();
      } catch (e) {
        print('error');
        print(e.toString());
      }
      emit(AuthenticationLoadingState(isLoading: false));
    });
  }
}
