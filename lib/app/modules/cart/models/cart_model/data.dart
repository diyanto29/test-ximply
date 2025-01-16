import 'package:equatable/equatable.dart';

import 'cart_item.dart';

class Data extends Equatable {
  final String? id;
  final String? status;
  final String? userId;
  final DateTime? updatedAt;
  final List<CartItem>? cartItems;

  const Data({
    this.id,
    this.status,
    this.userId,
    this.updatedAt,
    this.cartItems,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json['id'] as String?,
        status: json['status'] as String?,
        userId: json['user_id'] as String?,
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        cartItems: (json['cart_items'] as List<dynamic>?)
            ?.map((e) => CartItem.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'status': status,
        'user_id': userId,
        'updated_at': updatedAt?.toIso8601String(),
        'cart_items': cartItems?.map((e) => e.toJson()).toList(),
      };

  Data copyWith({
    String? id,
    String? status,
    String? userId,
    DateTime? updatedAt,
    List<CartItem>? cartItems,
  }) {
    return Data(
      id: id ?? this.id,
      status: status ?? this.status,
      userId: userId ?? this.userId,
      updatedAt: updatedAt ?? this.updatedAt,
      cartItems: cartItems ?? this.cartItems,
    );
  }

  @override
  List<Object?> get props => [id, status, userId, updatedAt, cartItems];
}
