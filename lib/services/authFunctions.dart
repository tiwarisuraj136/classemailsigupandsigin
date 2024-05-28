import 'package:classemailsigupandsigin/pages/login/login_page_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebaseFunctions.dart';

class AuthServices {
  FirebaseAuth auth = FirebaseAuth.instance;


  static signupUser(
      String email, String password, String name) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      await FirebaseAuth.instance.currentUser!.updateDisplayName(name);
      await FirebaseAuth.instance.currentUser!.updateEmail(email);
      await FirestoreServices.saveUser(name, email, userCredential.user!.uid);
      Get.snackbar("SuccessFul","Registration Successful");
      Get.toNamed("home_page_view.dart");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Warning", "Password Provided is too weak");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Warning", "Email Provided already Exists");
      }
    } catch (e) {
      Get.snackbar('Warning', 'Invalid Credential');
    }
  }

  static signinUser(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Get.snackbar("SuccessFul","You are Logged in");
      Get.toNamed("home_page_view.dart");

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.snackbar("Warning", "No user Found with this Email");
      } else if (e.code == 'wrong-password') {
        Get.snackbar("Warning", "Password did not match");
      }
    }
  }




  // Sign out method
  Future<void> signOut() async {
    await auth.signOut();
    Get.offAll(() => const LoginForm());
  }




}
