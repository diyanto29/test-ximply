import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';
import 'package:fonta_app/app/modules/products/screen/widgets/item_value_widget.dart';

class ShippingWidget extends StatelessWidget {
  const ShippingWidget({super.key, required this.dataProduct});
  final DataProduct dataProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Informasi pengiriman: Produk akan dikirim dalam waktu 2-3 hari kerja. Detail pengiriman lebih lanjut dapat ditambahkan.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "Dimensi Produk",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ItemValueWidget(
            title: 'Berat',
            value: (dataProduct.shipping?.weight ?? 0).toString()),
        ItemValueWidget(
            title: 'Panjang',
            value: (dataProduct.shipping?.length ?? 0).toString()),
        ItemValueWidget(
            title: 'Lebar',
            value: (dataProduct.shipping?.width ?? 0).toString()),
        ItemValueWidget(
            title: 'Tinggi',
            value: (dataProduct.shipping?.height ?? 0).toString()),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "Kurir",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: ScrollController(),
          child: Row(
            children: List.generate(
              dataProduct.shippers?.length ?? 0,
              (index) {
                var item = dataProduct.shippers?[index];

                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 8.0,
                  ),
                  margin: const EdgeInsets.only(right: 10.0),
                  decoration: const BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.all(
                      Radius.circular(16.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      item?.name ?? '',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
