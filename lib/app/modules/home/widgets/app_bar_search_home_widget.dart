import 'package:flutter/material.dart';

class AppBarSearchHome extends StatelessWidget {
  const AppBarSearchHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 12.0,
      ),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: const BorderRadius.all(
          Radius.circular(12.0),
        ),
        border: Border.all(
          width: 1.0,
          color: Colors.grey[400]!,
        ),
      ),
      child: Row(
        children: [
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.search),
          ),
          Expanded(
            child: TextFormField(
              initialValue: null,
              decoration: const InputDecoration.collapsed(
                filled: true,
                fillColor: Colors.transparent,
                hoverColor: Colors.transparent,
                hintText: "Cari Produk disni..",
              ),
              onFieldSubmitted: (value) {},
            ),
          ),
        ],
      ),
    );
  }
}
