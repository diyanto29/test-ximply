import 'package:equatable/equatable.dart';
import 'package:fonta_app/app/config/network/network_error_type.dart';

class ResponseMessage extends Equatable {
  final String message;
  final bool status;
  final dynamic data;
  final int statusCode;
  final NetworkErrorType? type;
  final String? meta;

  const ResponseMessage({
    required this.statusCode,
    required this.message,
    required this.status,
    this.data,
    this.type,
    this.meta,
  });

  @override
  List<Object?> get props => [
        message,
        status,
        data,
        statusCode,
        type,
        meta,
      ];
}
