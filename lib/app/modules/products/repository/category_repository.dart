import 'package:fonta_app/app/config/constants/endpoint.dart';
import 'package:fonta_app/app/config/network/remote_data_source.dart';
import 'package:fonta_app/app/modules/products/models/category_model/category_model.dart';
import 'package:fonta_app/app/modules/products/models/category_model/data_category.dart';

class CategoryRepository {
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<({String? error, List<DataCategory>? categories})>
      getCategory() async {
    final response = await remoteDataSource.get(path: Endpoint.categories);
    return response.fold(
        (left) => (error: left.message.toString(), categories: null), (right) {
      CategoryModel categoryModel = CategoryModel.fromJson(right?.data);
      return (error: null, categories: categoryModel.data);
    });
  }
}
