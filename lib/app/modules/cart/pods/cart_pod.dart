import 'package:flutter/material.dart';
import 'package:fonta_app/app/config/pods/repositories.dart';
import 'package:fonta_app/app/config/routes/ina_routes_app.dart';
import 'package:fonta_app/app/modules/cart/models/cart_model/cart_item.dart';
import 'package:fonta_app/app/utils/dialog_builder.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cart_pod.g.dart';

@riverpod
class CartPod extends _$CartPod {
  @override
  AsyncValue<List<CartItem>?> build() {
    return const AsyncValue.loading();
  }

  void getCart() async {
    state = const AsyncLoading();
    final res = await ref.read(cartRepositoryProvider).getCart();
    if (res.error != null) {
      state = AsyncValue.error(res.error.toString(), StackTrace.current);
      return;
    }
    state = AsyncValue.data(res.cartItems);
  }

  void addCart(String productId, {bool fromCart = false}) async {
    LoadingDialog.show(InaRoutesApp.key.currentContext!);
    final res = await ref.read(cartRepositoryProvider).addCart(
          productId: productId,
        );
    LoadingDialog.hide(InaRoutesApp.key.currentContext!);
    if (res.error != null) {
      ScaffoldMessenger.of(InaRoutesApp.key.currentContext!)
          .showSnackBar(SnackBar(
        content: Text(
          res.error ?? '',
          style: const TextStyle(
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
    if (fromCart) {
      getCart();
    }
  }

  void decreaseCart(
    String cartItemId,
  ) async {
    LoadingDialog.show(InaRoutesApp.key.currentContext!);
    final res = await ref.read(cartRepositoryProvider).decreaseCart(
          cartItemId: cartItemId,
        );
    LoadingDialog.hide(InaRoutesApp.key.currentContext!);
    if (res.error != null) {
      ScaffoldMessenger.of(InaRoutesApp.key.currentContext!)
          .showSnackBar(SnackBar(
        content: Text(
          res.error ?? '',
          style: const TextStyle(
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
    getCart();
  }
}
