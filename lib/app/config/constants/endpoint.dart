class Endpoint {
  static const String baseUrl = 'https://api.fonta.dev.ximply.io/v1/';

  static const String login = 'auth/login';
  static const String profle = 'auth/me';
  static const String register = 'auth/register';
  static const String balance = 'balance';
  static const String logout = 'auth/logout';
  static const String categories = 'categories';
  static const String products = 'products';
  static const String carts = 'carts';
  static String decreaseCart(String? cartItemId) =>
      'cart-items/$cartItemId/decrease-quantity';
}
