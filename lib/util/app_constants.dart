import 'dart:ui';

import 'package:click_cart_mart/util/dimensions.dart';
import 'package:flutter/material.dart';

class AppConstants {
  static const String hintText = 'Search here...';
  static const String categories = 'Category';
  static const String products = 'Products';
    static const String cartKey = 'cart_items';

}

const poppinsLite = TextStyle(
  fontFamily: 'Poppins',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w300,
);

const poppinsRegular = TextStyle(
  fontFamily: 'Poppins',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w500,
);
const poppinsSemiBold = TextStyle(
  fontFamily: 'Poppins',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w600,
);
const poppinsBold = TextStyle(
  fontFamily: 'Poppins',
  fontSize: Dimensions.fontSizeDefault,
  fontWeight: FontWeight.w700,
);
