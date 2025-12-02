
import 'package:click_cart_mart/controllers/sign_up_controller.dart';
import 'package:click_cart_mart/view/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final SignUpController signUpController = Get.put(SignUpController());
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Form(
        key: signUpController.formKey,
        child: Stack(
          children: [
            Container(
              height: height,
              width: width,
              decoration: BoxDecoration(color: Colors.blue),
            ),
            Positioned(
              bottom: 0,

              child: Container(
                height: height * 0.5,
                width: width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 15,
                      color: Colors.lightBlue,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 21,
              child: Container(
                height: height * 0.7,
                width: width * .9,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(17),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      blurRadius: .4,
                      color: Colors.lightBlue,
                      blurStyle: BlurStyle.normal,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.85,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                        controller: signUpController.nameController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          labelText: 'Name',
                          hintText: 'Enter your name',
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.85,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                        controller: signUpController.phoneController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          labelText: 'Phone Number',
                          hintText: 'Enter your Phone Number',
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 20,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.85,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                        controller: signUpController.emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          labelText: 'Email',
                          hintText: 'Enter your Email',
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.03),
                    SizedBox(
                      height: height * 0.07,
                      width: width * 0.85,
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'This Field is required';
                          }
                          return null;
                        },
                        controller: signUpController.passwordController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          labelText: 'Password',
                          hintText: 'Enter your Password',
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.05),
                    Obx(
                      () => signUpController.isLoading.value
                          ? Center(child: CircularProgressIndicator())
                          : GestureDetector(
                              onTap: () {
                                if (signUpController.formKey.currentState!
                                    .validate()) {
                                  signUpController.signUp(
                                    name: signUpController.nameController.text
                                        .trim(),
                                    phone: signUpController.phoneController.text
                                        .trim(),
                                    email: signUpController.emailController.text
                                        .trim(),
                                    password: signUpController
                                        .passwordController
                                        .text,
                                  );
                                }
                              },
                              child: Container(
                                height: height * 0.06,
                                width: width * 0.85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: Colors.blueAccent,
                                ),
                                child: Center(
                                  child: Text(
                                    'Enter',
                                    style: GoogleFonts.aBeeZee(
                                      fontSize: height * 0.023,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 50, top: 20),
                      child: Row(
                        children: [
                          Text('Already have account then'),
                          InkWell(
                            onTap: () {
                              Get.to(LoginScreen());
                            },
                            child: Text(
                              ' Sign in',
                              style: GoogleFonts.aBeeZee(
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
