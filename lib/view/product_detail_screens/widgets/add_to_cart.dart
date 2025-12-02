import 'package:click_cart_mart/controllers/cart_screen_controller.dart';
import 'package:click_cart_mart/models/cart_model.dart';
import 'package:click_cart_mart/models/product_model.dart';
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key, required this.product});
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.97;
    CartModel cartModel = CartModel(
      cart_id: product.id,
      cart_image: product.image,
      cart_name: product.productName,
      cart_price: double.tryParse(product.price ?? '0') ?? 0.0,
      cart_quantity: 1,
      cart_productModel: product,
    );

    return GestureDetector(
      onTap: () {
        Get.find<CartController>().addToCart(cartModel);
        Get.snackbar(
          'Added',
          'Added to Cart',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blue.withValues(alpha: 0.4),
        );
      },
      child: Container(
        width: width,
        height: width / 5,
        decoration: BoxDecoration(
          color: Colors.blue.withValues(alpha: 0.3),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Add To Cart',
              style: poppinsRegular.copyWith(
                fontSize: Dimensions.fontSizeLarge,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
