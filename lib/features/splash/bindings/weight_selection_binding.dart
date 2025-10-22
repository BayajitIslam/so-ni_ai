import 'package:get/get.dart';
import 'package:template/features/splash/controllers/measurement_controller.dart';

class WeightSelectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MeasurementController(), fenix: true);
  }
}
