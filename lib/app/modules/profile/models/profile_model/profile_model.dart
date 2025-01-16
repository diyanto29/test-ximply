import 'package:equatable/equatable.dart';

import 'data_profile.dart';

class ProfileModel extends Equatable {
  final bool? status;
  final String? message;
  final dynamic errors;
  final DataProfile? data;

  const ProfileModel({this.status, this.message, this.errors, this.data});

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        errors: json['errors'] as dynamic,
        data: json['data'] == null
            ? null
            : DataProfile.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'errors': errors,
        'data': data?.toJson(),
      };

  ProfileModel copyWith({
    bool? status,
    String? message,
    dynamic errors,
    DataProfile? data,
  }) {
    return ProfileModel(
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}
