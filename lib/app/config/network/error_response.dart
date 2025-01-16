import 'package:equatable/equatable.dart';
import 'package:fonta_app/app/config/network/network_error_type.dart';
import 'package:fonta_app/app/config/network/response_message.dart';

class ErrorResponse extends Equatable {
  final String? message;
  final int? statusCode;
  final NetworkErrorType? type;

  const ErrorResponse({
    this.message,
    this.statusCode,
    this.type,
  });

  @override
  List<Object?> get props => [
        message,
        statusCode,
        type,
      ];

  static ErrorResponse fromResponseMessage(ResponseMessage err) {
    return ErrorResponse(
      message: err.message,
      statusCode: err.statusCode,
      type: err.type,
    );
  }
}
