import 'product_model.dart';

class CartModel {
  String? cart_id;
  String? cart_image;
  String? cart_name;
  double? cart_price;
  int? cart_quantity = 1;
  ProductModel? cart_productModel;

  CartModel({
    this.cart_id,
    this.cart_image,
    this.cart_name,
    this.cart_price,
    this.cart_quantity = 1,
    this.cart_productModel,
  });

  // 🔹 Convert to Map (for Firestore or local DB)
  Map<String, dynamic> toMap() {
    return {
      'cart_id': cart_id,
      'cart_image': cart_image,
      'cart_name': cart_name,
      'cart_price': cart_price,
      'cart_quantity': cart_quantity,
      'cart_productModel': cart_productModel?.toMap(),
    };
  }

  // 🔹 Create from Map (for Firestore snapshots)
  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      cart_id: map['cart_id'],
      cart_image: map['cart_image'],
      cart_name: map['cart_name'],
      cart_price: (map['cart_price'] is int)
          ? (map['cart_price'] as int).toDouble()
          : map['cart_price']?.toDouble(),
      cart_quantity: map['cart_quantity'] ?? 1,
      cart_productModel: map['cart_productModel'] != null
          ? ProductModel.fromMap(
              Map<String, dynamic>.from(map['cart_productModel']),
            )
          : null,
    );
  }

  // 🔹 Convert to JSON (for APIs or local storage)
  Map<String, dynamic> toJson() {
    return {
      'cart_id': cart_id,
      'cart_image': cart_image,
      'cart_name': cart_name,
      'cart_price': cart_price,
      'cart_quantity': cart_quantity,
      'cart_productModel': cart_productModel?.toMap(),
    };
  }

  // 🔹 Create from JSON (for APIs or file storage)
  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      cart_id: json['cart_id'],
      cart_image: json['cart_image'],
      cart_name: json['cart_name'],
      cart_price: (json['cart_price'] is int)
          ? (json['cart_price'] as int).toDouble()
          : json['cart_price']?.toDouble(),
      cart_quantity: json['cart_quantity'] ?? 1,
      cart_productModel: json['cart_productModel'] != null
          ? ProductModel.fromMap(
              Map<String, dynamic>.from(json['cart_productModel']),
            )
          : null,
    );
  }
}
