import 'package:equatable/equatable.dart';

import 'product.dart';

class CartItem extends Equatable {
  final String? id;
  final int? quantity;
  final String? productId;
  final dynamic productVariantId;
  final String? cartId;
  final String? userId;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final Product? product;

  const CartItem({
    this.id,
    this.quantity,
    this.productId,
    this.productVariantId,
    this.cartId,
    this.userId,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
    this.product,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) => CartItem(
        id: json['id'] as String?,
        quantity: json['quantity'] as int?,
        productId: json['product_id'] as String?,
        productVariantId: json['product_variant_id'] as dynamic,
        cartId: json['cart_id'] as String?,
        userId: json['user_id'] as String?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        product: json['product'] == null
            ? null
            : Product.fromJson(json['product'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'quantity': quantity,
        'product_id': productId,
        'product_variant_id': productVariantId,
        'cart_id': cartId,
        'user_id': userId,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'product': product?.toJson(),
      };

  CartItem copyWith({
    String? id,
    int? quantity,
    String? productId,
    dynamic productVariantId,
    String? cartId,
    String? userId,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
    Product? product,
  }) {
    return CartItem(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      productId: productId ?? this.productId,
      productVariantId: productVariantId ?? this.productVariantId,
      cartId: cartId ?? this.cartId,
      userId: userId ?? this.userId,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      product: product ?? this.product,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      quantity,
      productId,
      productVariantId,
      cartId,
      userId,
      deletedAt,
      createdAt,
      updatedAt,
      product,
    ];
  }
}
