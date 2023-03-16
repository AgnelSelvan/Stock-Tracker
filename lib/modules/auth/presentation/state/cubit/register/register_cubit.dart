import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterState());

  void updateState(String? selectedState, List<String>? cities) {
    emit(state.copyWith(
        cities: cities, selectedCity: null, selectedState: selectedState));
  }
}
