import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginState(false));

  void toggleRememberMe() {
    emit(state.copyWith(rememberMe: !state.rememberMe));
  }
}
