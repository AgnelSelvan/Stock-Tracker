// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:stock_tracker/modules/auth/domain/entities/user.dart';

class AppUserModel extends Equatable {
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

  const AppUserModel({
    this.email,
    this.role,
    this.companyId,
    this.address,
    this.state,
    this.pincode,
    required this.mobileNo,
    required this.firstName,
    this.lastName,
    this.dob,
    this.createdAt,
  });

  @override
  List<Object?> get props {
    return [
      email,
      role,
      companyId,
      address,
      state,
      pincode,
      mobileNo,
      firstName,
      lastName,
      dob,
      createdAt,
    ];
  }

  AppUserModel copyWith({
    String? email,
    String? role,
    String? companyId,
    String? address,
    String? state,
    int? pincode,
    int? mobileNo,
    String? firstName,
    String? lastName,
    DateTime? dob,
    DateTime? createdAt,
  }) {
    return AppUserModel(
      email: email ?? this.email,
      role: role ?? this.role,
      companyId: companyId ?? this.companyId,
      address: address ?? this.address,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      mobileNo: mobileNo ?? this.mobileNo,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      dob: dob ?? this.dob,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'role': role,
      'companyId': companyId,
      'address': address,
      'state': state,
      'pincode': pincode,
      'mobileNo': mobileNo,
      'firstName': firstName,
      'lastName': lastName,
      'dob': dob?.millisecondsSinceEpoch,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory AppUserModel.fromMap(Map<String, dynamic> map) {
    return AppUserModel(
      email: map['email'] != null ? map['email'] as String : null,
      role: map['role'] != null ? map['role'] as String : null,
      companyId: map['companyId'] != null ? map['companyId'] as String : null,
      address: map['address'] != null ? map['address'] as String : null,
      state: map['state'] != null ? map['state'] as String : null,
      pincode: map['pincode'] != null ? map['pincode'] as int : null,
      mobileNo: map['mobileNo'] as int,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] != null ? map['lastName'] as String : null,
      dob: map['dob'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dob'] as int)
          : null,
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUserModel.fromJson(String source) =>
      AppUserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool get stringify => true;

  AppUser get toUser => AppUser(
        mobileNo: mobileNo,
        firstName: firstName,
        email: email,
        role: role,
        companyId: companyId,
        address: address,
        state: state,
        pincode: pincode,
        lastName: lastName,
        createdAt: createdAt,
        dob: dob,
      );
}
