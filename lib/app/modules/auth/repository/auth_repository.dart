import 'package:fonta_app/app/config/constants/endpoint.dart';
import 'package:fonta_app/app/config/network/remote_data_source.dart';

class AuthRepository {
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<({String? error, String? accessToken})> login(
      {required String email, required String password}) async {
    final response = await remoteDataSource.post(path: Endpoint.login, data: {
      "email": email,
      "password": password,
    });
    return response.fold(
        (left) => (error: left.message.toString(), accessToken: null), (right) {
      return (
        error: null,
        accessToken: right?.data['data']['access_token'].toString()
      );
    });
  }

  Future<({String? error, String? message})> register({
    required String email,
    required String password,
    String? referalCode,
    required String name,
  }) async {
    final response =
        await remoteDataSource.post(path: Endpoint.register, data: {
      "name": name,
      "email": email,
      "password": password,
      "password_confirmation": password,
      "is_whatsapp": false,
      "referral_code": referalCode,
    });
    return response.fold(
        (left) => (error: left.message.toString(), message: null), (right) {
      return (error: null, message: right?.data['message'].toString());
    });
  }
}
