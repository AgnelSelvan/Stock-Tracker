part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class HandleLogin extends AuthEvent {
  final String email;
  final String password;

  const HandleLogin(this.email, this.password);
}

class HandleRegister extends AuthEvent {
  final String email;
  final String password;

  const HandleRegister(this.email, this.password);
}
