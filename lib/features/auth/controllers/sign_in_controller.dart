// lib/features/auth/controllers/sign_in_controller.dart
import 'package:get/get.dart';

class SignInController extends GetxController {
  // Reactive variables for email and password
  var email = ''.obs;
  var password = ''.obs;

  // Sign In action (simulated)
  void signIn() {
    if (email.isNotEmpty && password.isNotEmpty) {
      // Add your sign-in logic here (e.g., API call)
      print("Sign in successful with email: $email and password: $password");
    } else {
      print("Email or password is missing");
    }
  }
}
