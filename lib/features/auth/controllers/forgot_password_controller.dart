// lib/features/auth/controllers/forgot_password_controller.dart
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var email = ''.obs;

  // Reset password action (simulated)
  void resetPassword() {
    if (email.isNotEmpty) {
      // Add your reset password logic here (e.g., API call)
      print("Password reset email sent to: $email");
    } else {
      print("Email is missing");
    }
  }
}
