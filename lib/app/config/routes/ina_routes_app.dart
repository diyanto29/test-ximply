import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InaRoutesApp {
  InaRoutesApp._();

  static GlobalKey<NavigatorState> key =
      GlobalKey<NavigatorState>(debugLabel: 'root');

  static GlobalKey<NavigatorState> shellKey =
      GlobalKey<NavigatorState>(debugLabel: 'shell');

  static BuildContext? get context => key.currentContext;

  static String get pathUrl =>
      GoRouter.of(key.currentContext!).routeInformationProvider.value.uri.path;
  static List<String> get pathSegments => GoRouter.of(key.currentContext!)
      .routeInformationProvider
      .value
      .uri
      .pathSegments;
  static Map<String, String> get queryParameters =>
      GoRouter.of(key.currentContext!)
          .routeInformationProvider
          .value
          .uri
          .queryParameters;
}
