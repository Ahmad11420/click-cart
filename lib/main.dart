import 'package:click_cart_mart/controllers/cart_screen_controller.dart';
import 'package:click_cart_mart/firebase_options.dart';
import 'package:click_cart_mart/models/cart_model.dart';
import 'package:click_cart_mart/util/colors.dart';
import 'package:click_cart_mart/view/repo/cart_repo.dart';
import 'package:click_cart_mart/view/sign_up_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_notifier.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final sharedPreferences = await SharedPreferences.getInstance();

  Get.lazyPut(() => sharedPreferences);
  Get.put(
    CartController(
      cartRepo: CartRepo(sharedPreferences: Get.find()),
     
      cartModel: CartModel(),
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Click Cart',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary_color),
      ),
      home: SignUpScreen(),
      // home: ZSharedpref(),
    );
  }
}
