// import 'package:click_cart_mart/common_widgets/app_bar.dart';
// import 'package:flutter/material.dart';

// class CategoryScreen extends StatelessWidget {
//   const CategoryScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(kToolbarHeight),
//         child: CartAppBar(
//           navigateBack: true,
//           text: 'Categories',
//           buttonIcon: Icon(Icons.category, color: Colors.white),
//         ),
//       ),
//       body: Column(
//         children: [

//         ],
//       ),
//     );
//   }
// }

import 'package:click_cart_mart/controllers/categoryController.dart';
import 'package:click_cart_mart/view/home_screen/custom_widget/clickcart_category_cotainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});
  final Categorycontroller categorycontroller = Get.put(Categorycontroller());
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: categorycontroller.loadCategory(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final categories = snapshot.data!;
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return ClickcartCategoryCotainer(categoryModel: categories[index]);
          },
        );
      },
    );
  }
}
