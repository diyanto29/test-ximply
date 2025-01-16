import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fonta_app/app/config/routes/routes_names.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';
import 'package:fonta_app/app/utils/number_ext.dart';
import 'package:fonta_app/app/utils/string_utils.dart';
import 'package:go_router/go_router.dart';

class CardProductWidget extends StatelessWidget {
  const CardProductWidget({
    super.key,
    required this.item,
  });

  final DataProduct? item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      color: Colors.white,
      shadowColor: Colors.black,
      borderOnForeground: true,
      child: InkWell(
        onTap: () => GoRouter.of(context)
            .pushNamed(RouteNames.detailProduct, extra: item),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                imageUrl: item?.images?.first.imagePath ?? '',
                fit: BoxFit.fitWidth,
                width: double.infinity,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                  child: CircularProgressIndicator(
                      value: downloadProgress.progress),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
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
                    item?.price?.toDoubleIdFormat().toFormatRupiah() ?? '-',
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
  }
}
