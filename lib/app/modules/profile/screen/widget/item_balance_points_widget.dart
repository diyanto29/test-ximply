import 'package:flutter/material.dart';

class ItemBalancePointsWidget extends StatelessWidget {
  const ItemBalancePointsWidget({
    super.key,
    this.title,
    this.value,
    required this.icon,
  });

  final String? title;
  final String? value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Icon(icon),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          value ?? '',
          style: const TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title ?? '',
          style: const TextStyle(
            fontSize: 11.0,
          ),
        ),
      ],
    );
  }
}