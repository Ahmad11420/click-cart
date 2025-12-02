
import 'package:click_cart_mart/models/product_model.dart';
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/util/dimensions.dart';
import 'package:click_cart_mart/view/product_detail_screens/cart_screen/cart_screen.dart';
import 'package:click_cart_mart/view/product_detail_screens/widgets/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailSection extends StatelessWidget {
  const ProductDetailSection({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 0.97;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              ' ${productModel.productName}',
              style: poppinsRegular.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: Dimensions.fontSizeExtraLarge,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: Icon(Icons.favorite, color: Colors.deepOrange),
            ),
          ],
        ),
        Row(
          children: [
            //  SizedBox(width: MediaQuery.of(context).size.width * 0.2),
            Text(
              '  Rs - ${productModel.price ?? 'Free'}',
              style: poppinsRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: Theme.of(context).primaryColor,
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),

            Text(
              'Stock - ${productModel.stock ?? '0'} Available',
              style: poppinsRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              '  Rating  ${productModel.rating ?? '4.5'} ',
              style: poppinsRegular.copyWith(
                fontSize: Dimensions.fontSizeDefault,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.02),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 9),
              child: Text(
                '${productModel.description ?? ''} ',
                style: poppinsRegular.copyWith(
                  fontSize: Dimensions.fontSizeDefault,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: width / 5),
        Center(
          child: GestureDetector(onTap: () {
            Get.to(CartScreen());
          }, child: AddToCart(product:productModel ,)),
        ),
      ],
    );
  }
}
