import 'package:flutter/material.dart';
import 'package:fonta_app/app/config/constants/shared_pref_consts.dart';
import 'package:fonta_app/app/config/pods/injector_config.dart';
import 'package:fonta_app/app/config/pods/repositories.dart';
import 'package:fonta_app/app/config/routes/ina_routes_app.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:fonta_app/app/modules/navigation/pods/navigation_pod.dart';
import 'package:fonta_app/app/utils/dialog_builder.dart';
import 'package:fonta_app/app/utils/shared_pref.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'auth_pod.g.dart';

@riverpod
class AuthPod extends _$AuthPod {
  @override
  AsyncValue<void> build() {
    return const AsyncValue.loading();
  }

  void login({required String email, required String password}) async {
    var sharedPrefs = sl<SharedPrefs>();
    LoadingDialog.show(InaRoutesApp.key.currentContext!);
    final res = await ref
        .read(authRepositoryProvider)
        .login(email: email, password: password);
    LoadingDialog.hide(InaRoutesApp.key.currentContext!);
    if (res.error != null) {
      ScaffoldMessenger.of(InaRoutesApp.key.currentContext!)
          .showSnackBar(const SnackBar(
        content: Text(
          'Email atau Password salah!!!',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ));
      state = AsyncValue.error(res.error.toString(), StackTrace.current);
      return;
    }

    sharedPrefs.set(SharedPrefConst.token, res.accessToken);
    GoRouter.of(InaRoutesApp.key.currentContext!)
        .pushReplacementNamed(RouteNames.dashboard);
  }

  void register({
    required String email,
    required String password,
    String? referalCode,
    required String name,
  }) async {
    LoadingDialog.show(InaRoutesApp.key.currentContext!);
    final res = await ref.read(authRepositoryProvider).register(
          email: email,
          password: password,
          name: name,
          referalCode: referalCode,
        );
    LoadingDialog.hide(InaRoutesApp.key.currentContext!);
    if (res.error != null) {
      ScaffoldMessenger.of(InaRoutesApp.key.currentContext!)
          .showSnackBar(const SnackBar(
        content: Text(
          'Register Gagal!',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ));

      return;
    }

    ScaffoldMessenger.of(InaRoutesApp.key.currentContext!)
        .showSnackBar(SnackBar(
      content: Text(
        res.message ?? '',
        style: const TextStyle(
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.green,
    ));
    Future.delayed(const Duration(seconds: 1), () {
      login(email: email, password: password);
    });
  }

  void logout() async {
    var sharedPrefs = sl<SharedPrefs>();
    sharedPrefs.remove(
      SharedPrefConst.token,
    );
    ref
        .read(navigationPodProvider.notifier)
        .setSelectedIndex(InaRoutesApp.key.currentContext!, 0);
  }
}
