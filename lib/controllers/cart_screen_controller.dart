import 'package:click_cart_mart/models/cart_model.dart';
import 'package:click_cart_mart/view/repo/cart_repo.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CartController extends GetxController {
  CartRepo cartRepo;
  CartController({required this.cartRepo, required CartModel cartModel});
  // private variable ..not accessed outside of code  _cartList
  List<CartModel> _cartList = [];
  int _total_Quentity = 0;

  // we make a getter that means access this varibale outside of code
  List<CartModel> get cartList => _cartList;
  int get totalQuantity => _total_Quentity;

  void addToCart(CartModel cartModel) {
    _cartList.add(cartModel);
    cartRepo.addToCartList(_cartList);
    _total_Quentity = _total_Quentity + (cartModel.cart_quantity!);
    update();
  }

  void setQuentity(bool isIncrement, int index) {
    if (isIncrement) {
      _cartList[index].cart_quantity = _cartList[index].cart_quantity! + 1;
      _total_Quentity = _total_Quentity;
    } else {
      if (_cartList[index].cart_quantity! > 1) {
        _cartList[index].cart_quantity = _cartList[index].cart_quantity! - 1;
        _total_Quentity = _total_Quentity;
      }
    }
    cartRepo.addToCartList(_cartList);
    update();
  }

  void removeFromCart(int index) {
    _total_Quentity = _total_Quentity - (cartList[index].cart_quantity!);
    _cartList.removeAt(index);
    cartRepo.addToCartList(_cartList);
    update();
  }

  void clearCartList() {
    _cartList = [];
    _total_Quentity = 0;
    cartRepo.addToCartList(_cartList);
    update();
  }
}
