// lib/controllers/signup_controller.dart
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  // Reactive variables to store user input
  var fullName = ''.obs;
  var email = ''.obs;
  var mobileNumber = ''.obs;
  var password = ''.obs;
  var rePassword = ''.obs;

  // Validation methods (example)
  bool validateForm() {
    return fullName.isNotEmpty &&
        email.isNotEmpty &&
        mobileNumber.isNotEmpty &&
        password.isNotEmpty &&
        password == rePassword;
  }

  // Sign Up action (simulated)
  void signUp() {
    if (validateForm()) {
      // Add your sign-up logic here (e.g., API call)
      debugPrint("Sign up successful!");
    } else {
      debugPrint("Form is invalid.");
    }
  }
}
