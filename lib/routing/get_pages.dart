import 'package:classemailsigupandsigin/pages/home/home_page_binding.dart';
import 'package:classemailsigupandsigin/pages/home/home_page_view.dart';
import 'package:classemailsigupandsigin/pages/login/login_page_binding.dart';
import 'package:classemailsigupandsigin/pages/login/login_page_view.dart';
import 'package:classemailsigupandsigin/routing/routes_constant.dart';
import 'package:get/get.dart';

List<GetPage> getpages = [
  GetPage(
      name: RoutesConstant.login,
      page: () => LoginForm(),
    binding: loginPageBinding(),
  ),

  GetPage(
   name: RoutesConstant.home,
    page: () => homePageView(),
    binding: homePageBinding(),
  ),





];