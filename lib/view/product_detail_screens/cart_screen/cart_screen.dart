import 'package:click_cart_mart/common_widgets/app_bar.dart';
import 'package:click_cart_mart/controllers/cart_screen_controller.dart';
import 'package:click_cart_mart/view/home_screen/home_screen.dart';
import 'package:click_cart_mart/view/product_detail_screens/cart_screen/widgets/cart_custom_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: CartAppBar(
            navigateBack: true,
            text: 'Carts',
            buttonIcon: Icon(Icons.card_travel_outlined, color: Colors.white),
            // onPressed: () {
            //   Get.to(() => HomeScreen());
            // },
          ),
        ),
        body: GetBuilder<CartController>(
          builder: (controller) {
            double itemPrice = 0;
            double deliveryFee = 200;
            for (var cartModel in controller.cartList) {
              itemPrice =
                  itemPrice +
                  (cartModel.cart_price! * cartModel.cart_quantity!);
            }
            double subTotal = itemPrice;
            double total = subTotal + deliveryFee;

            return controller.cartList.isNotEmpty
                ? Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: controller.cartList.length,
                          itemBuilder: (context, index) {
                            final cartItem = controller.cartList[index];
                            return Padding(
                              padding: const EdgeInsets.only(top: 20, left: 15),
                              child: CartCustomWidget(
                                cartModel: cartItem,
                                index: index,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Item Price: Rs ${itemPrice.toStringAsFixed(0)}',
                            ),
                            Text(
                              'Delivery Fee: Rs ${deliveryFee.toStringAsFixed(0)}',
                            ),
                            Text(
                              'Total: Rs ${total.toStringAsFixed(0)}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Center(child: Text('Cart is Empty'));
          },
        ),
      ),
    );
  }
}
