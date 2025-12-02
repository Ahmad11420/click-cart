import 'package:click_cart_mart/util/colors.dart';
import 'package:flutter/rendering.dart';

var boxShadow = [
  BoxShadow(
    color: AppColors.darkShadow,
    offset: const Offset(2.0, 2.0),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  ),
  BoxShadow(
    color: AppColors.lightShadow,
    offset: const Offset(-2.0, -2.0),
    blurRadius: 2.0,
    spreadRadius: 2.0,
  ),
];
