// lib/features/auth/controllers/forgot_password_controller.dart
import 'package:get/get.dart';
import 'package:flutter/foundation.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;

  // Reset password action (simulated)
  void resetPassword() {
    if (email.isNotEmpty) {
      // Add your reset password logic here (e.g., API call)
      debugPrint("Password reset email sent to: $email");
    } else {
      debugPrint("Email is missing");
    }
  }
}
