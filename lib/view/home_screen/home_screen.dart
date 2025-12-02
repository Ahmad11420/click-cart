import 'package:click_cart_mart/common_widgets/app_bar.dart';
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/util/dimensions.dart';
import 'package:click_cart_mart/view/home_screen/custom_widget/carousel_slider.dart';
import 'package:click_cart_mart/view/home_screen/custom_widget/clickCart_CategoryView.dart';
import 'package:click_cart_mart/view/home_screen/custom_widget/product_view.dart';
import 'package:click_cart_mart/view/home_screen/custom_widget/search_bar.dart';
import 'package:click_cart_mart/view/home_screen/custom_widget/sliver_persistent.dart';
import 'package:click_cart_mart/view/product_detail_screens/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//  import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();
    //   final ProductsController productsController = Get.put(ProductsController());

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: RefreshIndicator(
          onRefresh: () async {
            print('print data ');
            return;
          },
          child: Column(
            children: [
              CartAppBar(
                navigateBack: true,
                text: 'Home',
                buttonIcon: Icon(Icons.shopping_bag, color: Colors.white),
                onPressed: () {
                  Get.to(() => CartScreen());
                },
              ),

              Expanded(
                child: CustomScrollView(
                  controller: scrollController,
                  slivers: [
                    SliverPersistentHeader(
                      floating: true,
                      delegate: MySliverDelegate(
                        child: SearchBarHome(),
                        height: Dimensions.appbarheight,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          MyCarouselSlider(),
                          SizedBox(height: Dimensions.paddingSizeLarge),
                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              AppConstants.categories,
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                          ),
                          ClickcartCategoryview(),
                          SizedBox(height: Dimensions.paddingSizeDefault),

                          Padding(
                            padding: const EdgeInsets.only(left: 12),
                            child: Text(
                              AppConstants.products,
                              style: TextStyle(
                                fontSize: Dimensions.fontSizeLarge,
                              ),
                            ),
                          ),
                          // Center(
                          //   child: ElevatedButton(
                          //     onPressed: () {
                          //       productsController.addProductToFirestore();
                          //     },
                          //     child: Text('Add'),
                          //   ),
                          // ),
                          ProductView(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
