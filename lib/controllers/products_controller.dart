
import 'package:click_cart_mart/models/product_model.dart';
import 'package:click_cart_mart/util/app_images.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductsController extends GetxController {
  CollectionReference productsReferance = FirebaseFirestore.instance.collection(
    'Products',
  );

  void addProductToFirestore() {
    String productId = productsReferance.doc().id;

    ProductModel product = ProductModel(
      id: productId,
      image: AppImages.base,
      productName: 'Base',
      categoryName: "Cosmatics",
      price: '2999',
    );

    final data = product.toMap();

    productsReferance
        .doc(productId)
        .set(data)
        .then((value) => Get.snackbar('Success', 'Product Added Successfully'));
  }

  Stream<List<ProductModel>> loadProduct() {
    return productsReferance.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        return ProductModel.fromMap(doc.data() as Map<String, dynamic>);
      }).toList();
    });
  }
}
