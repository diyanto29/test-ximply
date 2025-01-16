import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/cart/pods/cart_pod.dart';
import 'package:fonta_app/app/modules/cart/screen/widgets/cart_item_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartScreen extends StatefulHookConsumerWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  void initState() {
    Future.microtask(() => ref.read(cartPodProvider.notifier).getCart());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartPod = ref.watch(cartPodProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Keranjang"),
        actions: const [],
      ),
      body: cartPod.when(
        data: (data) {
          if (data?.isEmpty == true) {
            return const Center(  
              child: Text('Belum ada Produk diKerjanjang'),
            );
          }
          return ListView.builder(
            itemCount: data?.length,
            padding: const EdgeInsets.all(16),
            physics: const ScrollPhysics(),
            itemBuilder: (BuildContext context, int index) {
              var item = data?[index];
              return CartItemWidget(item: item);
            },
          );
        },
        error: (error, state) => Text(
          error.toString(),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),
    );
  }
}
