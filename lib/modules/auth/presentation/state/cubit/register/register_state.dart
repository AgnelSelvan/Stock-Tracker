// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'register_cubit.dart';

class RegisterState extends Equatable {
  final String? selectedState;
  final List<String> cities;
  final String? selectedCity;
  const RegisterState({
    this.selectedState,
    this.cities = const [],
    this.selectedCity,
  });

  @override
  List<Object> get props => [];

  RegisterState copyWith({
    String? selectedState,
    List<String>? cities,
    String? selectedCity,
  }) {
    return RegisterState(
      selectedState: selectedState,
      cities: cities ?? [],
      selectedCity: selectedCity,
    );
  }
}
