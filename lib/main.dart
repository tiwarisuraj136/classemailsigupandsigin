import 'package:classemailsigupandsigin/pages/home/home_page_view.dart';
import 'package:classemailsigupandsigin/pages/login/login_page_view.dart';
import 'package:classemailsigupandsigin/routing/get_pages.dart';
import 'package:classemailsigupandsigin/routing/routes_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
       initialRoute: RoutesConstant.login,
      getPages: getpages,);
  }
}
