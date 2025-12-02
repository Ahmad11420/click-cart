import 'package:click_cart_mart/common_widgets/my_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppAuthServices {
  static final FirebaseAuth auth = FirebaseAuth.instance;

 static  Future<User?> signUpUserToApp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (ae) {
      if (ae.code == "invalid-email") {
        showToast(message: 'This email is invalid use another one');
      }
      if (ae.code == "email-already-in-use") {
        showToast(message: 'The email already exists try different email');
      }
      if (ae.code == 'weak-password') {
        showToast(message: 'The password is weak');
      }
    } catch (e) {
      print('Execption Occured ------> $e ');
      showToast(message: 'Somthing going wrong');
    }
    return null;
  }
  static  Future<User?> loginUserToApp({
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (ae) {
      if (ae.code == "invalid-email") {
        showToast(message: 'This email is invalid try another one');
      }
      if (ae.code == "user-not-found") {
        showToast(message: 'User not found try another');
      }
      if (ae.code == 'wrong-password') {
        showToast(message: 'Password is wrong');
      }
    } catch (e) {
      print('Execption Occured ------> $e ');
      showToast(message: 'Somthing going wrong');
    }
    return null;
  }
}
