import 'package:equatable/equatable.dart';
import 'package:fonta_app/app/config/pods/repositories.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:fonta_app/app/modules/profile/models/balance_model/data_balance.dart';
import 'package:fonta_app/app/modules/profile/models/profile_model/data_profile.dart';

part 'profile_pod.g.dart';

@Riverpod(keepAlive: true)
class ProfilePod extends _$ProfilePod {
  @override
  AsyncValue<ProfileViewModel?> build() {
    return const AsyncLoading();
  }

  void getProfile() async {
    final res = await ref.read(profileRepositoryProvider).getProfile();
    final balanceRes = await ref.read(profileRepositoryProvider).getBalance();
    if (res.error != null) {
      state = AsyncValue.error(res.error.toString(), StackTrace.current);
      return;
    }

    state = AsyncValue.data(
        ProfileViewModel(profile: res.profile, balance: balanceRes.balance));
  }
}

class ProfileViewModel extends Equatable {
  final DataProfile? profile;
  final DataBalance? balance;

  const ProfileViewModel({required this.profile, required this.balance});

  ProfileViewModel copyWith({
    DataProfile? profile,
    DataBalance? balance,
  }) {
    return ProfileViewModel(
      profile: profile ?? this.profile,
      balance: balance ?? this.balance,
    );
  }

  @override
  List<Object?> get props => [profile, balance];
}
