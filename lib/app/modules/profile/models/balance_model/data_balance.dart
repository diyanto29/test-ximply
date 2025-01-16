import 'package:equatable/equatable.dart';

class DataBalance extends Equatable {
  final String? balance;
  final String? coin;
  final String? point;

  const DataBalance({this.balance, this.coin, this.point});

  factory DataBalance.fromJson(Map<String, dynamic> json) => DataBalance(
        balance: json['balance'] as String?,
        coin: json['coin'] as String?,
        point: json['point'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'balance': balance,
        'coin': coin,
        'point': point,
      };

  DataBalance copyWith({
    String? balance,
    String? coin,
    String? point,
  }) {
    return DataBalance(
      balance: balance ?? this.balance,
      coin: coin ?? this.coin,
      point: point ?? this.point,
    );
  }

  @override
  List<Object?> get props => [balance, coin, point];
}
