
import 'package:click_cart_mart/auth/authentication_services.dart';
import 'package:click_cart_mart/view/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey();
  Rx<bool> isLoading = false.obs;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void clearfields() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    passwordController.clear();
  }

  // @override
  // void onClose() {
  //   // TODO: implement onClose
  //   super.onClose();
  //   nameController.dispose();
  //   phoneController.dispose();
  //   emailController.dispose();
  //   passwordController.dispose();
  // }

  void signUp({
    required String name,
    required String phone,
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    // Call the authentication
    User? user = await AppAuthServices.signUpUserToApp(
      email: email,
      password: password,
    );

    if (user != null) {
      print('The user id ---> ${user.uid}');
      isLoading.value = false;
      Get.snackbar('Success', 'User Registered Successfully');

      Get.to(() => LoginScreen());

      clearfields();
    } else {
      isLoading.value = false;
      Get.snackbar('Sign Up Failed', 'Unable to register user');
    }
  }
}
