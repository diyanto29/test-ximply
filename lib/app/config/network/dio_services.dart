import 'package:dio/dio.dart';
import 'package:fonta_app/app/config/constants/endpoint.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioService {
  DioService();
  Dio get dio => _dio();
  Dio _dio() {
    final options = BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      baseUrl: Endpoint.baseUrl,
      validateStatus: (status) {
        return status! <= 500;
      },
    );

    final dio = Dio(options);

    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));
    return dio;
  }
}
