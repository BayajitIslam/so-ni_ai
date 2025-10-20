// lib/features/auth/controllers/password_reset_controller.dart
import 'package:get/get.dart';

class PasswordResetController extends GetxController {
  var newPassword = ''.obs;
  var confirmPassword = ''.obs;

  // Reset Password action (simulated)
  void resetPassword() {
    if (newPassword.isNotEmpty && confirmPassword.isNotEmpty) {
      if (newPassword.value == confirmPassword.value) {
        // Replace this with your password reset logic (e.g., API call)
        print("Password successfully updated: ${newPassword.value}");
      } else {
        print("Passwords do not match");
      }
    } else {
      print("Both fields are required.");
    }
  }
}
