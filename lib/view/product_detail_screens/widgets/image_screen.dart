import 'package:click_cart_mart/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Container(
          height: screenWidth + 100,
          width: screenWidth,
          decoration: BoxDecoration(color: Theme.of(context).cardColor),
        ),
        Container(
          height: screenWidth + 40,
          width: screenWidth,
          decoration: BoxDecoration(
            color: Colors.blue.withValues(alpha: 0.3),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(screenWidth / 2),
              bottomLeft: Radius.circular(screenWidth / 2),
            ),
          ),
        ),
        Positioned(
          top: 5,
          bottom: 20,
          left: 0,
          right: 0,
          child: Image.asset(
            productModel.trans_image ??
                'assets/images/category_images/placeholder.jpg',
            scale: .05,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: 20,
          // left: 10,
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
      ],
    );
  }
}
