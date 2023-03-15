// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

class LoginState extends Equatable {
  final bool rememberMe;
  const LoginState(this.rememberMe);

  @override
  List<Object> get props => [rememberMe];

  LoginState copyWith({
    bool? rememberMe,
  }) {
    return LoginState(
      rememberMe ?? this.rememberMe,
    );
  }
}
