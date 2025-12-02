
import 'package:click_cart_mart/view/home_screen/home_screen.dart';
import 'package:click_cart_mart/view/product_detail_screens/cart_screen/cart_screen.dart';
import 'package:click_cart_mart/view/profile_screen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController.addListener(() {
      int currentPage=pageController.page?.round() ?? 0;
      if (pageIndex.value != currentPage) {
        pageIndex.value=currentPage;
        
      }
    },);
  }

  var pageIndex = 0.obs;

  final PageController pageController = PageController();

  final List<Widget> screens = [HomeScreen(), CartScreen(), ProfileScreen()];
  void setPage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
