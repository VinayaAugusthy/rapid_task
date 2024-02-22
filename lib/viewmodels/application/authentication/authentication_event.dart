part of 'authentication_bloc.dart';

@immutable
abstract class AuthenticationEvent {
  const AuthenticationEvent();

  List<Object> get props => [];
}

class SignUpUser extends AuthenticationEvent {
  final String email;
  final String password;
  final String username;

  const SignUpUser(this.email, this.password, this.username);

  @override
  List<Object> get props => [email, password];
}

class SignInUser extends AuthenticationEvent {
  final String email;
  final String password;
  final BuildContext context;
  const SignInUser(this.email, this.password, this.context);

  @override
  List<Object> get props => [email, password];
}

class SignOut extends AuthenticationEvent {}
