// lib/features/auth/controllers/sign_in_controller.dart
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:template/routes/routes_name.dart';

class SignInController extends GetxController {
  // Reactive variables for email and password
  var email = ''.obs;
  var password = ''.obs;

  // Sign In action (simulated)
  void signIn() {
    if (email.isNotEmpty && password.isNotEmpty) {
      // Add your sign-in logic here (e.g., API call)
      debugPrint("Sign in successful with email: $email and password: $password");
      Get.toNamed(RoutesName.ageSelection,arguments: "next_pages");
    } else {
      debugPrint("Email or password is missing");
    }
  }
}
