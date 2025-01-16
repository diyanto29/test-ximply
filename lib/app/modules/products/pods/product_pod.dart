import 'package:equatable/equatable.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fonta_app/app/config/pods/repositories.dart';
import 'package:fonta_app/app/modules/products/models/product_model/product_model.dart';

part 'product_pod.g.dart';

@Riverpod(keepAlive: true)
class ProductPod extends _$ProductPod {
  @override
  AsyncValue<ProductViewModel?> build() {
    return const AsyncLoading();
  }

  void getProductHome() async {
    state = const AsyncLoading();
    final res = await ref.read(productRepositoryProvider).getProducts();
    if (res.error != null) {
      state = AsyncValue.error(res.error.toString(), StackTrace.current);
      return;
    }
    state = AsyncValue.data(ProductViewModel(
      homeProducts: res.productModel?.data?.dataProduct ?? [],
    ));
  }

  Future getProducts({String? categoryId, int? nextPageUrl}) async {
    state = state.copyWithPrevious(const AsyncValue.loading());
    if (nextPageUrl != null) {
      PaginationProduct? paginationProduct =
          state.valueOrNull?.paginationProduct;
      if (paginationProduct?.currentPage == paginationProduct?.total) {
        return;
      }
      await _handleGetProduct(categoryId: categoryId, nextPageUrl: nextPageUrl);
    } else {
      await _handleGetProduct(categoryId: categoryId, nextPageUrl: nextPageUrl);
    }
  }

  Future _handleGetProduct({String? categoryId, int? nextPageUrl}) async {
    final res = await ref.read(productRepositoryProvider).getProducts(
          categoryId: categoryId,
          nextPageUrl: nextPageUrl,
        );
    if (nextPageUrl == null) {
      if (res.error != null) {
        state = AsyncValue.error(res.error.toString(), StackTrace.current);
        return;
      }
      state = AsyncValue.data(state.valueOrNull?.copyWith(
        allProducts: res.productModel?.data?.dataProduct ?? [],
        paginationProduct: res.productModel?.data,
      ));
    } else {
      List<DataProduct> prevProducts = state.valueOrNull?.allProducts ?? [];
      prevProducts = [
        ...prevProducts,
        ...(res.productModel?.data?.dataProduct ?? [])
      ];
      state = AsyncValue.data(state.valueOrNull?.copyWith(
        allProducts: prevProducts,
        paginationProduct: res.productModel?.data,
      ));
    }
  }
}

class ProductViewModel extends Equatable {
  final List<DataProduct>? allProducts;
  final List<DataProduct>? homeProducts;
  final PaginationProduct? paginationProduct;

  const ProductViewModel({
    this.allProducts,
    this.homeProducts,
    this.paginationProduct,
  });

  @override
  List<Object?> get props => [allProducts, homeProducts, paginationProduct];

  ProductViewModel copyWith({
    List<DataProduct>? allProducts,
    List<DataProduct>? homeProducts,
    PaginationProduct? paginationProduct,
  }) {
    return ProductViewModel(
      allProducts: allProducts ?? this.allProducts,
      homeProducts: homeProducts ?? this.homeProducts,
      paginationProduct: paginationProduct ?? this.paginationProduct,
    );
  }
}
