import 'package:equatable/equatable.dart';

class DataCategory extends Equatable {
  final String? id;
  final String? name;

  const DataCategory({this.id, this.name});

  factory DataCategory.fromJson(Map<String, dynamic> json) => DataCategory(
        id: json['id'] as String?,
        name: json['name'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
      };

  DataCategory copyWith({
    String? id,
    String? name,
  }) {
    return DataCategory(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}
