import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';
import 'package:fonta_app/app/modules/products/screen/widgets/bottom_card_button.dart';
import 'package:fonta_app/app/modules/products/screen/widgets/carousel_images_widget.dart';
import 'package:fonta_app/app/modules/products/screen/widgets/description_widget.dart';
import 'package:fonta_app/app/modules/products/screen/widgets/shipping_widget.dart';
import 'package:fonta_app/app/utils/number_ext.dart';
import 'package:fonta_app/app/utils/string_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DetailProductScreen extends StatefulHookConsumerWidget {
  final DataProduct dataProduct;
  const DetailProductScreen({super.key, required this.dataProduct});

  @override
  ConsumerState<DetailProductScreen> createState() =>
      _DetailProductScreenState();
}

class _DetailProductScreenState extends ConsumerState<DetailProductScreen>
    with SingleTickerProviderStateMixin {
  int currentIndex = 0;
  final CarouselSliderController carouselSliderController =
      CarouselSliderController();
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
        actions: const [],
      ),
      body: ListView(
        children: [
          CarouselImagesWidget(
            dataProduct: widget.dataProduct,
            carouselSliderController: carouselSliderController,
            index: currentIndex,
            onPageChanged: (index, reason) {
              setState(() {
                currentIndex = index;
              });
            },
          ),
          const SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.dataProduct.name ?? '-',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Text(
                  widget.dataProduct.price
                          ?.toDoubleIdFormat()
                          .toFormatRupiah() ??
                      'Rp -',
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: const [
              Tab(text: 'Deskripsi'),
              Tab(text: 'Pengiriman'),
            ],
            labelColor: Colors.blue,
            unselectedLabelColor: Colors.grey,
            indicatorColor: Colors.blue,
          ),
          AnimatedSwitcher(
              duration: const Duration(milliseconds: 0),
              child: _buildTabContent(_tabController.index)),
        ],
      ),
      bottomNavigationBar: ButtomCartButton(
        dataProduct: widget.dataProduct,
      ),
    );
  }

  Widget _buildTabContent(int index) {
    switch (index) {
      case 0:
        return Padding(
          key: const ValueKey<int>(0),
          padding: const EdgeInsets.all(16.0),
          child: DescriptionWidget(
            dataProduct: widget.dataProduct,
          ),
        );
      case 1:
        return Padding(
          key: const ValueKey<int>(1),
          padding: const EdgeInsets.all(16.0),
          child: ShippingWidget(
            dataProduct: widget.dataProduct,
          ),
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
