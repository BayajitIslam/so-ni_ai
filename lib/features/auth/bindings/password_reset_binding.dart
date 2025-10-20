// lib/features/auth/bindings/password_reset_binding.dart
import 'package:get/get.dart';
import 'package:template/features/auth/controllers/password_reset_controller.dart';

class PasswordResetBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the PasswordResetController to the Password Reset Screen
    Get.put(PasswordResetController());
  }
}
