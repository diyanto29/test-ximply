import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/cart/models/cart_model/cart_item.dart';
import 'package:fonta_app/app/modules/cart/pods/cart_pod.dart';
import 'package:fonta_app/app/utils/number_ext.dart';
import 'package:fonta_app/app/utils/string_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CartItemWidget extends HookConsumerWidget {
  const CartItemWidget({
    super.key,
    required this.item,
  });

  final CartItem? item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.grey[200],
          backgroundImage: NetworkImage(
            item?.product?.images?.first.imagePath ?? '',
          ),
        ),
        title: Text(item?.product?.name ?? ''),
        subtitle: Text(
            item?.product?.price?.toDoubleIdFormat().toFormatRupiah() ?? ''),
        trailing: SizedBox(
          width: 120.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 12.0,
                child: Center(
                  child: IconButton(
                    onPressed: () =>
                        ref.read(cartPodProvider.notifier).decreaseCart(
                              item?.id ?? '',
                            ),
                    icon: const Icon(
                      Icons.remove,
                      color: Colors.white,
                      size: 9.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  (item?.quantity ?? 0).toString(),
                  style: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
              CircleAvatar(
                backgroundColor: Colors.blueGrey,
                radius: 12.0,
                child: Center(
                  child: IconButton(
                    onPressed: () => ref
                        .read(cartPodProvider.notifier)
                        .addCart(item?.productId ?? '', fromCart: true),
                    icon: const Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 9.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
