import 'package:get/get.dart';
import 'package:template/features/auth/controllers/forgot_password_controller.dart';

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController(), fenix: true);
  }
}
