
import 'package:classemailsigupandsigin/services/authFunctions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_page_controller.dart';

class homePageView extends GetView<HomeController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
               await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.leave_bags_at_home),
          ),
        ],
        title: const Text('Home'),
      ),
      body: const SafeArea(
        child: Center(
          child: Text("Welcome HomePage"),
        ),
      ),
    );
  }

}