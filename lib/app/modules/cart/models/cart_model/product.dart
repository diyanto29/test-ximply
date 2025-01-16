import 'package:equatable/equatable.dart';

import 'image.dart';

class Product extends Equatable {
  final String? id;
  final String? name;
  final String? status;
  final String? sku;
  final String? description;
  final String? price;
  final String? priceMember;
  final int? stock;
  final dynamic createdBy;
  final String? categoryId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Image>? images;

  const Product({
    this.id,
    this.name,
    this.status,
    this.sku,
    this.description,
    this.price,
    this.priceMember,
    this.stock,
    this.createdBy,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as String?,
        name: json['name'] as String?,
        status: json['status'] as String?,
        sku: json['sku'] as String?,
        description: json['description'] as String?,
        price: json['price'] as String?,
        priceMember: json['price_member'] as String?,
        stock: json['stock'] as int?,
        createdBy: json['created_by'] as dynamic,
        categoryId: json['category_id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => Image.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'status': status,
        'sku': sku,
        'description': description,
        'price': price,
        'price_member': priceMember,
        'stock': stock,
        'created_by': createdBy,
        'category_id': categoryId,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
        'images': images?.map((e) => e.toJson()).toList(),
      };

  Product copyWith({
    String? id,
    String? name,
    String? status,
    String? sku,
    String? description,
    String? price,
    String? priceMember,
    int? stock,
    dynamic createdBy,
    String? categoryId,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Image>? images,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      sku: sku ?? this.sku,
      description: description ?? this.description,
      price: price ?? this.price,
      priceMember: priceMember ?? this.priceMember,
      stock: stock ?? this.stock,
      createdBy: createdBy ?? this.createdBy,
      categoryId: categoryId ?? this.categoryId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      images: images ?? this.images,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      status,
      sku,
      description,
      price,
      priceMember,
      stock,
      createdBy,
      categoryId,
      createdAt,
      updatedAt,
      images,
    ];
  }
}
