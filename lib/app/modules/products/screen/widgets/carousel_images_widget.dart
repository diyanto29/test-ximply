import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarouselImagesWidget extends HookConsumerWidget {
  const CarouselImagesWidget({
    super.key,
    required this.dataProduct,
    required this.carouselSliderController,
    required this.index,
    this.onPageChanged,
  });
  final DataProduct dataProduct;
  final CarouselSliderController carouselSliderController;
  final int index;
  final Function(int index, CarouselPageChangedReason reason)? onPageChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: carouselSliderController,
          options: CarouselOptions(
              height: 200.0,
              autoPlay: true,
              enlargeCenterPage: false,
              viewportFraction: 1.0,
              onPageChanged: onPageChanged),
          items: dataProduct.images?.map((imageUrl) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: const BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.all(
                      Radius.circular(6.0),
                    ),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrl.imagePath ?? '',
                    fit: BoxFit.cover,
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dataProduct.images!.asMap().entries.map((entry) {
            bool isSelected = index == entry.key;
            return GestureDetector(
              onTap: () => carouselSliderController.animateToPage(entry.key),
              child: Container(
                width: isSelected ? 40 : 6.0,
                height: 6.0,
                margin: const EdgeInsets.only(
                  right: 6.0,
                  top: 12.0,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? Colors.blueAccent
                      : Colors.blueAccent.withOpacity(0.6),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(12.0),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
