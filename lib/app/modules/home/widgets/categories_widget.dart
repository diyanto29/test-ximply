import 'package:flutter/material.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:fonta_app/app/modules/products/models/category_model/data_category.dart';
import 'package:fonta_app/app/utils/colors_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CategoriesWidget extends HookConsumerWidget {
  const CategoriesWidget({super.key, this.data});
  final List<DataCategory>? data;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      controller: ScrollController(),
      child: Row(
        children: List.generate(
          data?.length ?? 0,
          (index) {
            var category = data?[index];
            return InkWell(
              onTap: () => GoRouter.of(context).pushNamed(
                RouteNames.products,
                extra: category,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 8.0,
                ),
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  color: ColorsUtils.getRandomColor(),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(16.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    category?.name ?? '',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
