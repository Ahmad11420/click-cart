
import 'package:click_cart_mart/auth/authentication_services.dart';
import 'package:click_cart_mart/view/dashboard_screen/dashboard_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  Rx<bool> isLoading = false.obs;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void clearfields() {
    emailController.clear();
    passwordController.clear();
  }

  void logIn({required String email, required String password}) async {
    isLoading.value = true;
    // Call the authentication
    User? user = await AppAuthServices.loginUserToApp(
      email: email,
      password: password,
    );

    if (user != null) {
      print('The user id ---> ${user.uid}');
      isLoading.value = false;
      Get.snackbar('Success', 'Welcome Back ');
      Get.to(() => DashboardScreen());
      clearfields();
    } else {
      isLoading.value = false;
      Get.snackbar('Sign Up Failed', 'Unable to register user');
    }
  }
}
