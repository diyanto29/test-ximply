import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/profile/models/balance_model/data_balance.dart';
import 'package:fonta_app/app/modules/profile/screen/widget/item_balance_points_widget.dart';
import 'package:fonta_app/app/utils/number_ext.dart';
import 'package:fonta_app/app/utils/string_utils.dart';

class BalancePointsWidget extends StatelessWidget {
  const BalancePointsWidget({super.key, this.data});
  final DataBalance? data;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.white,
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ItemBalancePointsWidget(
              icon: Icons.money,
              title: 'Saldo',
              value: data?.balance?.toDoubleIdFormat().toFormatRupiah() ?? '',
            ),
            Container(
              height: 30,
              width: 2,
              color: Colors.black12,
            ),
            ItemBalancePointsWidget(
              icon: Icons.point_of_sale,
              title: 'Coins',
              value: data?.coin ?? '',
            ),
            Container(
              height: 30,
              width: 2,
              color: Colors.black12,
            ),
            ItemBalancePointsWidget(
              icon: Icons.monetization_on,
              title: 'Points',
              value: data?.point?.toDoubleIdFormat().toFormatRupiah() ?? '',
            ),
          ],
        ),
      ),
    );
  }
}
