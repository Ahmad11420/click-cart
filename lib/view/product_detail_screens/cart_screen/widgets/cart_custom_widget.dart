import 'package:click_cart_mart/controllers/cart_quantity_controller.dart';
import 'package:click_cart_mart/controllers/cart_screen_controller.dart';
import 'package:click_cart_mart/models/cart_model.dart';
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/view/product_detail_screens/cart_screen/widgets/quantity_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/route_manager.dart';

class CartCustomWidget extends StatelessWidget {
  const CartCustomWidget({
    super.key,
    required this.cartModel,
    required this.index,
  });

  final CartModel cartModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    final cartQuantityController = Get.put(
      CartQuantityController(cartModel: cartModel),
    );
    //  int? quantity_cart(){
    //   int? quantity=cartModel.cart_quantity;

    //   sets
    //  }
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.width;

    return Dismissible(
      key: UniqueKey(),
      onDismissed: (DismissDirection direction) {
        Get.find<CartController>().removeFromCart(index);
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: const Color.from(
                alpha: 1,
                red: 0.62,
                green: 0.62,
                blue: 0.62,
              ).withValues(alpha: 0.2),
            ),
            width: width * 0.9,
            height: width / 3,

            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 2.5, top: 8),
                      child: Container(
                        height: height * 0.2,
                        width: width * 0.3,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          image: DecorationImage(
                            image: AssetImage(cartModel.cart_image!),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsGeometry.only(bottom: 25, top: 8),
                      child: Column(
                        children: [
                          Text(
                            cartModel.cart_name!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            'Rs/ ${cartModel.cart_price.toString()}',
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GetBuilder<CartQuantityController>(
                            builder: (_) {
                              return Text(
                                'Quantity = ${cartModel.cart_quantity}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                          GetBuilder<CartQuantityController>(
                            builder: (_) {
                              return Text(
                                'Price = ${cartQuantityController.newPrice(cartModel)}',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 28),
                    //   child: GetBuilder<CartController>(
                    //     init: Get.find<CartController>(),
                    //     builder: (_) {
                    //       return SizedBox(
                    //         width: 48,
                    //         child: Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: const [
                    //             Icon(Icons.remove, size: 20),
                    //             SizedBox(height: 4),
                    //             Icon(Icons.add, size: 20),
                    //           ],
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 28),
                      child: QuantityContainer(
                        cartModel: cartModel,
                        cartRepo: Get.find<CartController>().cartRepo,
                        index: index,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
