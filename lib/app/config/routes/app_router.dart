import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fonta_app/app/config/routes/ina_routes_app.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:fonta_app/app/config/routes/routes_path.dart';
import 'package:fonta_app/app/modules/auth/screen/login_screen.dart';
import 'package:fonta_app/app/modules/auth/screen/register_screen.dart';
import 'package:fonta_app/app/modules/navigation/screen/navigation_screen.dart';
import 'package:fonta_app/app/modules/products/models/category_model/data_category.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';
import 'package:fonta_app/app/modules/products/screen/all_product_screen.dart';
import 'package:fonta_app/app/modules/products/screen/detail_product_screen.dart';
import 'package:fonta_app/app/modules/splash/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static GoRouter getRouter({List<NavigatorObserver>? observers}) {
    return GoRouter(
      debugLogDiagnostics: kDebugMode,
      navigatorKey: InaRoutesApp.key,
      routes: <GoRoute>[
        GoRoute(
          name: RouteNames.splash,
          path: '/',
          builder: (context, state) => const SplashScreen(),
        ),
        GoRoute(
          name: RouteNames.login,
          path: RoutesPath.login,
          builder: (context, state) => const LoginScreen(),
        ),
        GoRoute(
          name: RouteNames.register,
          path: RoutesPath.register,
          builder: (context, state) => const RegisterScreen(),
        ),
        GoRoute(
            name: RouteNames.products,
            path: RoutesPath.products,
            builder: (context, state) {
              final category = state.extra as DataCategory?;
              return AllProductScreen(category: category);
            },
            routes: [
              GoRoute(
                name: RouteNames.detailProduct,
                path: RoutesPath.detailProduct,
                builder: (context, state) {
                  final dataProduct = state.extra as DataProduct;
                  return DetailProductScreen(dataProduct: dataProduct);
                },
              ),
            ]),
        GoRoute(
          name: RouteNames.dashboard,
          path: RoutesPath.dashboard,
          builder: (context, state) => const NavigationScreen(),
        ),
      ],
      observers: observers,
    );
  }
}
