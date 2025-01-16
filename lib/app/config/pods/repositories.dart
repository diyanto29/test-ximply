import 'package:fonta_app/app/modules/auth/repository/auth_repository.dart';
import 'package:fonta_app/app/modules/cart/repository/cart_repository.dart';
import 'package:fonta_app/app/modules/products/repository/category_repository.dart';
import 'package:fonta_app/app/modules/products/repository/product_repository.dart';
import 'package:fonta_app/app/modules/profile/repository/profile_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoryRepositoryProvider =
    Provider<CategoryRepository>((ref) => CategoryRepository());

final productRepositoryProvider =
    Provider<ProductRepository>((ref) => ProductRepository());
final authRepositoryProvider =
    Provider<AuthRepository>((ref) => AuthRepository());
final cartRepositoryProvider =
    Provider<CartRepository>((ref) => CartRepository());
final profileRepositoryProvider =
    Provider<ProfileRepository>((ref) => ProfileRepository());
