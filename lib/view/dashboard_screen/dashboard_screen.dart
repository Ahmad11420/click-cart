
import 'package:click_cart_mart/controllers/dashboard_controller.dart';
import 'package:click_cart_mart/util/app_images.dart';
import 'package:click_cart_mart/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  final DashboardController dashboardController = Get.put(
    DashboardController(),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: dashboardController.pageIndex.value,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          selectedItemColor: AppColors.primary_color,
          unselectedItemColor: AppColors.primary_color,
          onTap: (value) {
            dashboardController.setPage(value);
          },
          items: [
            _barItem(
              AppImages.menShoes1,
              'Home',
              0,
              dashboardController,
              context,
            ),
            _barItem(
              AppImages.menShoes1,
              'Cart',
              1,
              dashboardController,
              context,
            ),
            _barItem(
              AppImages.menShoes1,
              'Pofile',
              2,
              dashboardController,
              context,
            ),
          ],
        ),
      ),
      body: PageView.builder(
        controller: dashboardController.pageController,
        itemCount: dashboardController.screens.length,
        itemBuilder: (context, index) {
          return dashboardController.screens[index];
        },
      ),
    );
  }
}

BottomNavigationBarItem _barItem(
  String image,
  String label,
  int index,
  DashboardController controller,
  BuildContext context,
) {
  return BottomNavigationBarItem(
    icon: Obx(
      () => SizedBox(
        width: 20,
        child: Image.asset(
          image,
          color: index == controller.pageIndex.value
              ? Theme.of(context).primaryColor
              : AppColors.greycolor,
        ),
      ),
    ),
    label: label,
  );
}
