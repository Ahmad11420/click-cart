
import 'package:click_cart_mart/models/category_model.dart';
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/util/app_styles.dart';
import 'package:click_cart_mart/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ClickcartCategoryCotainer extends StatelessWidget {
  const ClickcartCategoryCotainer({super.key, required this.categoryModel});
  final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: Get.width / 4.5,
          decoration: BoxDecoration(
            color: Colors.white54,
            boxShadow: boxShadow,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Padding(
            padding: EdgeInsetsGeometry.all(Dimensions.paddingSizeSmall),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset(
                categoryModel.image ??
                    'assets/images/category_images/placeholder.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.004),
        Center(
          child: Text(
            categoryModel.productName ?? '',
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: poppinsRegular.copyWith(fontSize: Dimensions.fontSizeSmall),
          ),
        ),
      ],
    );
  }
}
