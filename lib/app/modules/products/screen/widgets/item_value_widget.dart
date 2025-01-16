import 'package:flutter/material.dart';

class ItemValueWidget extends StatelessWidget {
  const ItemValueWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
          Text(
            value,
            style: const TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
