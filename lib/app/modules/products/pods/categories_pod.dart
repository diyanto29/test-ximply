import 'package:fonta_app/app/config/pods/repositories.dart';
import 'package:fonta_app/app/modules/products/models/category_model/data_category.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'categories_pod.g.dart';

@riverpod
class CategoriesPod extends _$CategoriesPod {
  @override
  AsyncValue<List<DataCategory>?> build() {
    return const AsyncLoading();
  }

  void getCategory() async {
    final response = await ref.read(categoryRepositoryProvider).getCategory();
    if (response.error != null) {
      state = AsyncValue.error(response.error.toString(), StackTrace.current);
      return;
    }
    state = AsyncValue.data(response.categories);
  }
}
