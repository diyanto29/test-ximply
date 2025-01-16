import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/modules/products/models/category_model/data_category.dart';
import 'package:fonta_app/app/modules/products/pods/product_pod.dart';
import 'package:fonta_app/app/utils/number_ext.dart';
import 'package:fonta_app/app/utils/string_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class AllProductScreen extends StatefulHookConsumerWidget {
  const AllProductScreen({super.key, this.category});
  final DataCategory? category;

  @override
  ConsumerState<AllProductScreen> createState() => _AllProductScreenState();
}

class _AllProductScreenState extends ConsumerState<AllProductScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  int currentPage = 0;
  @override
  void initState() {
    Future.microtask(
      () => ref
          .read(productPodProvider.notifier)
          .getProducts(categoryId: widget.category?.id),
    );
    currentPage = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final productPod = ref.watch(productPodProvider);
    final productPodNotifier = ref.watch(productPodProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category != null
            ? widget.category?.name ?? ''
            : 'Semua Produk'),
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          header: const WaterDropHeader(),
          controller: _refreshController,
          onRefresh: () async {
            productPodNotifier
                .getProducts(
              categoryId: widget.category?.id,
            )
                .then((v) {
              _refreshController.refreshCompleted();
              currentPage = 0;
            });
          },
          onLoading: () async {
            productPodNotifier
                .getProducts(
              categoryId: widget.category?.id,
              nextPageUrl: currentPage + 1,
            )
                .then((v) {
              _refreshController.loadComplete();
            });
          },
          child: productPod.when(
            data: (data) {
              currentPage =
                  (productPod.valueOrNull?.paginationProduct?.currentPage ?? 1);
              return GridView.builder(
                padding: EdgeInsets.zero,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.0 / 1.6,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 3,
                ),
                itemCount: data?.allProducts?.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = data?.allProducts?[index];
                  return Card(
                    elevation: 3,
                    color: Colors.white,
                    shadowColor: Colors.black,
                    borderOnForeground: true,
                    child: InkWell(
                      onTap: () {},
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: CachedNetworkImage(
                              imageUrl: item?.images?.first.imagePath ?? '',
                              fit: BoxFit.fitWidth,
                              width: double.infinity,
                              progressIndicatorBuilder:
                                  (context, url, downloadProgress) => Center(
                                child: CircularProgressIndicator(
                                    value: downloadProgress.progress),
                              ),
                              errorWidget: (context, url, error) =>
                                  const Icon(Icons.error),
                            ),
                          ),
                          const SizedBox(
                            height: 8.0,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item?.name ?? '',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  item?.category?.name ?? '',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4.0,
                                ),
                                Text(
                                  item?.price
                                          ?.toDoubleIdFormat()
                                          .toFormatRupiah() ??
                                      '-',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            error: (error, state) => Text(
              error.toString(),
            ),
            loading: () => const Center(
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        ),
      ),
    );
  }
}
