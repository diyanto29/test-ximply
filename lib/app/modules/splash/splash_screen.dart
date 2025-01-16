import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fonta_app/app/config/constants/image_consts.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreen extends StatefulHookConsumerWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  Future initSplash() async {
    Future.microtask(() {
      Timer(const Duration(seconds: 1), () {
        GoRouter.of(context).pushReplacementNamed(RouteNames.dashboard);
      });
    });
  }

  @override
  void initState() {
    initSplash();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          ImageConsts.logo,
        ),
      ),
    );
  }
}
