// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CompanyDetails {
  final String companyName;
  final String address;
  final String state;
  final int pincode;
  final String? emailId;
  final String? website;
  final String? licNo;
  final String? placeOfDispatch;
  final String? pan;
  final List<String> mobileNos;
  final String? gstin;
  final List<String> bankIds;
  final DateTime? createdAt;

  CompanyDetails(
      {required this.companyName,
      required this.address,
      required this.state,
      required this.pincode,
      this.emailId,
      this.website,
      this.licNo,
      this.placeOfDispatch,
      this.pan,
      this.mobileNos = const [],
      this.gstin,
      this.bankIds = const [],
      this.createdAt});

  CompanyDetails copyWith({
    String? companyName,
    String? address,
    String? state,
    int? pincode,
    String? emailId,
    String? website,
    String? licNo,
    String? placeOfDispatch,
    String? pan,
    List<String>? mobileNos,
    String? gstin,
    List<String>? bankIds,
    DateTime? createdAt,
  }) {
    return CompanyDetails(
      companyName: companyName ?? this.companyName,
      address: address ?? this.address,
      state: state ?? this.state,
      pincode: pincode ?? this.pincode,
      emailId: emailId ?? this.emailId,
      website: website ?? this.website,
      licNo: licNo ?? this.licNo,
      placeOfDispatch: placeOfDispatch ?? this.placeOfDispatch,
      pan: pan ?? this.pan,
      mobileNos: mobileNos ?? this.mobileNos,
      gstin: gstin ?? this.gstin,
      bankIds: bankIds ?? this.bankIds,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'companyName': companyName,
      'address': address,
      'state': state,
      'pincode': pincode,
      'emailId': emailId,
      'website': website,
      'licNo': licNo,
      'placeOfDispatch': placeOfDispatch,
      'pan': pan,
      'mobileNos': mobileNos,
      'gstin': gstin,
      'bankIds': bankIds,
      'createdAt': createdAt?.millisecondsSinceEpoch,
    };
  }

  factory CompanyDetails.fromMap(Map<String, dynamic> map) {
    return CompanyDetails(
      companyName: map['companyName'] as String,
      address: map['address'] as String,
      state: map['state'] as String,
      pincode: map['pincode'] as int,
      emailId: map['emailId'] != null ? map['emailId'] as String : null,
      website: map['website'] != null ? map['website'] as String : null,
      licNo: map['licNo'] != null ? map['licNo'] as String : null,
      placeOfDispatch: map['placeOfDispatch'] != null
          ? map['placeOfDispatch'] as String
          : null,
      pan: map['pan'] != null ? map['pan'] as String : null,
      mobileNos: List<String>.from(map['mobileNos'] as List<String>),
      gstin: map['gstin'] != null ? map['gstin'] as String : null,
      bankIds: List<String>.from(map['bankIds'] as List<String>),
      createdAt: map['createdAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CompanyDetails.fromJson(String source) =>
      CompanyDetails.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CompanyDetails(companyName: $companyName, address: $address, state: $state, pincode: $pincode, emailId: $emailId, website: $website, licNo: $licNo, placeOfDispatch: $placeOfDispatch, pan: $pan, mobileNos: $mobileNos, gstin: $gstin, bankIds: $bankIds, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant CompanyDetails other) {
    if (identical(this, other)) return true;

    return other.companyName == companyName &&
        other.address == address &&
        other.state == state &&
        other.pincode == pincode &&
        other.emailId == emailId &&
        other.website == website &&
        other.licNo == licNo &&
        other.placeOfDispatch == placeOfDispatch &&
        other.pan == pan &&
        listEquals(other.mobileNos, mobileNos) &&
        other.gstin == gstin &&
        listEquals(other.bankIds, bankIds) &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return companyName.hashCode ^
        address.hashCode ^
        state.hashCode ^
        pincode.hashCode ^
        emailId.hashCode ^
        website.hashCode ^
        licNo.hashCode ^
        placeOfDispatch.hashCode ^
        pan.hashCode ^
        mobileNos.hashCode ^
        gstin.hashCode ^
        bankIds.hashCode ^
        createdAt.hashCode;
  }
}
