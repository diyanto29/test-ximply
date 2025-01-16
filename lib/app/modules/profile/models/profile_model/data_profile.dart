import 'package:equatable/equatable.dart';

class DataProfile extends Equatable {
  final String? id;
  final String? name;
  final String? email;
  final dynamic mobilePhone;
  final dynamic isWhatsapp;
  final String? referralCode;
  final dynamic emailVerifiedAt;
  final dynamic mobilePhoneVerifiedAt;
  final dynamic avatarPath;
  final DateTime? createdAt;

  const DataProfile({
    this.id,
    this.name,
    this.email,
    this.mobilePhone,
    this.isWhatsapp,
    this.referralCode,
    this.emailVerifiedAt,
    this.mobilePhoneVerifiedAt,
    this.avatarPath,
    this.createdAt,
  });

  factory DataProfile.fromJson(Map<String, dynamic> json) => DataProfile(
        id: json['id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        mobilePhone: json['mobile_phone'] as dynamic,
        isWhatsapp: json['is_whatsapp'] as dynamic,
        referralCode: json['referral_code'] as String?,
        emailVerifiedAt: json['email_verified_at'] as dynamic,
        mobilePhoneVerifiedAt: json['mobile_phone_verified_at'] as dynamic,
        avatarPath: json['avatar_path'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
        'mobile_phone': mobilePhone,
        'is_whatsapp': isWhatsapp,
        'referral_code': referralCode,
        'email_verified_at': emailVerifiedAt,
        'mobile_phone_verified_at': mobilePhoneVerifiedAt,
        'avatar_path': avatarPath,
        'created_at': createdAt?.toIso8601String(),
      };

  DataProfile copyWith({
    String? id,
    String? name,
    String? email,
    dynamic mobilePhone,
    dynamic isWhatsapp,
    String? referralCode,
    dynamic emailVerifiedAt,
    dynamic mobilePhoneVerifiedAt,
    dynamic avatarPath,
    DateTime? createdAt,
  }) {
    return DataProfile(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      mobilePhone: mobilePhone ?? this.mobilePhone,
      isWhatsapp: isWhatsapp ?? this.isWhatsapp,
      referralCode: referralCode ?? this.referralCode,
      emailVerifiedAt: emailVerifiedAt ?? this.emailVerifiedAt,
      mobilePhoneVerifiedAt:
          mobilePhoneVerifiedAt ?? this.mobilePhoneVerifiedAt,
      avatarPath: avatarPath ?? this.avatarPath,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      mobilePhone,
      isWhatsapp,
      referralCode,
      emailVerifiedAt,
      mobilePhoneVerifiedAt,
      avatarPath,
      createdAt,
    ];
  }
}
