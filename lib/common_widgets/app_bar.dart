
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/util/colors.dart';
import 'package:click_cart_mart/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({
    super.key,
    required this.navigateBack,
    required this.text,
      this.buttonIcon,
     this.onPressed,
  });
  final bool navigateBack;
  final String text;
  final Function()? onPressed;
  final Widget? buttonIcon;

  @override
  Widget build(BuildContext context) {
    //  final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return SafeArea(
      child: Container(
        height: Dimensions.appbarheight,
        width: width * 1,
        decoration: BoxDecoration(
          color: AppColors.primary_color,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomRight: Radius.circular(50),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: Dimensions.fontSizeExtraLarge,
          ),
          child: Row(
            children: [
              Visibility(
                visible: navigateBack,
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Icon(Icons.arrow_back, color: Colors.white),
                ),
              ),
              SizedBox(width: width * 0.03),
              Padding(
                padding: const EdgeInsets.only(left: 90),
                child: Text(
                  text,
                  style: poppinsRegular.copyWith(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 69),
                child: IconButton(onPressed: onPressed, icon: buttonIcon!),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
