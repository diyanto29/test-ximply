import 'package:equatable/equatable.dart';

import 'data_category.dart';

class CategoryModel extends Equatable {
  final bool? status;
  final String? message;
  final dynamic errors;
  final List<DataCategory>? data;

  const CategoryModel({this.status, this.message, this.errors, this.data});

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        status: json['status'] as bool?,
        message: json['message'] as String?,
        errors: json['errors'] as dynamic,
        data: (json['data'] as List<dynamic>?)
            ?.map((e) => DataCategory.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'errors': errors,
        'data': data?.map((e) => e.toJson()).toList(),
      };

  CategoryModel copyWith({
    bool? status,
    String? message,
    dynamic errors,
    List<DataCategory>? data,
  }) {
    return CategoryModel(
      status: status ?? this.status,
      message: message ?? this.message,
      errors: errors ?? this.errors,
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [status, message, errors, data];
}
