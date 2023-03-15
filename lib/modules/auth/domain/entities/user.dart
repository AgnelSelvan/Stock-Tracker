import 'package:equatable/equatable.dart';

class AppUser extends Equatable {
  final String? email;
  final String? role;
  final String? companyId;
  final String? address;
  final String? state;
  final int? pincode;
  final int mobileNo;
  final String firstName;
  final String? lastName;
  final DateTime? dob;
  final DateTime? createdAt;

  const AppUser({
    this.email,
    this.role,
    this.companyId,
    this.address,
    this.state,
    this.pincode,
    required this.mobileNo,
    required this.firstName,
    this.lastName,
    this.createdAt,
    this.dob,
  });

  @override
  List<Object?> get props => [
        email,
        role,
        companyId,
        address,
        state,
        pincode,
        dob,
        createdAt,
      ];

  String get displayName => "$firstName $lastName";
}
