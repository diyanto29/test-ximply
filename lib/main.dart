import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/config/pods/injector_config.dart';
import 'package:fonta_app/app/config/routes/app_router.dart';
import 'package:fonta_app/app/utils/shared_pref.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  final container = ProviderContainer();
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  await SharedPrefs().init();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final _router = AppRouter.getRouter();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 861),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp.router(
            title: 'Fonta App',
            debugShowCheckedModeBanner: false,
            builder: (context, widget) {
              return MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(textScaler: const TextScaler.linear(1.0)),
                child: widget ?? Container(),
              );
            },
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.greenAccent),
            ),
            routeInformationProvider: _router.routeInformationProvider,
            routeInformationParser: _router.routeInformationParser,
            routerDelegate: _router.routerDelegate,
          );
        });
  }
}
