import 'package:click_cart_mart/models/cart_model.dart';
import 'package:get/get.dart';

class CartQuantityController extends GetxController {
  CartQuantityController({required this.cartModel});
  final CartModel cartModel;
  void incrementQuantity(CartModel cartModel) {
    cartModel.cart_quantity = cartModel.cart_quantity! + 1;
    update();
  }

  void decrementQuantity(CartModel cartModel) {
    if (cartModel.cart_quantity! > 1) {
      cartModel.cart_quantity = cartModel.cart_quantity! - 1;
      update();
    }
  }

  double newPrice(CartModel cartModel) {
    double newPrice = cartModel.cart_quantity! * cartModel.cart_price!;
    return newPrice;
  }
}
