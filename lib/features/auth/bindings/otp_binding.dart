// lib/features/auth/bindings/otp_binding.dart
import 'package:get/get.dart';
import 'package:template/features/auth/controllers/otp_controller.dart';

class OtpBinding extends Bindings {
  @override
  void dependencies() {
    // Bind the OtpController when navigating to the OTP screen
    Get.put(OtpController());
  }
}
