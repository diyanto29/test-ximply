import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';
import 'package:fonta_app/app/modules/products/screen/widgets/item_value_widget.dart';
import 'package:fonta_app/app/utils/number_ext.dart';
import 'package:fonta_app/app/utils/string_utils.dart';

class DescriptionWidget extends StatelessWidget {
  const DescriptionWidget({super.key, required this.dataProduct});
  final DataProduct dataProduct;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dataProduct.description ?? '',
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(
          height: 10.0,
        ),
        const Text(
          "Detail",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        ItemValueWidget(
          title: 'Harga Member',
          value: dataProduct.priceMember?.toDoubleIdFormat().toFormatRupiah() ??
              '',
        ),
        ItemValueWidget(
          title: 'SKU',
          value: dataProduct.sku ?? '',
        ),
        ItemValueWidget(
          title: 'Stok',
          value: dataProduct.stock.toString(),
        ),
        ItemValueWidget(
          title: 'Kategori',
          value: dataProduct.category?.name ?? '',
        ),
      ],
    );
  }
}
