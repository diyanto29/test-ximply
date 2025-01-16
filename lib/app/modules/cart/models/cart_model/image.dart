import 'package:equatable/equatable.dart';

class Image extends Equatable {
  final String? id;
  final String? productId;
  final String? imagePath;
  final int? isDefault;
  final dynamic deletedAt;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Image({
    this.id,
    this.productId,
    this.imagePath,
    this.isDefault,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        id: json['id'] as String?,
        productId: json['product_id'] as String?,
        imagePath: json['image_path'] as String?,
        isDefault: json['is_default'] as int?,
        deletedAt: json['deleted_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'product_id': productId,
        'image_path': imagePath,
        'is_default': isDefault,
        'deleted_at': deletedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };

  Image copyWith({
    String? id,
    String? productId,
    String? imagePath,
    int? isDefault,
    dynamic deletedAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Image(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      imagePath: imagePath ?? this.imagePath,
      isDefault: isDefault ?? this.isDefault,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      productId,
      imagePath,
      isDefault,
      deletedAt,
      createdAt,
      updatedAt,
    ];
  }
}
