import 'dart:developer';

import 'package:fonta_app/app/config/constants/endpoint.dart';
import 'package:fonta_app/app/config/network/remote_data_source.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';

class ProductRepository {
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<({String? error, ProductModel? productModel})> getProducts(
      {String? categoryId, int? nextPageUrl, String order = 'asc'}) async {
    log(nextPageUrl.toString(), name: 'test');
    String path = nextPageUrl != null
        ? '${Endpoint.products}?page=$nextPageUrl'
        : Endpoint.products;
    final response = await remoteDataSource.get(path: path, queryParameters: {
      if (categoryId != null) "category_id": categoryId,
    });
    return response
        .fold((left) => (error: left.message.toString(), productModel: null),
            (right) {
      ProductModel productModel = ProductModel.fromJson(right?.data);
      return (error: null, productModel: productModel);
    });
  }
}
