
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:click_cart_mart/util/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SearchBarHome extends StatelessWidget {
  const SearchBarHome({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.symmetric(
        //  horizontal: Dimensions.paddingSizeDefault,
        horizontal: 20,
        vertical: Dimensions.paddingSizeSmall,
      ),
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.only(left: Dimensions.paddingSizeSmall),
        height: height * 0.05,
        alignment: Alignment.centerLeft,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          boxShadow: [
            BoxShadow(
              color: Theme.of(context).hintColor.withValues(alpha: .1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, 0),
            ),
          ],
          borderRadius: BorderRadius.circular(Dimensions.paddingSizeExtraSmall),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: AppConstants.hintText,

                  hintStyle: poppinsRegular.copyWith(
                    color: Theme.of(context).hintColor,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: Dimensions.paddingSizeSmall,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(
                  right: Dimensions.paddingSizeSmall,
                ),
                child: Container(
                  height: height * 0.04,
                  width: width * 0.1,
                  decoration: BoxDecoration(
                    color: Colors.black,

                    borderRadius: BorderRadius.circular(
                      Dimensions.paddingSizeExtraSmall,
                    ),
                  ),
                  child: Icon(Icons.search, color: Colors.white),
                ),

                
              ),
            ),
          ],
        ),
      ),
    );
  }
}
