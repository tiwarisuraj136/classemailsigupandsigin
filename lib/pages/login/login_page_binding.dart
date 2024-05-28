import 'package:get/get.dart';
import 'login_page_controller.dart';

class loginPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(LoginController());
    // TODO: implement dependencies
  }

}