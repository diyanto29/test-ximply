import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/modules/home/widgets/app_bar_search_home_widget.dart';
import 'package:fonta_app/app/modules/home/widgets/categories_widget.dart';
import 'package:fonta_app/app/modules/home/widgets/title_all_product_widget.dart';
import 'package:fonta_app/app/modules/products/pods/categories_pod.dart';
import 'package:fonta_app/app/modules/products/pods/product_pod.dart';
import 'package:fonta_app/app/modules/products/screen/widgets/card_product_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends StatefulHookConsumerWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.microtask(() {
      ref.read(categoriesPodProvider.notifier).getCategory();
      ref.read(productPodProvider.notifier).getProductHome();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final categoryPod = ref.watch(categoriesPodProvider);
    final productPod = ref.watch(productPodProvider);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const AppBarSearchHome(),
        actions: const [],
      ),
      body: ListView(
        padding: EdgeInsets.all(16.h),
        children: [
          categoryPod.when(
            data: (data) {
              return CategoriesWidget(
                data: data,
              );
            },
            error: (error, state) => Text(
              error.toString(),
            ),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const TitleAllProductWidget(),
          const SizedBox(
            height: 20.0,
          ),
          productPod.when(
            data: (data) {
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0 / 1.6,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 3,
                ),
                itemCount: data?.homeProducts?.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = data?.homeProducts?[index];
                  return CardProductWidget(item: item);
                },
              );
            },
            error: (error, state) => Text(
              error.toString(),
            ),
            loading: () =>
                const Center(child: CircularProgressIndicator.adaptive()),
          ),
        ],
      ),
    );
  }
}
