
import 'package:click_cart_mart/models/product_model.dart';
import 'package:click_cart_mart/view/product_detail_screens/widgets/detail_product.dart';
import 'package:click_cart_mart/view/product_detail_screens/widgets/image_screen.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key,required this.productModel});
  final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    ScrollController customController=ScrollController();

    return   Scaffold(
      body: CustomScrollView(
         controller: customController,
         slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                 //product Image Section 
                ImageSection(productModel: productModel),
                 // protuct detail Section 
                 ProductDetailSection(productModel:productModel),
                
              ],
            ),
          )
         ],
      ),
    );
  }
}