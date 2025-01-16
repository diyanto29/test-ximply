import 'dart:convert';
import 'dart:developer';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:fonta_app/app/config/constants/network_consts.dart';
import 'package:fonta_app/app/config/constants/shared_pref_consts.dart';
import 'package:fonta_app/app/config/network/dio_services.dart';
import 'package:fonta_app/app/config/network/network_error_type.dart';
import 'package:fonta_app/app/config/network/response_message.dart';
import 'package:fonta_app/app/config/pods/injector_config.dart';
import 'package:fonta_app/app/config/routes/ina_routes_app.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:fonta_app/app/utils/shared_pref.dart';
import 'package:go_router/go_router.dart';

class RemoteDataSource extends DioService {
  RemoteDataSource();

  Future<Either<ResponseMessage, Response?>> _handleRequest(
      Future<Response> Function() request) async {
    try {
      final response = await request();
      final code = response.statusCode ?? 0;
      if (code >= 200 && code <= 299) {
        return Right(response);
      }

      log(code.toString(), name: 'aaa');
      if (code == 401) {
        sl<SharedPrefs>().remove(SharedPrefConst.token);
        GoRouter.of(InaRoutesApp.key.currentContext!).goNamed(RouteNames.login);
      }

      if (code == 500) {
        return Left(_handleErrorResponse(response));
      }

      return Left(_handleErrorResponse(response));
    } on DioException catch (e) {
      return Left(_handleException(e));
    }
  }

  ResponseMessage _handleErrorResponse(Response response) {
    final int statusCode =
        response.statusCode ?? response.data['response_code'] ?? 0;
    final type = NetworkErrorTypeParser.httpToErrorType(statusCode);

    if (response.data is Map<String, dynamic>) {
      return ResponseMessage(
        message: _getErrorMessage(response.data),
        status: false,
        statusCode: statusCode,
        data: response.data['message'],
        type: type,
      );
    } else {
      return ResponseMessage(
        message: _getErrorMessage(response.data),
        status: false,
        statusCode: statusCode,
        data: jsonDecode(response.data.toString())['message'],
        type: type,
      );
    }
  }

  ResponseMessage _handleException(dynamic e) {
    if (e is DioException) {
      final type =
          NetworkErrorTypeParser.httpToErrorType(_getErrorCodeByType(e));
      if (e.response?.data is Map<String, dynamic>) {
        return ResponseMessage(
          message: e.response?.data['message'],
          status: false,
          statusCode: e.response?.statusCode ?? _getErrorCodeByType(e),
          type: type,
        );
      } else {
        return ResponseMessage(
          message: _getErrorMessage(e.response?.data),
          status: false,
          statusCode: e.response?.statusCode ?? _getErrorCodeByType(e),
          data: jsonDecode(e.response!.toString())['meta']['debug_param'],
          type: type,
        );
      }
    }

    return ResponseMessage(
      message: NetworkConsts.unknownErrorMessage,
      status: false,
      statusCode: 500,
      type: NetworkErrorTypeParser.httpToErrorType(500),
    );
  }

  Future<Either<ResponseMessage, Response?>> get({
    required String path,
    Map<String, dynamic>? queryParameters,
    String language = '',
  }) async {
    return _handleRequest(() async => dio.get(
          path,
          queryParameters: queryParameters,
          options: await _getHeaderOptions(),
        ));
  }

  Future<Either<ResponseMessage, Response?>> post({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return _handleRequest(() async => dio.post(
          path,
          queryParameters: queryParameters,
          options: await _getHeaderOptions(),
          data: data,
        ));
  }

  Future<Either<ResponseMessage, Response?>> delete({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return _handleRequest(() async => dio.delete(
          path,
          queryParameters: queryParameters,
          options: await _getHeaderOptions(),
          data: data,
        ));
  }

  Future<Either<ResponseMessage, Response?>> put({
    required String path,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async {
    return _handleRequest(() async => dio.put(
          path,
          queryParameters: queryParameters,
          options: await _getHeaderOptions(),
          data: data,
        ));
  }

  Future<Either<ResponseMessage, Response?>> downloadFile({
    required String path,
    ProgressCallback? onReceiveProgress,
  }) async {
    return _handleRequest(() async => dio.get(
          path,
          options: Options(responseType: ResponseType.bytes),
          onReceiveProgress: onReceiveProgress,
        ));
  }

  Future<Either<ResponseMessage, Response?>> postFormData({
    required String path,
    required String filePath,
    Map<String, dynamic>? queryParameters,
  }) async {
    return _handleRequest(() async {
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
      });
      return dio.post(
        path,
        queryParameters: queryParameters,
        options: await _getHeaderOptions(),
        data: formData,
      );
    });
  }

  Future<String> _getBearerToken() async {
    try {
      var token = sl<SharedPrefs>().get(SharedPrefConst.token);
      return 'Bearer $token';
    } catch (e) {
      return '';
    }
  }

  Future<Options> _getHeaderOptions() async {
    return Options(headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': await _getBearerToken(),
    });
  }

  String _getErrorMessage(dynamic data,
      {NetworkErrorType type = NetworkErrorType.undefined}) {
    if (data != null && data is Map<String, dynamic>) {
      if (data['message'] != null) {
        return '${data['message']}';
      }
    } else if (data != null && data is String) {
      return jsonDecode(data.toString())['message'];
    }
    if (type != NetworkErrorType.undefined) {
      return NetworkErrorTypeParser.errorMessages[type] ??
          NetworkConsts.unknownErrorMessage;
    }
    return NetworkConsts.unknownErrorMessage;
  }

  int _getErrorCodeByType(DioException e) {
    switch (e.type) {
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionTimeout:
        return NetworkConsts.connectionTimeoutErrorCode;
      default:
        return NetworkConsts.noConnectionErrorCode;
    }
  }
}
