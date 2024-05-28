import 'package:classemailsigupandsigin/pages/login/login_page_controller.dart';
import 'package:get/get.dart';

class homePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
    // TODO: implement dependencies
  }

}