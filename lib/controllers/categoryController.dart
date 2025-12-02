
import 'package:click_cart_mart/models/category_model.dart';
import 'package:click_cart_mart/util/app_images.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Categorycontroller extends GetxController {
  // We will make a colletion reference where the data  will be store

  CollectionReference catrgoryReferance = FirebaseFirestore.instance.collection(
    'Category',
  );
     // data sending to Firebase 
  void addCategoryToFireStore() {
    String categoryId = catrgoryReferance.doc().id;

    CategoryModel category = CategoryModel(
      id: categoryId,
      image: AppImages.womenShoes4,
      productName: 'Revive Heels RE87',
    );
    final data = category.toJson();

    catrgoryReferance
        .doc(categoryId)
        .set(data)
        .then(
          (value) => Get.snackbar('Success', 'Category Added Successfully'),
        );
  }

  // Data Fetching from Firebase
       //Stream --> Continuous data flow
      // snapshot --> Actual data at a point when we fetch it 
   Stream<List<CategoryModel>> loadCategory(){
    return catrgoryReferance.snapshots().map((snapshot){
      return snapshot.docs.map((doc){
        return CategoryModel.fromJson(doc.data() as Map<String, dynamic>);
      }).toList();
    });
   }

}
