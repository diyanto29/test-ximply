import 'package:equatable/equatable.dart';

import 'data.dart';

class CartModel extends Equatable {
  final bool? status;
  final String? message;
  final dynamic errors;
  final Data? data;

  const CartModel({this.status, this.message, this.errors, this.data});

  factory CartModel.fromJson(Map<String, dynamic> json) => CartModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        errors: json['errors'] as dynamic,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'errors': errors,
        'data': data?.toJson(),
      };

  CartModel copyWith({
    bool? status,
    String? message,
    dynamic errors,
    Data? data,
  }) {
    return CartModel(
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}
