import 'package:get/get.dart';
import 'package:template/features/auth/controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController(), fenix: true);
  }
}
