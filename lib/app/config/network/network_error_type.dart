import 'package:fonta_app/app/config/constants/network_consts.dart';

enum NetworkErrorType {
  serverError,
  unprocessableEntity,
  badRequest,
  validationFailed,
  unauthenticated,
  noConnection,
  timeout,
  undefined,
  notFound,
}

class NetworkErrorTypeParser {
  static NetworkErrorType httpToErrorType(int http) {
    if (http >= 500) return NetworkErrorType.serverError;
    switch (http) {
      case NetworkConsts.noConnectionErrorCode:
        return NetworkErrorType.noConnection;
      case NetworkConsts.connectionTimeoutErrorCode:
        return NetworkErrorType.timeout;
      case 401:
        return NetworkErrorType.unauthenticated;
      case 400:
        return NetworkErrorType.badRequest;
      case 422:
        return NetworkErrorType.unprocessableEntity;
      case 404:
        return NetworkErrorType.notFound;
      default:
        return NetworkErrorType.undefined;
    }
  }

  static Map<NetworkErrorType, String> errorMessages = {
    NetworkErrorType.serverError:
        'Server error occurred, please try again later.',
    NetworkErrorType.unprocessableEntity:
        'Unprocessable entity, please contact support center.',
    NetworkErrorType.badRequest: 'Bad request, please check your input.',
    NetworkErrorType.validationFailed:
        'Validation failed, please correct your data.',
    NetworkErrorType.unauthenticated:
        'User unauthenticated, please login to continue.',
    NetworkErrorType.noConnection:
        'No internet connection, please check your connection and try again.',
    NetworkErrorType.timeout: 'Connection failed, please try again later.',
    NetworkErrorType.undefined: 'Something went wrong, please try again later.',
    NetworkErrorType.notFound: 'Not Found',
  };
}
