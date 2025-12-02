
import 'package:click_cart_mart/models/product_model.dart';
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/util/app_styles.dart';
import 'package:click_cart_mart/util/dimensions.dart';
import 'package:click_cart_mart/view/product_detail_screens/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductContainerView extends StatelessWidget {
  const ProductContainerView({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    final height = Get.height;
    return GestureDetector(
      onTap: () {
        Get.to(() => ProductDetailScreen(productModel: productModel));
      },

      child: Column(
        children: [
          Container(
            height: height * 0.3,
            width: height * 0.3,
            decoration: BoxDecoration(
              color: Colors.white54,
              boxShadow: boxShadow,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(5),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  productModel.image ??
                      'assets/images/category_images/placeholder.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 6.0),
              child: Column(
                children: [
                  Text(
                    '   ${productModel.productName ?? ''}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: poppinsRegular.copyWith(
                      fontSize: Dimensions.fontSizeSmall,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        ' Rs- ${productModel.price ?? 'price invalid'}',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: poppinsRegular.copyWith(
                          fontSize: Dimensions.fontSizeSmall,
                          color: Colors.red,
                        ),
                      ),
                      // IconButton(
                      //   onPressed: () {},
                      //   icon: Icon(Icons.trolley, color: Colors.green, size: 5),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
