import 'package:click_cart_mart/controllers/cart_quantity_controller.dart';
import 'package:click_cart_mart/controllers/cart_screen_controller.dart';
import 'package:click_cart_mart/models/cart_model.dart';
import 'package:click_cart_mart/view/repo/cart_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuantityContainer extends StatelessWidget {
  const QuantityContainer({
    super.key,
    required this.cartModel,
    required this.cartRepo,
    required this.index,
  });
  final CartModel cartModel;
  final CartRepo cartRepo;
  final int index;
  @override
  Widget build(BuildContext context) {
    final cartController = Get.put(
      CartController(cartModel: cartModel, cartRepo: cartRepo),
    );

    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      width: MediaQuery.of(context).size.width * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          SizedBox(height: 4),

          InkWell(
            onTap: () {
              cartController.setQuentity(true, index);
            },
            child: Text('+'),
          ),
          SizedBox(height: 19),
          InkWell(
            onTap: () {
              cartController.setQuentity(false, index);
            },
            child: Text('_'),
          ),
        ],
      ),
    );
  }
}
