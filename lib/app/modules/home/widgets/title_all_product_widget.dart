import 'package:flutter/material.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:go_router/go_router.dart';

class TitleAllProductWidget extends StatelessWidget {
  const TitleAllProductWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "Semua Produk",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        TextButton(
          onPressed: () => GoRouter.of(context).pushNamed(RouteNames.products),
          child: const Text(
            "Lihat Semua",
            style: TextStyle(
              color: Colors.blue,
            ),
          ),
        ),
      ],
    );
  }
}
