import 'dart:convert';


import 'package:click_cart_mart/models/cart_model.dart';
import 'package:click_cart_mart/util/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;
  CartRepo({required this.sharedPreferences});

  // add List

  void addToCartList(List<CartModel> cartProductList) {
    List<String> carts = [];

    for (var cartModel in cartProductList) {
      // convert each CartModel to JSON string

      carts.add(jsonEncode(cartModel));
      // we can write it as carts.add(jsonEncode(cartModel.json));
      // Main concept is that the data in cartModel is in map but we need String actually list of Strings so 
      // we use jsonEncode that will 
    }
    sharedPreferences.setStringList(AppConstants.cartKey, carts);
    // now we have data in list of string such as carts=[''name'='Shirt','price'=78378']
  }
  // get List

  List<CartModel> getCartList() {
    List<String> carts = [];
    if (sharedPreferences.containsKey(AppConstants.cartKey)) {
      carts = sharedPreferences.getStringList(AppConstants.cartKey)!;
    }

    List<CartModel> cartList = [];
    for (var cart in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(cart)));
    }
    return cartList;
  }} 


  