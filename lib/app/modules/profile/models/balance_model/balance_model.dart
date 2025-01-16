import 'package:equatable/equatable.dart';

import 'data_balance.dart';

class BalanceModel extends Equatable {
  final bool? status;
  final String? message;
  final dynamic errors;
  final DataBalance? data;

  const BalanceModel({this.status, this.message, this.errors, this.data});

  factory BalanceModel.fromJson(Map<String, dynamic> json) => BalanceModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        errors: json['errors'] as dynamic,
        data: json['data'] == null
            ? null
            : DataBalance.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'errors': errors,
        'data': data?.toJson(),
      };

  BalanceModel copyWith({
    bool? status,
    String? message,
    dynamic errors,
    DataBalance? data,
  }) {
    return BalanceModel(
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}
