import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/cart/pods/cart_pod.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ButtomCartButton extends HookConsumerWidget {
  const ButtomCartButton({
    super.key,
    required this.dataProduct,
  });
  final DataProduct dataProduct;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 45,
      child: TextButton(
        onPressed: () =>
            ref.read(cartPodProvider.notifier).addCart(dataProduct.id ?? ''),
        style: TextButton.styleFrom(
          backgroundColor: Colors.green,
          shape: const RoundedRectangleBorder(),
        ),
        child: const Text(
          "Masukan Keranjang",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
