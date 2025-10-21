// ignore_for_file: await_only_futures

import 'dart:async';
import 'package:get/get.dart';
import 'package:template/routes/routes_name.dart';

class SplashController extends GetxService {
  Timer? timer;
  var opacity = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      if (opacity.value != 1.0) {
        opacity.value += 0.5;
      }
    });

    Future.delayed(const Duration(seconds: 3), () async {
      Get.offNamed(RoutesName.onboarding1);
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
