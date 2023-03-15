import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stock_tracker/modules/auth/domain/entities/user.dart';
import 'package:stock_tracker/modules/auth/domain/usecases/login.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  AuthBloc(this.login) : super(AuthEmpty()) {
    on<HandleLogin>((event, emit) async {
      emit(AuthLoading());
      final result = await login.execute(event.email, event.password);
      result.fold((l) => emit(AuthError(l.message)), (r) {
        if (r != null) {
          emit(AuthLoaded(r));
        } else {
          emit(const AuthError("Error in Login"));
        }
      });
    });
  }
}
