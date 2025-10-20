// lib/features/auth/controllers/otp_controller.dart
import 'package:get/get.dart';

class OtpController extends GetxController {
  // Reactive variable to store OTP digits (6 digits)
  var otp = [''.obs, ''.obs, ''.obs, ''.obs, ''.obs, ''.obs].obs;

  // OTP verification method
  void verifyOtp() {
    if (otp.every((digit) => digit.isNotEmpty)) {
      // Replace this with your API call for OTP verification
      print("OTP Verified: ${otp.join()}");
    } else {
      print("Please enter a complete OTP.");
    }
  }

  // Resend OTP logic (simulated)
  void resendOtp() {
    print("Resending OTP...");
    // Add your resend OTP API call here
  }
}
