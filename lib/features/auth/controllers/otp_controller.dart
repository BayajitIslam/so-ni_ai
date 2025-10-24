// lib/features/auth/controllers/otp_controller.dart
import 'package:get/get.dart';
import 'package:template/core/constants/translations.dart';
import 'package:template/routes/routes_name.dart';

class OtpController extends GetxController {
  // Reactive variable to store OTP digits (6 digits)
  var otp = [''.obs, ''.obs, ''.obs, ''.obs, ''.obs, ''.obs].obs;

  var isForgotPasswordFlow =
      false.obs; // Flag to differentiate between Sign Up and Forgot Password

  // Set whether the flow is for Forgot Password or Sign Up
  void setFlow(bool isForgotPassword) {
    isForgotPasswordFlow.value = isForgotPassword;
  }

  // Verify OTP for SignUp
  void verifyOtp() {
    if (otp.every((digit) => digit.isNotEmpty)) {
      if (isForgotPasswordFlow.value) {
        // Logic for password reset using OTP
        print("Password reset with OTP: ${otp.join()}");
        Get.toNamed(
          RoutesName.accountCreatedSuccessfull,
          arguments: AppString.passwordUpdateSuccessfully,
        );
      } else {
        // Logic for verifying OTP during Sign Up
        print("Account verified with OTP: ${otp.join()}");
        Get.toNamed(
          RoutesName.accountCreatedSuccessfull,
          arguments: AppString.accouintCreateSuccesfull,
        );
      }
    } else {
      print("Please enter the complete OTP.");
    }
  }

  // Resend OTP logic (simulated)
  void resendOtp() {
    print("Resending OTP...");
    // Add your resend OTP API call here
  }
}
