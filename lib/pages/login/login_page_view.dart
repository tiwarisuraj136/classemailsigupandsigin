import 'package:classemailsigupandsigin/pages/login/login_page_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends GetView<LoginController>{
  const LoginForm({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Login'),
        backgroundColor: Colors.teal,
      ),
      body: Form(
        key: controller.formKey,
        child: Container(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ======== Full Name ========
              Obx(() => controller.login.value
                  ? Container()
                  : TextFormField(
                key: const ValueKey('fullname'),
                decoration: const InputDecoration(
                  hintText: 'Enter Full Name',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Full Name';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  controller.fullname.value = value!;
                },
              )),

              // ======== Email ========
              TextFormField(
                key: const ValueKey('email'),
                decoration: const InputDecoration(
                  hintText: 'Enter Email',
                ),
                validator: (value) {
                  if (value!.isEmpty || !value.contains('@')) {
                    return 'Please Enter valid Email';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  controller.email.value = value!;
                },
              ),
              // ======== Password ========
              TextFormField(
                key: const ValueKey('password'),
                obscureText: true,
                decoration: const InputDecoration(
                  hintText: 'Enter Password',
                ),
                validator: (value) {
                  if (value!.length < 6) {
                    return 'Please Enter Password of min length 6';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  controller.password.value = value!;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.submit(),
                    child: Obx(() => Text(controller.login.value ? 'Login' : 'Signup'))),
              ),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: () {
                    controller.toggleLogin();
                  },
                  child: Obx(() => Text(controller.login.value
                      ? "Don't have an account? Signup"
                      : "Already have an account? Login")))
            ],
          ),
        ),
      ),
    );
  }
}
