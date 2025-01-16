import 'package:fonta_app/app/config/constants/endpoint.dart';
import 'package:fonta_app/app/config/network/remote_data_source.dart';
import 'package:fonta_app/app/modules/profile/models/balance_model/balance_model.dart';
import 'package:fonta_app/app/modules/profile/models/balance_model/data_balance.dart';
import 'package:fonta_app/app/modules/profile/models/profile_model/data_profile.dart';
import 'package:fonta_app/app/modules/profile/models/profile_model/profile_model.dart';

class ProfileRepository {
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<({String? error, DataProfile? profile})> getProfile() async {
    final response = await remoteDataSource.get(
      path: Endpoint.profle,
    );
    return response.fold(
        (left) => (error: left.message.toString(), profile: null), (right) {
      ProfileModel profileModel = ProfileModel.fromJson(right?.data);
      return (error: null, profile: profileModel.data);
    });
  }

  Future<({String? error, DataBalance? balance})> getBalance() async {
    final response = await remoteDataSource.get(
      path: Endpoint.balance,
    );
    return response.fold(
        (left) => (error: left.message.toString(), balance: null), (right) {
      BalanceModel balanceModel = BalanceModel.fromJson(right?.data);
      return (error: null, balance: balanceModel.data);
    });
  }
}
