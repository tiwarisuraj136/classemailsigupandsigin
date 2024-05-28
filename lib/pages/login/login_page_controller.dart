import 'package:classemailsigupandsigin/services/authFunctions.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  var email = ''.obs;
  var password = ''.obs;
  var fullname = ''.obs;
  var login = false.obs;

  void toggleLogin() {
    login.value = !login.value;
  }



  void submit() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      login.value
          ? await AuthServices.signinUser(email.value, password.value)
          : await AuthServices.signupUser(
          email.value, password.value, fullname.value);
    }
  }
}
