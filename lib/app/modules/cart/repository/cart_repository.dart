import 'package:fonta_app/app/config/constants/endpoint.dart';
import 'package:fonta_app/app/config/network/remote_data_source.dart';
import 'package:fonta_app/app/modules/cart/models/cart_model/cart_item.dart';
import 'package:fonta_app/app/modules/cart/models/cart_model/cart_model.dart';

class CartRepository {
  final RemoteDataSource remoteDataSource = RemoteDataSource();

  Future<({String? error, List<CartItem>? cartItems})> getCart() async {
    final response = await remoteDataSource.get(
      path: Endpoint.carts,
    );
    return response.fold(
        (left) => (error: left.message.toString(), cartItems: null), (right) {
      CartModel cartModel = CartModel.fromJson(right?.data);
      return (error: null, cartItems: cartModel.data?.cartItems ?? []);
    });
  }

  Future<({String? error, String? message})> addCart({
    required String productId,
  }) async {
    final response = await remoteDataSource.post(path: Endpoint.carts, data: {
      'product_id': productId,
      'quantity': 1,
    });
    return response.fold(
        (left) => (error: left.message.toString(), message: null), (right) {
      return (error: null, message: right?.data['message'].toString());
    });
  }

  Future<({String? error, String? message})> decreaseCart({
    required String cartItemId,
  }) async {
    final response = await remoteDataSource.post(
      path: Endpoint.decreaseCart(cartItemId),
    );
    return response.fold(
        (left) => (error: left.message.toString(), message: null), (right) {
      return (error: null, message: right?.data['message'].toString());
    });
  }
}
